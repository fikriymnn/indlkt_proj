import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indlkt_proj/constants/style.dart';
import 'package:indlkt_proj/screens/login_screen/login_screen.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class HubungiAdmin extends StatefulWidget {
  const HubungiAdmin({super.key});

  @override
  State<HubungiAdmin> createState() => _HubungiAdminState();
}

class _HubungiAdminState extends State<HubungiAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(color: blue),
            child: GiffyDialog.image(
              Image.network(
                "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
                height: 500,
                fit: BoxFit.cover,
              ),
              title: Text('MOHON MAAF',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  )),
              content: Column(
                children: [
                  Container(
                    width: 550,
                    child: Text(
                        'Akun Anda Belum Dapat Di Pakai, Silahkan Hubungi Super Admin Atau Pimpinan untuk Aktivasi',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Container(
                      width: 250,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                        },
                        child: Center(
                          child: Text(
                            "Kembali Ke Halaman Login",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
