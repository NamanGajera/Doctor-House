import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> loginWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Fetch user details from Firestore
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          // Map Firestore data to UserModel using documentId
          UserModel loggedInUser = UserModel.fromFirestore(
            userDoc.data() as Map<String, dynamic>,
            user.uid, // Passing the document ID as the second argument
          );
          return loggedInUser;
        } else {
          throw Exception("User details not found in Firestore.");
        }
      }
      return null;
    } on FirebaseAuthException catch (e){
      rethrow;
    }
    catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  Future<UserModel?> registerWithEmail(
      String email, String password, String fullName) async {
    try {
      UserCredential userCredential =
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Create a new UserModel
        UserModel newUser = UserModel(
          id: user.uid,
          fullName: fullName,
          email: email,
          createdAt: DateTime.now().toLocal(),
          role: '3',
        );

        // Save user data to Firestore
        await _firestore
            .collection('users')
            .doc(newUser.id)
            .set(newUser.toFirestore());

        return newUser;
      }
      return null;
    } on FirebaseAuthException catch (e){
      rethrow;
    }
    catch (e) {
      throw Exception("Registration failed: ${e.toString()}");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

/// User Role
/// 1. Admin
/// 2. Doctor
/// 3. Patient