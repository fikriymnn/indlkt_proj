import 'package:indlkt_proj/constants/firebase_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:indlkt_proj/models/user_model.dart' as model;

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final User? user = authInstance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<model.UserModel> getUserDetails() async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('akun').doc(user!.uid).get();

    return model.UserModel.fromSnap(documentSnapshot);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
