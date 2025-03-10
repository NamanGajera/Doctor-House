import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:doctor_house/core/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../constants/api_end_point.dart';
import 'api_exceptions.dart';

class ApiService {
  http.Client? httpClient;

  ApiService({http.Client? httpClient}) {
    this.httpClient = httpClient ?? http.Client();
  }

  Map<String, String> _getHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    // Add auth token only if it exists in constants
    if (accessToken != null) {
      headers['Authorization'] = '$accessToken';
    }

    return headers;
  }

  // GET Request
  Future<dynamic> get(String endpoint) async {
    try {
      log('Api Route $baseUrl$endpoint');
      final response = await httpClient?.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: _getHeaders(),
      );
      return _handleResponse(response!);
    } on SocketException {
      throw ConnectionException('No internet connection');
    } on http.ClientException catch (e) {
      throw ClientException(e.message);
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  // POST Request
  Future<dynamic> post(String endpoint, {dynamic body}) async {
    try {
      log('Api Route $baseUrl$endpoint');
      final response = await httpClient?.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: _getHeaders(),
        body: json.encode(body),
      );
      return _handleResponse(response!);
    } on SocketException {
      throw ConnectionException('No internet connection');
    } on http.ClientException catch (e) {
      throw ClientException(e.message);
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  // PUT Request
  Future<dynamic> put(String endpoint, dynamic body) async {
    try {
      log('Api Route $baseUrl$endpoint');
      final response = await httpClient?.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: _getHeaders(),
        body: json.encode(body),
      );
      return _handleResponse(response!);
    } on SocketException {
      throw ConnectionException('No internet connection');
    } on http.ClientException catch (e) {
      throw ClientException(e.message);
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  Future<dynamic> multipartPostApiCall(
    String endPoint, {
    String? fileKey,
    Map<String, dynamic>? fields,
  }) async {
    var getUrl = '$baseUrl$endPoint';
    var request = http.MultipartRequest('POST', Uri.parse(getUrl));

    request.headers.addAll(_getHeaders());

    // Add form fields if provided
    if (fields != null) {
      for (var key in fields.keys) {
        var value = fields[key];
        log('Value $key >>> $value');
        log('Value Runtime Type $key >>> ${value.runtimeType}');

        if (key == (fileKey ?? "profileImage") && value is List<File>) {
          List<File> attachments = value;
          log('attachments $attachments');

          for (var entry in attachments) {
            log('entry $entry');
            String fileExtension = entry.path.split('.').last.toLowerCase();
            MediaType contentType;

            if (['jpg', 'jpeg', 'png', 'gif', 'bmp'].contains(fileExtension)) {
              contentType = MediaType('image', fileExtension);
            } else if (['mp4', 'mov', 'avi', 'mkv', 'flv'].contains(fileExtension)) {
              contentType = MediaType('video', fileExtension);
            } else {
              continue; // Skip unsupported files
            }

            log('path ${entry.path} contentType $contentType');

            request.files.add(await http.MultipartFile.fromPath(key, entry.path, contentType: contentType));
          }
        } else if (key == (fileKey ?? "profileImage") && (value is File)) {
          String fileExtension = value.path.split('.').last.toLowerCase();
          MediaType contentType;

          if (['jpg', 'jpeg', 'png', 'gif', 'bmp'].contains(fileExtension)) {
            contentType = MediaType('image', fileExtension);
            request.files.add(await http.MultipartFile.fromPath(key, value.path, contentType: contentType));
          } else if (['mp4', 'mov', 'avi', 'mkv', 'flv'].contains(fileExtension)) {
            contentType = MediaType('video', fileExtension);
            request.files.add(await http.MultipartFile.fromPath(key, value.path, contentType: contentType));
          }
        } else {
          request.fields[key] = value.toString();
        }
      }
    }

    log("Multipart POST URL: $getUrl");

    var postResponseJson;

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      postResponseJson = _handleResponse(response);
    } on SocketException {
      throw ConnectionException('No internet connection');
    } on http.ClientException catch (e) {
      throw ClientException(e.message);
    } catch (e) {
      throw UnknownException(e.toString());
    }

    return postResponseJson;
  }

  // Handle API response
  dynamic _handleResponse(http.Response response) {
    final responseBody = json.decode(response.body);
    switch (response.statusCode) {
      case 200:
        return responseBody;
      case 400:
        log("Status Code==>> 400 Error ==>> ${responseBody["message"]}");
        throw BadRequestException('${responseBody["message"]}');
      case 401:
        log("Status Code==>> 401 Error ==>> ${responseBody["message"]}");
        throw UnauthorizedException('${responseBody["message"]}');
      case 403:
        log("Status Code==>> 403 Error ==>> ${responseBody["message"]}");
        throw ForbiddenException('${responseBody["message"]}');
      case 404:
        log("Status Code==>> 404 Error ==>> ${responseBody["message"]}");
        throw NotFoundException('${responseBody["message"]}');
      case 422:
        log("Status Code==>> 422 Error ==>> ${responseBody["message"]}");
        throw ValidationException('${responseBody["message"]}');
      case 500:
        log("Status Code==>> 500 Error ==>> ${responseBody["message"]}");
        throw ServerException('${responseBody["message"]}');
      default:
        throw UnknownException('Unknown error occurred with status code: ${response.statusCode}');
    }
  }
}
