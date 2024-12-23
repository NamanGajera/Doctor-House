import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../models/user_model.dart';
import '../../../service/firebase_service_exception.dart';
import '../../../service/firebase_services.dart';

class UserProfileRepository {
  final FirebaseService _firebaseService;
  static const String _collection = 'users';
  static const String _storagePrefix = 'user_profiles';

  UserProfileRepository(this._firebaseService);

  /// Create a new user
  Future<void> createUser(UserModel user) async {
    try {
      await _firebaseService.addDocumentWithId(
        collection: _collection,
        documentId: user.id,
        data: user.toFirestore(),
      );
    } catch (e) {
      throw FirebaseFailure(
        message: 'Failed to create user',
      );
    }
  }

  /// Get user by ID
  Future<UserModel?> getUserById(String userId) async {
    try {
      final doc = await _firebaseService.getDocument(
        collection: _collection,
        documentId: userId,
      );

      if (!doc.exists) return null;

      return UserModel.fromFirestore(
        doc.data() as Map<String, dynamic>,
        doc.id,
      );
    } catch (e) {
      throw FirebaseFailure(
        message: 'Failed to fetch user',
      );
    }
  }

  /// Update user profile
  Future<void> updateUser(UserModel user) async {
    try {
      await _firebaseService.updateDocument(
        collection: _collection,
        documentId: user.id,
        data: user.toFirestore(),
        merge: true,
      );
    } catch (e) {
      throw FirebaseFailure(
        message: 'Failed to update user',
      );
    }
  }



  /// Upload user profile picture
  Future<String> uploadProfilePicture(String userId, File imageFile) async {
    try {
      return await _firebaseService.uploadFile(
        path: '$_storagePrefix/$userId.jpg',
        file: imageFile,
        contentType: 'image/jpeg',
        onProgress: (progress) {
          // Handle upload progress
          print('Upload progress: ${(progress * 100).toStringAsFixed(2)}%');
        },
      );
    } catch (e) {
      throw FirebaseFailure(
        message: 'Failed to upload profile picture',
      );
    }
  }

  /// Get users by role
  Future<List<UserModel>> getUsersByRole(String role, {int limit = 50}) async {
    try {
      final snapshot = await _firebaseService.getDocuments(
        collection: _collection,
        whereConditions: [
          ['role', '==', role],
          ['isActive', '==', true],
        ],
        limit: limit,
      );

      return snapshot.docs.map((doc) =>
          UserModel.fromFirestore(doc.data() as Map<String, dynamic>, doc.id)
      ).toList();
    } catch (e) {
      throw FirebaseFailure(
        message: 'Failed to fetch users by role',
      );
    }
  }

  /// Search users by name
  Future<List<UserModel>> searchUsers(String query, {int limit = 10}) async {
    try {
      final snapshot = await _firebaseService.getDocuments(
        collection: _collection,
        whereConditions: [
          ['fullName', '>=', query],
          ['fullName', '<=', query + '\uf8ff'],
          ['isActive', '==', true],
        ],
        orderBy: 'fullName',
        limit: limit,
      );

      return snapshot.docs.map((doc) =>
          UserModel.fromFirestore(doc.data() as Map<String, dynamic>, doc.id)
      ).toList();
    } catch (e) {
      throw FirebaseFailure(
        message: 'Failed to search users',
      );
    }
  }

  /// Update user's last login
  Future<void> updateLastLogin(String userId) async {
    try {
      await _firebaseService.updateDocument(
        collection: _collection,
        documentId: userId,
        data: {
          'lastLoginAt': Timestamp.fromDate(DateTime.now()),
        },
        merge: true,
      );
    } catch (e) {
      throw FirebaseFailure(
        message: 'Failed to update last login',
      );
    }
  }

  /// Add device token for push notifications
  Future<void> addDeviceToken(String userId, String token) async {
    try {
      await _firebaseService.updateDocument(
        collection: _collection,
        documentId: userId,
        data: {
          'deviceTokens': FieldValue.arrayUnion([token]),
        },
        merge: true,
      );
    } catch (e) {
      throw FirebaseFailure(
        message: 'Failed to add device token',
      );
    }
  }

  /// Remove device token
  Future<void> removeDeviceToken(String userId, String token) async {
    try {
      await _firebaseService.updateDocument(
        collection: _collection,
        documentId: userId,
        data: {
          'deviceTokens': FieldValue.arrayRemove([token]),
        },
        merge: true,
      );
    } catch (e) {
      throw FirebaseFailure(
        message: 'Failed to remove device token',
      );
    }
  }

  /// Stream user updates
  Stream<UserModel?> streamUser(String userId) {
    try {
      return _firebaseService
          .streamDocuments(
        collection: _collection,
        whereConditions: [
          ['id', '==', userId],
        ],
        limit: 1,
      )
          .map((snapshot) {
        if (snapshot.docs.isEmpty) return null;
        return UserModel.fromFirestore(
          snapshot.docs.first.data() as Map<String, dynamic>,
          snapshot.docs.first.id,
        );
      });
    } catch (e) {
      throw FirebaseFailure(
        message: 'Failed to stream user updates',
      );
    }
  }

  /// Get paginated users
  Future<QuerySnapshot> getPaginatedUsers({
    required int pageSize,
    DocumentSnapshot? lastDocument,
    String? role,
  }) async {
    try {
      List<List<dynamic>> whereConditions = [
        ['isActive', '==', true],
      ];

      if (role != null) {
        whereConditions.add(['role', '==', role]);
      }

      return await _firebaseService.getPaginatedDocuments(
        collection: _collection,
        pageSize: pageSize,
        lastDocument: lastDocument,
        whereConditions: whereConditions,
        orderBy: 'createdAt',
        descending: true,
      );
    } catch (e) {
      throw FirebaseFailure(
        message: 'Failed to fetch paginated users',
      );
    }
  }

  /// Deactivate user
  Future<void> deactivateUser(String userId) async {
    try {
      await _firebaseService.updateDocument(
        collection: _collection,
        documentId: userId,
        data: {
          'isActive': false,
          'updatedAt': Timestamp.fromDate(DateTime.now()),
        },
        merge: true,
      );
    } catch (e) {
      throw FirebaseFailure(
        message: 'Failed to deactivate user',
      );
    }
  }
}