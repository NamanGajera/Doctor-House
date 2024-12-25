import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../models/user_model.dart';
import '../../../service/supabase_exception.dart';

class SupabaseAuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<UserModel?> loginWithEmail(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      log("Login Response === >> ${user}");

      if (user != null) {
        final userDetails = await _supabase
            .from('users')
            .select()
            .eq('id', user.id)
            .maybeSingle();

        log("Login Response === >> ${userDetails}");

        return UserModel.fromJson(userDetails!, user.id);
      }
      return null;
    } catch (e) {
      throw SupabaseErrorHandler.handle(e);
    }
  }

  Future<UserModel?> registerWithEmail(
      String email, String password, String fullName) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;
      log("Register Response === >> ${user}");
      if (user != null) {
        final newUser = UserModel(
          id: user.id,
          fullName: fullName,
          email: email,
          createdAt: DateTime.now().toLocal(),
          role: '3',
        );

        await _supabase.from('users').insert(newUser.toJson());
        return newUser;
      }
      return null;
    } catch (e) {
      throw SupabaseErrorHandler.handle(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      throw SupabaseErrorHandler.handle(e);
    }
  }
}