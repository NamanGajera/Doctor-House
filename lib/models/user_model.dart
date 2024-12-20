import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id; // User's unique ID
  final String fullName; // Full name of the user
  final String email; // Email address
  final DateTime createdAt; // Account creation timestamp
  final String role; // User role (e.g., 'user', 'admin')
  final String? profilePicture; // URL of profile picture (optional)
  final String? phoneNumber; // Phone number (optional)

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.createdAt,
    required this.role,
    this.profilePicture,
    this.phoneNumber,
  });

  // Convert Firestore document to UserModel
  factory UserModel.fromFirestore(Map<String, dynamic> data, String documentId) {
    return UserModel(
      id: documentId,
      fullName: data['fullName'] ?? '',
      email: data['email'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      role: data['role'] ?? 'user',
      profilePicture: data['profilePicture'],
      phoneNumber: data['phoneNumber'],
    );
  }

  // Convert UserModel to Firestore format
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'createdAt': createdAt,
      'role': role,
      'profilePicture': profilePicture,
      'phoneNumber': phoneNumber,
    };
  }
}
