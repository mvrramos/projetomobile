import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? firebaseUser;
  Map<String, dynamic> userData = {};

  bool isLoading = false;

  Future<void> signUp({
    required Map<String, dynamic> userData,
    required String pass,
    required VoidCallback onSuccess,
    required VoidCallback onFail,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userData['email'],
        password: pass,
      );

      firebaseUser = userCredential.user;

      await _saveUserData(userData);

      onSuccess();
    } catch (error) {
      onFail();
    }

    isLoading = false;
    notifyListeners();
  }

  void signIn({
    required String email,
    required String pass,
    required VoidCallback onSuccess,
    required VoidCallback onFail,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      firebaseUser = userCredential.user;

      onSuccess();
    } catch (error) {
      onFail();
    }

    isLoading = false;
    notifyListeners();
  }

  void signOut() async {
    await _auth.signOut();

    userData = {};
    firebaseUser = null;

    notifyListeners();
  }

  bool isLoggedIn() {
    return firebaseUser != null;
  }

  void recoverPass() {
    // Implement your password recovery logic here
  }

  Future<void> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;

    final userDocRef =
        FirebaseFirestore.instance.collection('users').doc(firebaseUser!.uid);

    await userDocRef.set(userData);
  }
}
