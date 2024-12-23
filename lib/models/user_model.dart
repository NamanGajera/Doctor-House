
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String? fullName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final DateTime? createdAt;
  final String? role;
  final String? profilePicture;
  final String? phoneNumber;
  final bool? isActive;
  final DateTime? lastLoginAt;
  final Map<String, dynamic>? settings;
  final List<String>? deviceTokens;
  final DateTime? updatedAt;

  UserModel({
    required this.id,
    this.fullName,
    this.email,
    this.createdAt,
    this.role,
    this.firstName,
    this.lastName,
    this.profilePicture,
    this.phoneNumber,
    this.isActive = true,
    this.lastLoginAt,
    this.settings,
    this.deviceTokens,
    this.updatedAt,
  });

  // Create a copy of UserModel with optional field updates
  UserModel copyWith({
    String? fullName,
    String? email,
    String? role,
    String? profilePicture,
    String? phoneNumber,
    bool? isActive,
    DateTime? lastLoginAt,
    Map<String, dynamic>? settings,
    List<String>? deviceTokens,
  }) {
    return UserModel(
      id: this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      createdAt: this.createdAt,
      role: role ?? this.role,
      profilePicture: profilePicture ?? this.profilePicture,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isActive: isActive ?? this.isActive,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      settings: settings ?? this.settings,
      deviceTokens: deviceTokens ?? this.deviceTokens,
      updatedAt: DateTime.now(),
    );
  }

  factory UserModel.fromFirestore(Map<String, dynamic> data, String documentId) {
    return UserModel(
      id: documentId,
      fullName: data['fullName'] ?? '',
      email: data['email'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      role: data['role'] ?? 'user',
      profilePicture: data['profilePicture'],
      phoneNumber: data['phoneNumber'],
      isActive: data['isActive'] ?? true,
      lastLoginAt: data['lastLoginAt'] != null
          ? (data['lastLoginAt'] as Timestamp).toDate()
          : null,
      settings: data['settings'] as Map<String, dynamic>?,
      deviceTokens: (data['deviceTokens'] as List<dynamic>?)?.cast<String>(),
      updatedAt: data['updatedAt'] != null
          ? (data['updatedAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'fullName': fullName,
      'email': email,
      'createdAt': Timestamp.fromDate(createdAt ?? DateTime.now().toLocal()),
      'role': role,
      'profilePicture': profilePicture,
      'phoneNumber': phoneNumber,
      'isActive': isActive,
      'lastLoginAt': lastLoginAt != null ? Timestamp.fromDate(lastLoginAt!) : null,
      'settings': settings,
      'deviceTokens': deviceTokens,
      'updatedAt': Timestamp.fromDate(DateTime.now()),
    }..removeWhere((key, value) => value == null);
  }
}