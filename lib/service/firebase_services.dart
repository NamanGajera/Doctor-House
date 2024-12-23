import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'firebase_service_exception.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Configuration for retry mechanism
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 1);

  /// Generic retry mechanism for Firebase operations
  Future<T> _retry<T>(Future<T> Function() operation) async {
    int attempts = 0;
    while (attempts < maxRetries) {
      try {
        return await operation();
      } catch (e) {
        attempts++;
        if (attempts == maxRetries) {
          throw FirebaseErrorHandler.handle(e);
        }
        await Future.delayed(retryDelay * attempts);
      }
    }
    throw FirebaseFailure(
      message: 'Maximum retry attempts exceeded',
    );
  }

  /// Paginated data fetching
  Future<QuerySnapshot> getPaginatedDocuments({
    required String collection,
    required int pageSize,
    DocumentSnapshot? lastDocument,
    List<List<dynamic>>? whereConditions,
    String? orderBy,
    bool? descending,
  }) async {
    try {
      Query query = _firestore.collection(collection);

      // Apply where conditions if provided
      if (whereConditions != null) {
        for (var condition in whereConditions) {
          query = query.where(
            condition[0],
            isEqualTo: condition[1] == '==' ? condition[2] : null,
            isGreaterThan: condition[1] == '>' ? condition[2] : null,
            isLessThan: condition[1] == '<' ? condition[2] : null,
            arrayContains: condition[1] == 'array-contains' ? condition[2] : null,
          );
        }
      }

      // Apply orderBy if provided
      if (orderBy != null) {
        query = query.orderBy(orderBy, descending: descending ?? false);
      }

      // Apply pagination
      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument);
      }

      query = query.limit(pageSize);

      return await _retry(() => query.get());
    } on FirebaseException catch (e) {
      throw FirebaseErrorHandler.handle(e);
    } catch (e) {
      rethrow;
    }
  }

  /// Add new document with auto-generated ID
  Future<DocumentReference> addDocument({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    return await _retry(() => _firestore.collection(collection).add(data));
  }

  /// Add new document with custom ID
  Future<void> addDocumentWithId({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    return await _retry(
          () => _firestore.collection(collection).doc(documentId).set(data),
    );
  }

  /// Add document to a subcollection
  Future<DocumentReference> addToSubCollection({
    required String parentCollection,
    required String parentDocId,
    required String subCollection,
    required Map<String, dynamic> data,
  }) async {
    return await _retry(() => _firestore
        .collection(parentCollection)
        .doc(parentDocId)
        .collection(subCollection)
        .add(data));
  }

  /// Update existing document
  Future<void> updateDocument({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
    bool merge = true,
  }) async {
    return await _retry(
          () => _firestore
          .collection(collection)
          .doc(documentId)
          .set(data, SetOptions(merge: merge)),
    );
  }

  /// Get single document
  Future<DocumentSnapshot> getDocument({
    required String collection,
    required String documentId,
  }) async {
    return await _retry(
          () => _firestore.collection(collection).doc(documentId).get(),
    );
  }

  /// Get multiple documents with query
  Future<QuerySnapshot> getDocuments({
    required String collection,
    List<List<dynamic>>? whereConditions,
    String? orderBy,
    bool? descending,
    int? limit,
  }) async {
    return await _retry(() {
      Query query = _firestore.collection(collection);

      if (whereConditions != null) {
        for (var condition in whereConditions) {
          query = query.where(
            condition[0],
            isEqualTo: condition[1] == '==' ? condition[2] : null,
            isGreaterThan: condition[1] == '>' ? condition[2] : null,
            isLessThan: condition[1] == '<' ? condition[2] : null,
            arrayContains: condition[1] == 'array-contains' ? condition[2] : null,
          );
        }
      }

      if (orderBy != null) {
        query = query.orderBy(orderBy, descending: descending ?? false);
      }

      if (limit != null) {
        query = query.limit(limit);
      }

      return query.get();
    });
  }

  /// Delete document
  Future<void> deleteDocument({
    required String collection,
    required String documentId,
  }) async {
    return await _retry(
          () => _firestore.collection(collection).doc(documentId).delete(),
    );
  }

  /// Upload file to storage with retry and progress
  Future<String> uploadFile({
    required String path,
    required File file,
    String? contentType,
    Function(double)? onProgress,
  }) async {
    return await _retry(() async {
      final ref = _storage.ref().child(path);
      final metadata = contentType != null
          ? SettableMetadata(contentType: contentType)
          : null;

      final uploadTask = ref.putFile(file, metadata);

      if (onProgress != null) {
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          final progress = snapshot.bytesTransferred / snapshot.totalBytes;
          onProgress(progress);
        });
      }

      await uploadTask;
      return await ref.getDownloadURL();
    });
  }

  /// Upload data to storage with retry and progress
  Future<String> uploadData({
    required String path,
    required Uint8List data,
    String? contentType,
    Function(double)? onProgress,
  }) async {
    return await _retry(() async {
      final ref = _storage.ref().child(path);
      final metadata = contentType != null
          ? SettableMetadata(contentType: contentType)
          : null;

      final uploadTask = ref.putData(data, metadata);

      if (onProgress != null) {
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          final progress = snapshot.bytesTransferred / snapshot.totalBytes;
          onProgress(progress);
        });
      }

      await uploadTask;
      return await ref.getDownloadURL();
    });
  }

  /// Delete file from storage
  Future<void> deleteFile(String path) async {
    return await _retry(() => _storage.ref().child(path).delete());
  }

  /// Perform batch write operations with retry
  Future<void> batchWrite(List<BatchOperation> operations) async {
    return await _retry(() async {
      final batch = _firestore.batch();

      for (var operation in operations) {
        final docRef =
        _firestore.collection(operation.collection).doc(operation.documentId);

        switch (operation.type) {
          case BatchOperationType.set:
            batch.set(
                docRef, operation.data!, SetOptions(merge: operation.merge ?? false));
            break;
          case BatchOperationType.update:
            batch.update(docRef, operation.data!);
            break;
          case BatchOperationType.delete:
            batch.delete(docRef);
            break;
        }
      }

      return batch.commit();
    });
  }

  /// Perform transaction with retry
  Future<T> runTransaction<T>(
      Future<T> Function(Transaction transaction) transactionHandler,
      ) async {
    return await _retry(() => _firestore.runTransaction(transactionHandler));
  }

  /// Stream documents with real-time updates
  Stream<QuerySnapshot> streamDocuments({
    required String collection,
    List<List<dynamic>>? whereConditions,
    String? orderBy,
    bool? descending,
    int? limit,
  }) {
    Query query = _firestore.collection(collection);

    if (whereConditions != null) {
      for (var condition in whereConditions) {
        query = query.where(
          condition[0],
          isEqualTo: condition[1] == '==' ? condition[2] : null,
          isGreaterThan: condition[1] == '>' ? condition[2] : null,
          isLessThan: condition[1] == '<' ? condition[2] : null,
          arrayContains: condition[1] == 'array-contains' ? condition[2] : null,
        );
      }
    }

    if (orderBy != null) {
      query = query.orderBy(orderBy, descending: descending ?? false);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    return query.snapshots();
  }
}

// Helper classes remain the same
enum BatchOperationType { set, update, delete }

class BatchOperation {
  final String collection;
  final String documentId;
  final Map<String, dynamic>? data;
  final BatchOperationType type;
  final bool? merge;

  BatchOperation({
    required this.collection,
    required this.documentId,
    this.data,
    required this.type,
    this.merge,
  });
}


// First page
// final firstPage = await firebaseService.getPaginatedDocuments(
// collection: 'users',
// pageSize: 10,
// orderBy: 'name'
// );
//
// // Get next page
// if (firstPage.docs.isNotEmpty) {
// final lastDoc = firstPage.docs.last;
// final nextPage = await firebaseService.getPaginatedDocuments(
// collection: 'users',
// pageSize: 10,
// lastDocument: lastDoc,
// orderBy: 'name'
// );
// }