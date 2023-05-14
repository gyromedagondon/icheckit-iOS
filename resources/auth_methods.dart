/*import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore

  //register a user

  Future<String> registerUser ({
    required String email,
    required String fName,
    required String lName,
    required String course,
    required String section,
    required String contactNum,
    required String password,
    required Uint8List file
  }) async {
    String res = "Some error occured";
    try {
      if(email.isNotEmpty ||fName.isNotEmpty ||lName.isNotEmpty ||course.isNotEmpty ||
          section.isNotEmpty ||contactNum.isNotEmpty ||password.isNotEmpty|| file != null) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password);
        //add user to database


      }
    }catch(err) {
      res = err.toString();
    }
    return res;
  }
}
*/