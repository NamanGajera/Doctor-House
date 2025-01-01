class UserModel {
  final String id;
  final dynamic fullName;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic email;
  final DateTime? createdAt;
  final dynamic role;
  final dynamic profilePicture;
  final dynamic phoneNumber;
  final DateTime? updatedAt;
  final bool? isProfileDone;

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
    this.updatedAt,
    this.isProfileDone,
  });

  UserModel copyWith({
    dynamic fullName,
    dynamic email,
    dynamic role,
    dynamic profilePicture,
    dynamic phoneNumber,
    dynamic isProfileDone,
  }) {
    return UserModel(
      id: id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      createdAt: createdAt,
      role: role ?? this.role,
      profilePicture: profilePicture ?? this.profilePicture,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isProfileDone: isProfileDone ?? this.isProfileDone,
      updatedAt: DateTime.now(),
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> data, String id) {
    return UserModel(
      id: id,
      fullName: data['full_name'],
      email: data['email'],
      createdAt: data['created_at'] != null ? DateTime.parse(data['created_at']) : null,
      role: data['role'] ?? 'user',
      profilePicture: data['profile_picture'],
      phoneNumber: data['phone_number'],
      updatedAt: data['updated_at'] != null ? DateTime.parse(data['updated_at']) : null,
      isProfileDone: data['isProfileDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'created_at': createdAt?.toIso8601String() ?? DateTime.now().toUtc().toIso8601String(),
      'role': role,
      'profile_picture': profilePicture,
      'phone_number': phoneNumber,
      'isProfileDone': isProfileDone,
      'updated_at': DateTime.now().toUtc().toIso8601String(),
    }..removeWhere((key, value) => value == null);
  }
}
