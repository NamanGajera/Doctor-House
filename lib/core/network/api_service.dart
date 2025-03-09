import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:doctor_house/core/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

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

  // Multipart Request (for file uploads)
  Future<dynamic> multipartRequest(String endpoint, Map<String, String> fields, List<Map<String, dynamic>> files) async {
    try {
      log('Api Route $baseUrl$endpoint');
      final request = http.MultipartRequest('POST', Uri.parse('$baseUrl$endpoint'));

      // Add headers
      request.headers.addAll(_getHeaders());

      // Add text fields
      request.fields.addAll(fields);

      // Add files
      for (var file in files) {
        final httpFile = await http.MultipartFile.fromPath(
          file['field'] as String,
          file['path'] as String,
          contentType: MediaType(
            file['contentType']?['type'] as String? ?? 'application',
            file['contentType']?['subType'] as String? ?? 'octet-stream',
          ),
          filename: basename(file['path'] as String),
        );
        request.files.add(httpFile);
      }

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
