import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:doctor_house/core/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

import '../constants/api_end_point.dart';
import 'api_exceptions.dart';

class ApiService {
  http.Client? httpClient;

  ApiService({http.Client? httpClient}) {
    this.httpClient = httpClient ?? http.Client();
  }

  Map<String, String> _getHeaders({bool isMultipart = false}) {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    // Add content type only if not multipart
    if (!isMultipart) {
      headers['Content-Type'] = 'application/json';
    }

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

  // Multipart POST Request
  Future<dynamic> multipartPost(String endpoint, Map<String, dynamic> data) async {
    try {
      log('Api Route $baseUrl$endpoint');
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl$endpoint'),
      );

      // Add headers
      request.headers.addAll(_getHeaders(isMultipart: true));

      // Process all data (both text fields and files)
      await _processMultipartData(request, data);

      // Send the request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } on SocketException {
      throw ConnectionException('No internet connection');
    } on http.ClientException catch (e) {
      throw ClientException(e.message);
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  // Multipart PUT Request
  Future<dynamic> multipartPut(String endpoint, Map<String, dynamic> data) async {
    try {
      log('Api Route $baseUrl$endpoint');
      final request = http.MultipartRequest(
        'PUT',
        Uri.parse('$baseUrl$endpoint'),
      );

      // Add headers
      request.headers.addAll(_getHeaders(isMultipart: true));

      // Process all data (both text fields and files)
      await _processMultipartData(request, data);

      // Send the request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } on SocketException {
      throw ConnectionException('No internet connection');
    } on http.ClientException catch (e) {
      throw ClientException(e.message);
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  // Helper method to process multipart data
  Future<void> _processMultipartData(http.MultipartRequest request, Map<String, dynamic> data) async {
    for (var entry in data.entries) {
      final key = entry.key;
      final value = entry.value;

      if (value is File) {
        // Handle File objects
        await _addFileToRequest(request, key, value);
      } else if (value is List<File>) {
        // Handle List of File objects (for multiple files with same field name)
        for (int i = 0; i < value.length; i++) {
          await _addFileToRequest(request, '${key}[$i]', value[i]);
        }
      } else if (value is Map) {
        // Handle nested Maps by converting to JSON string
        request.fields[key] = json.encode(value);
      } else if (value is List) {
        // Handle Lists by converting to JSON string
        request.fields[key] = json.encode(value);
      } else {
        // Handle primitive values (String, int, bool, etc.)
        request.fields[key] = value?.toString() ?? '';
      }
    }
  }

  // Helper method to add a single file to request
  Future<void> _addFileToRequest(http.MultipartRequest request, String fieldName, File file) async {
    final fileName = path.basename(file.path);

    // Detect the file's MIME type
    final mimeType = lookupMimeType(file.path);

    if (mimeType != null) {
      final splitMimeType = mimeType.split('/');
      final mediaType = splitMimeType[0];
      final subType = splitMimeType[1];

      // Create a multipart file
      final multipartFile = await http.MultipartFile.fromPath(
        fieldName,
        file.path,
        contentType: MediaType(mediaType, subType),
      );

      request.files.add(multipartFile);
    } else {
      // If MIME type detection fails, use a generic type
      final multipartFile = await http.MultipartFile.fromPath(
        fieldName,
        file.path,
        contentType: MediaType('application', 'octet-stream'),
      );

      request.files.add(multipartFile);
    }
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
