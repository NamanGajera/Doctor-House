import 'dart:developer';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../models/user_model.dart';
import '../../../service/supabase_exception.dart';
import '../../../service/supabase_services.dart';

class UserProfileRepository {
  final SupabaseService _supabaseService;
  static const String _table = 'users';
  static const String _storageBucket = 'user_profiles_pictures';

  UserProfileRepository(this._supabaseService);

  Future<void> createUser(UserModel user) async {
    try {
      await _supabaseService.insert(
        table: _table,
        data: user.toJson(),
      );
    } catch (e) {
      throw SupabaseFailure(message: 'Failed to create user');
    }
  }

  Future<UserModel?> getUserById(String userId) async {
    try {
      final data = await _supabaseService.getRecord(
        table: _table,
        id: userId,
      );
      return UserModel.fromJson(data, userId);
    } catch (e) {
      if (e is PostgrestException && e.code == 'PGRST116') {
        return null;
      }
      throw SupabaseFailure(message: 'Failed to fetch user');
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      log("user data==>> ${{
        'id': user.id,
        ...user.toJson(),
        'updated_at': DateTime.now().toIso8601String(),
      }}");
      await _supabaseService.update(
        table: _table,
        userId: user.id,
        data: {
          'id': user.id,
          ...user.toJson(),
          'updated_at': DateTime.now().toIso8601String(),
        },
      );
    } catch (e) {
      throw SupabaseFailure(message: 'Failed to update user');
    }
  }

  Future<String> uploadProfilePicture(String userId, File imageFile) async {
    try {
      return await _supabaseService.uploadFile(
        bucket: _storageBucket,
        path: userId,
        file: imageFile,
      );
    } catch (e) {
      throw SupabaseFailure(message: 'Failed to upload profile picture');
    }
  }



  Future<void> updateLastLogin(String userId) async {
    try {
      await _supabaseService.upsert(
        table: _table,
        data: {
          'id': userId,
          'last_login_at': DateTime.now().toIso8601String(),
        },
      );
    } catch (e) {
      throw SupabaseFailure(message: 'Failed to update last login');
    }
  }



  Future<void> deactivateUser(String userId) async {
    try {
      await _supabaseService.upsert(
        table: _table,
        data: {
          'id': userId,
          'is_active': false,
          'updated_at': DateTime.now().toIso8601String(),
        },
      );
    } catch (e) {
      throw SupabaseFailure(message: 'Failed to deactivate user');
    }
  }
}