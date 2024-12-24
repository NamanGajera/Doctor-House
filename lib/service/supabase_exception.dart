import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFailure implements Exception {
  final String message;
  SupabaseFailure({required this.message});
  @override
  String toString() => message;
}

class SupabaseErrorHandler {
  static SupabaseFailure handle(dynamic e) {
    if (e is AuthException) {
      return _handleAuthException(e);
    } else if (e is PostgrestException) {
      return _handlePostgrestException(e);
    }  else if (e is StorageException) {
      return _handleStorageException(e);
    } else if (e is SocketException) {
      return SupabaseFailure(message: 'Network connection error');
    }
    return SupabaseFailure(message: e.toString());
  }

  static SupabaseFailure _handleAuthException(AuthException e) {
    switch (e.message) {
      case 'Email not confirmed':
        return SupabaseFailure(message: 'Please verify your email');
      case 'Invalid login credentials':
        return SupabaseFailure(message: 'Invalid email or password');
      case 'Email already registered':
        return SupabaseFailure(message: 'Email is already in use');
      case 'Weak password':
        return SupabaseFailure(message: 'Password is too weak');
      case 'Invalid email':
        return SupabaseFailure(message: 'Invalid email address');
      case 'User not found':
        return SupabaseFailure(message: 'User not found');
      case 'Token expired':
        return SupabaseFailure(message: 'Session has expired. Please log in again.');
      case 'Invalid token':
        return SupabaseFailure(message: 'Invalid or malformed token.');
      case 'User already signed in':
        return SupabaseFailure(message: 'User is already signed in.');
      default:
        return SupabaseFailure(message: e.message);
    }
  }

  static SupabaseFailure _handlePostgrestException(PostgrestException e) {
    switch (e.code) {
      case '23505': // unique_violation
        return SupabaseFailure(message: 'Record already exists');
      case '23503': // foreign_key_violation
        return SupabaseFailure(message: 'Referenced record does not exist');
      case '42P01': // undefined_table
        return SupabaseFailure(message: 'Table not found');
      case '42501': // insufficient_privilege
        return SupabaseFailure(message: 'Insufficient permissions');
      case '22P02': // invalid_text_representation
        return SupabaseFailure(message: 'Invalid input format');
      case '42703': // undefined_column
        return SupabaseFailure(message: 'Undefined column in query');
      case '42883': // undefined_function
        return SupabaseFailure(message: 'Undefined function in query');
      default:
        return SupabaseFailure(message: e.message);
    }
  }


  static SupabaseFailure _handleStorageException(StorageException e) {
    switch (e.statusCode) {
      case 400:
        return SupabaseFailure(message: 'Bad request. Check your input.');
      case 403:
        return SupabaseFailure(message: 'Permission denied for this operation.');
      case 404:
        return SupabaseFailure(message: 'File or bucket not found.');
      case 413:
        return SupabaseFailure(message: 'File size exceeds the allowable limit.');
      case 429:
        return SupabaseFailure(message: 'Too many requests. Please try again later.');
      case 500:
        return SupabaseFailure(message: 'Internal server error. Try again later.');
      default:
        return SupabaseFailure(message: 'Storage error: ${e.message}');
    }
  }
}
