import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart';

abstract class AuthBase {
  Stream<UserModel> get onAuthStateChanged;
  Future<UserModel> currentUser();
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> signOut();
}

class Auth with ChangeNotifier implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  UserModel _userFromFirebase(User user) {
    if (user == null) {
      return null;
    }
    return UserModel(
      uid: user.uid,
      imageUrl: user.photoURL,
      name: user.displayName,
      email: user.email,
    );
  }

  @override
  Stream<UserModel> get onAuthStateChanged {
    _firebaseAuth.authStateChanges();
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  @override
  Future<UserModel> currentUser() async {
    final user = _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    try {
      await authResult.user.sendEmailVerification();
      return _userFromFirebase(authResult.user);
    } catch (e) {
      print("An error occured while trying to send email verification");
      print(e.message);
    }
    return null;
  }

  @override
  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
