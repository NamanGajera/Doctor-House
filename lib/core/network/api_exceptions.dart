class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

class ConnectionException extends ApiException {
  ConnectionException(super.message);
}

class ClientException extends ApiException {
  ClientException(super.message);
}

class BadRequestException extends ApiException {
  BadRequestException(String message) : super(message, 400);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(String message) : super(message, 401);
}

class ForbiddenException extends ApiException {
  ForbiddenException(String message) : super(message, 403);
}

class NotFoundException extends ApiException {
  NotFoundException(String message) : super(message, 404);
}

class ValidationException extends ApiException {
  ValidationException(String message) : super(message, 422);
}

class ServerException extends ApiException {
  ServerException(String message) : super(message, 500);
}

class UnknownException extends ApiException {
  UnknownException(super.message);
}
