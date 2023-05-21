import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Register a new user
  Future<CustomUser?> registerWithEmailAndPassword(
      String email, String password, String role) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      if (user != null) {
        // Store additional user details, including role, in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set({'email': email, 'role': role});
        return CustomUser(email: email, role: role);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // Sign in with email and password
  Future<CustomUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      print('user ${user?.email}');
      if (user != null) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: email)
            .limit(1)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          DocumentSnapshot userSnapshot = querySnapshot.docs.first;
          String role = userSnapshot.get('role');
          return CustomUser(email: email, role: role);
        } else {
          print('User document does not exist');
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class CustomUser {
  final String email;
  final String role;

  CustomUser({required this.email, required this.role});
}
