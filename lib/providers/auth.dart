// import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart';

abstract class AuthBase {
  Stream<User> get onAuthStateChanged;
  Future<User> currentUser();
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> signOut();
  User get fetchUser;
  void setUser({User user});
}

class Auth with ChangeNotifier implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  User user;
  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(
      uid: user.uid,
      imageUrl: user.photoUrl,
      name: user.displayName,
      email: user.email,
    );
  }

  @override
  User get fetchUser => user;

  @override
  void setUser({User user}) {
    user = user;
  }

  @override
  Stream<User> get onAuthStateChanged {
    _firebaseAuth.onAuthStateChanged;
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  @override
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    user = _userFromFirebase(authResult.user);
    // return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    await authResult.user.sendEmailVerification();
    user = _userFromFirebase(authResult.user);
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
