import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseFailure {
  final String message;
  const FirebaseFailure(this.message);
}

// Authentication-specific failures
class EmailAlreadyInUseFailure extends FirebaseFailure {
  const EmailAlreadyInUseFailure() : super('Email is already in use');
}

class WeakPasswordFailure extends FirebaseFailure {
  const WeakPasswordFailure() : super('Password is too weak');
}

class InvalidEmailFailure extends FirebaseFailure {
  const InvalidEmailFailure() : super('Invalid email address');
}

class OperationNotAllowedFailure extends FirebaseFailure {
  const OperationNotAllowedFailure() : super('Operation not allowed');
}

class UserNotFoundFailure extends FirebaseFailure {
  const UserNotFoundFailure() : super('User not found');
}

class WrongPasswordFailure extends FirebaseFailure {
  const WrongPasswordFailure() : super('Incorrect password');
}

class UserDisabledFailure extends FirebaseFailure {
  const UserDisabledFailure() : super('User account is disabled');
}

class UidAlreadyExistsFailure extends FirebaseFailure {
  const UidAlreadyExistsFailure() : super('UID already exists');
}

class PhoneNumberAlreadyExistsFailure extends FirebaseFailure {
  const PhoneNumberAlreadyExistsFailure() : super('Phone number is already in use');
}

class AccountExistsWithDifferentCredentialsFailure extends FirebaseFailure {
  const AccountExistsWithDifferentCredentialsFailure() : super('Account exists with different credentials');
}

class InvalidVerificationIdFailure extends FirebaseFailure {
  const InvalidVerificationIdFailure() : super('Invalid verification ID');
}

class InvalidVerificationCodeFailure extends FirebaseFailure {
  const InvalidVerificationCodeFailure() : super('Invalid verification code');
}

// Common/general Firebase failures
class NetworkFailure extends FirebaseFailure {
  const NetworkFailure() : super('Network error occurred');
}

class TimeoutFailure extends FirebaseFailure {
  const TimeoutFailure() : super('Request timed out');
}

class PermissionDeniedFailure extends FirebaseFailure {
  const PermissionDeniedFailure() : super('Permission denied');
}

class InvalidCredentialFailure extends FirebaseFailure {
  const InvalidCredentialFailure() : super('Invalid credentials');
}

class UnknownFailure extends FirebaseFailure {
  const UnknownFailure(String message) : super(message);
}

FirebaseFailure handleFirebaseException(FirebaseException exception) {
  switch (exception.code) {
    case 'email-already-in-use':
      return const EmailAlreadyInUseFailure();
    case 'weak-password':
      return const WeakPasswordFailure();
    case 'invalid-email':
      return const InvalidEmailFailure();
    case 'operation-not-allowed':
      return const OperationNotAllowedFailure();
    case 'user-not-found':
      return const UserNotFoundFailure();
    case 'wrong-password':
      return const WrongPasswordFailure();
    case 'user-disabled':
      return const UserDisabledFailure();
    case 'uid-already-exists':
      return const UidAlreadyExistsFailure();
    case 'phone-number-already-exists':
      return const PhoneNumberAlreadyExistsFailure();
    case 'account-exists-with-different-credential':
      return const AccountExistsWithDifferentCredentialsFailure();
    case 'invalid-verification-id':
      return const InvalidVerificationIdFailure();
    case 'invalid-verification-code':
      return const InvalidVerificationCodeFailure();
    case 'network-request-failed':
      return const NetworkFailure();
    case 'permission-denied':
      return const PermissionDeniedFailure();
    case 'timeout':
      return const TimeoutFailure();
    case 'invalid-credential':
      return const InvalidCredentialFailure();
    default:
      return UnknownFailure(exception.message ?? 'An unknown error occurred');
  }
}
