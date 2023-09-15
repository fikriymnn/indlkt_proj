import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indlkt_proj/screens/after_login_screens/after_login_screen.dart';
import 'package:indlkt_proj/screens/hubungi_admin.dart';

import '../models/user_model.dart';

class Validasi extends StatefulWidget {
  const Validasi({super.key});

  @override
  State<Validasi> createState() => _ValidasiState();
}

class _ValidasiState extends State<Validasi> {
  Future<Widget> chatPage() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('akun')
          .doc(user.uid)
          .get();
      UserModel userModel = UserModel.fromSnap(userData);
      return userModel.role != "not active" ? AfterLogin() : HubungiAdmin();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: chatPage(),
        builder: (context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!;
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.purple,
            ),
          );
        });
  }
}
