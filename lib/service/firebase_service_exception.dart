import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFailure implements Exception {
  final String message;

  FirebaseFailure({
    required this.message,
  });

  @override
  String toString() => message;
}


class FirebaseErrorHandler {
  // Main handler for both FirebaseException and SocketException
  static FirebaseFailure handle(dynamic e) {
    if (e is FirebaseException) {
      return _handleFirebaseException(e);
    } else if (e is SocketException) {
      return FirebaseFailure(
        message: 'Network connection error',
      );
    } else {
      return FirebaseFailure(
        message: e.toString(),
      );
    }
  }

  // FirebaseException-specific handling
  static FirebaseFailure _handleFirebaseException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return FirebaseFailure(
          message: 'Insufficient permissions to perform this operation',
        );
      case 'not-found':
        return FirebaseFailure(
          message: 'The requested document or resource was not found',
        );
      case 'already-exists':
        return FirebaseFailure(
          message: 'The document already exists and cannot be overwritten',
        );
      case 'resource-exhausted':
        return FirebaseFailure(
          message: 'Quota exceeded or rate limit reached',
        );
      case 'failed-precondition':
        return FirebaseFailure(
          message: 'Operation failed due to a precondition not being met',
        );
      case 'aborted':
        return FirebaseFailure(
          message: 'Operation was aborted',
        );
      case 'out-of-range':
        return FirebaseFailure(
          message: 'Operation was attempted past the valid range',
        );
      case 'unimplemented':
        return FirebaseFailure(
          message: 'Operation is not implemented or supported',
        );
      case 'internal':
        return FirebaseFailure(
          message: 'Internal error occurred in Firebase service',
        );
      case 'unavailable':
        return FirebaseFailure(
          message: 'Service is currently unavailable',
        );
      case 'data-loss':
        return FirebaseFailure(
          message: 'Unrecoverable data loss or corruption',
        );
      case 'unauthenticated':
        return FirebaseFailure(
          message: 'User is not authenticated',
        );
      case 'network-request-failed':
        return FirebaseFailure(
          message: 'Network request failed',
        );
      case 'timeout':
        return FirebaseFailure(
          message: 'Request timed out',
        );
      case 'email-already-in-use':
        return FirebaseFailure(
          message: 'Email is already in use',
        );
      case 'weak-password':
        return FirebaseFailure(
            message: 'Password is too weak'
        );
      case 'invalid-email':
        return FirebaseFailure(
            message: 'Invalid email address'
        );
      case 'operation-not-allowed':
        return FirebaseFailure(
            message: 'Operation not allowed'
        );
      case 'user-not-found':
        return FirebaseFailure(
            message: 'User not found'
        );
      case 'wrong-password':
        return FirebaseFailure(
            message: 'Incorrect password'
        );
      case 'user-disabled':
        return FirebaseFailure(
            message: 'User account is disabled'
        );
      case 'uid-already-exists':
        return FirebaseFailure(
            message: 'UID already exists'
        );
      case 'phone-number-already-exists':
        return FirebaseFailure(
            message: 'Phone number is already in use'
        );
      case 'account-exists-with-different-credentials':
        return FirebaseFailure(
            message: 'Account exists with different credentials'
        );
      case 'invalid-verification-id':
        return FirebaseFailure(
            message: 'Invalid verification ID'
        );
      case 'invalid-verification-code':
        return FirebaseFailure(
            message: 'Invalid verification code'
        );
      case 'object-not-found':
        return FirebaseFailure(
            message: 'Object not found'
        );
      case 'invalid-credential':
        return FirebaseFailure(
            message: 'Invalid credentials'
        );
      default:
        return FirebaseFailure(
          message: e.message ?? 'An unknown Firebase error occurred',
        );
    }
  }
}