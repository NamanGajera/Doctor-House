import 'dart:io';
import 'dart:typed_data';
import 'package:doctor_house/service/supabase_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class SupabaseService {
  final SupabaseClient _supabase = Supabase.instance.client;
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 1);

  Future<T> _retry<T>(Future<T> Function() operation) async {
    int attempts = 0;
    while (attempts < maxRetries) {
      try {
        return await operation();
      } catch (e) {
        if (e is PostgrestException || e is AuthException || e is SocketException) {
          attempts++;
          if (attempts == maxRetries) {
            throw SupabaseErrorHandler.handle(e);
          }
          await Future.delayed(retryDelay * attempts);
        } else {
          throw SupabaseFailure(message: 'Unexpected error: $e');
        }
      }
    }
    throw SupabaseFailure(message: 'Maximum retry attempts exceeded');
  }

  Future<Map<String, dynamic>> insert({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    return await _retry(() => _supabase.from(table).insert(data).select().single());
  }

  Future<void> upsert({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    await _retry(() => _supabase.from(table).upsert(data));
  }

  Future<Map<String, dynamic>> getRecord({
    required String table,
    required String id,
  }) async {
    return await _retry(() => _supabase.from(table).select().eq('id', id).single());
  }

  Future<void> deleteRecord({
    required String table,
    required String id,
  }) async {
    await _retry(() => _supabase.from(table).delete().eq('id', id));
  }

  Future<String> uploadFile({
    required String bucket,
    required String path,
    required File file,
  }) async {
    return await _retry(() async {
      final fileExtension = p.extension(file.path);
      final fileName = '${DateTime.now().millisecondsSinceEpoch}$fileExtension';
      final filePath = '$path/$fileName';
      await _supabase.storage.from(bucket).upload(filePath, file);
      return _supabase.storage.from(bucket).getPublicUrl(filePath);
    });
  }

  Future<String> uploadData({
    required String bucket,
    required String path,
    required Uint8List data,
    String? contentType,
  }) async {
    return await _retry(() async {
      final fileName = '${DateTime.now().millisecondsSinceEpoch}${contentType != null ? '.${contentType.split('/').last}' : ''}';
      final filePath = '$path/$fileName';
      await _supabase.storage.from(bucket).uploadBinary(filePath, data);
      return _supabase.storage.from(bucket).getPublicUrl(filePath);
    });
  }
}

enum BatchOperationType { set, update, delete }

class BatchOperation {
  final String table;
  final String? id;
  final Map<String, dynamic>? data;
  final BatchOperationType type;

  BatchOperation({
    required this.table,
    this.id,
    this.data,
    required this.type,
  });
}
