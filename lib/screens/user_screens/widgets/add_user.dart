import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/custom_textfield.dart';
import 'package:indlkt_proj/widgets/validasi.dart';

import '../../../constants/style.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_dropdown.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController NIK = TextEditingController();
  TextEditingController noTelp = TextEditingController();
  String? role;
  bool _isLoading = false;

  void signUpUser() async {
    if (namaLengkap == "" ||
        email == "" ||
        password == "" ||
        NIK == "" ||
        noTelp == "") {
      CoolAlert.show(
        width: 500,
        context: context,
        type: CoolAlertType.warning,
        text: "Semua Field Tidak Boleh Kosong",
      );
    } else {
      try {
        setState(() {
          _isLoading = true;
        });

        UserCredential cred = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.text, password: password.text);

        FirebaseFirestore.instance.collection("akun").doc(cred.user!.uid).set({
          "createdAt": DateTime.now(),
          "email": email.text,
          "nik": NIK.text,
          "role": "not active",
          "uid": cred.user!.uid,
          "userName": namaLengkap.text,
          "noTelepon": noTelp.text
        });

        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation animation, Animation secondaryAnimation) {
              return Validasi();
            }, transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return new ScaleTransition(
                scale: animation,
                child: child,
              );
            }),
            (Route route) => false);
        setState(() {
          _isLoading = false;
          email.clear();
          NIK.clear();
          role == null;
          namaLengkap.clear();
          password.clear();
          noTelp.clear();
        });
      } on FirebaseException catch (e) {
        setState(() {
          _isLoading = false;
        });
        CoolAlert.show(
          width: 500,
          context: context,
          type: CoolAlertType.error,
          text: e.message.toString(),
        );
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        CoolAlert.show(
          width: 500,
          context: context,
          type: CoolAlertType.error,
          text: e.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamic mediaQuery = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Image(
                      width: 200,
                      image: AssetImage("assets/images/circle_bg.png"))),
              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  child: Image(
                      width: 200,
                      image: AssetImage("assets/images/circle_bg2.png"))),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                              size: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50, top: 20),
                          child: Text('Register',
                              style: TextStyle(
                                  color: blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Container(
                          child: CustomContainer(
                              height: MediaQuery.of(context).size.width * 0.57,
                              child: Column(children: [
                                Column(
                                  children: [
                                    SizedBox(height: 45),
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text("Register",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          height: 65,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: mediaQuery * 0.11),
                                          child: Text("Nama Lengkap :",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        CustomTextField(
                                          controller: namaLengkap,
                                          hint: "Masukan Nama Lengkap...",
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 23),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: mediaQuery * 0.182),
                                          child: Text("Email :",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        CustomTextField(
                                            controller: email,
                                            hint: "Masukan Email...")
                                      ],
                                    ),
                                    SizedBox(height: 23),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: mediaQuery * 0.151),
                                          child: Text("Password :",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        CustomTextField(
                                            controller: password,
                                            hint: "Masukan Password...")
                                      ],
                                    ),
                                    SizedBox(height: 23),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: mediaQuery * 0.063),
                                          child: Text("No. Induk Kepegawaian :",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        CustomTextField(
                                            controller: NIK,
                                            hint: "Masukan NIK...")
                                      ],
                                    ),
                                    SizedBox(height: 23),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: mediaQuery * 0.135),
                                          child: Text("No. Telepon :",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        CustomTextField(
                                            controller: noTelp,
                                            hint: "Masukan no.Telepon...")
                                      ],
                                    ),
                                    SizedBox(height: 23),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Center(
                                      child: InkWell(
                                        onTap: () async {
                                          signUpUser();
                                        },
                                        child: Container(
                                            margin: EdgeInsets.all(25),
                                            decoration: BoxDecoration(
                                                color: active,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: 120,
                                            child: Center(
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: _isLoading
                                                      ? CircularProgressIndicator(
                                                          color: light,
                                                        )
                                                      : Text("Submit",
                                                          style: TextStyle(
                                                              color: light,
                                                              fontSize: 15))),
                                            )),
                                      ),
                                    )
                                  ],
                                )
                              ])),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
