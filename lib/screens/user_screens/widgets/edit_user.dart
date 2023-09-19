import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_textfield.dart';

class EditUser extends StatefulWidget {
  const EditUser(
      {super.key,
      required this.id,
      required this.namaLengkap,
      required this.email,
      required this.Nik,
      required this.noTelp,
      required this.role});
  final String id, namaLengkap, email, Nik, noTelp, role;

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController NIK = TextEditingController();
  TextEditingController noTelp = TextEditingController();
  dynamic role;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    namaLengkap = TextEditingController(text: widget.namaLengkap);
    email = TextEditingController(text: widget.email);
    NIK = TextEditingController(text: widget.Nik);
    noTelp = TextEditingController(text: widget.noTelp);
    role = widget.role;
    super.initState();
  }

  void signUpUser() async {
    if (namaLengkap == "" || NIK == "" || noTelp == "" || role == null) {
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

        FirebaseFirestore.instance.collection("akun").doc(widget.id).update({
          "nik": NIK.text,
          "role": role,
          "userName": namaLengkap.text,
          "noTelepon": noTelp.text
        });

        CoolAlert.show(
          width: 500,
          context: context,
          type: CoolAlertType.success,
          text: "Akun Berhasil Di Edit",
        );

        setState(() {
          _isLoading = false;
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
    return SingleChildScrollView(
        child: Container(
      width: MediaQuery.of(context).size.width * 0.25,
      child: Container(
        child: CustomContainer(
            height: MediaQuery.of(context).size.width * 0.58,
            child: Column(children: [
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
              Column(
                children: [
                  SizedBox(height: 45),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text("Edit User",
                            style: TextStyle(
                                color: dark.withOpacity(0.8),
                                fontSize: 35,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 65,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: mediaQuery * 0.11),
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
                        padding: EdgeInsets.only(right: mediaQuery * 0.063),
                        child: Text("No. Induk Kepegawaian :",
                            style: TextStyle(
                                color: dark.withOpacity(0.8),
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ),
                      CustomTextField(controller: NIK, hint: "Masukan NIK...")
                    ],
                  ),
                  SizedBox(height: 23),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: mediaQuery * 0.135),
                        child: Text("No. Telepon :",
                            style: TextStyle(
                                color: dark.withOpacity(0.8),
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ),
                      CustomTextField(
                          controller: noTelp, hint: "Masukan no.Telepon...")
                    ],
                  ),
                  SizedBox(height: 23),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: mediaQuery * 0.186),
                        child: Text("Role :",
                            style: TextStyle(
                                color: dark.withOpacity(0.8),
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ),
                      CustomDropdown(
                          dropdownItems: [
                            DropdownMenuItem(
                              value: "not active",
                              child: Text("Not Active"),
                            ),
                            DropdownMenuItem(
                              value: "user",
                              child: Text("User"),
                            ),
                            DropdownMenuItem(
                              value: "admin",
                              child: Text("Admin"),
                            ),
                            DropdownMenuItem(
                              value: "super admin",
                              child: Text("Super Admin"),
                            ),
                          ],
                          value: role,
                          onChange: (a) {
                            setState(() {
                              role = a;
                            });
                          },
                          hintText: "Pilih Role..."),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        signUpUser();
                      },
                      child: Container(
                          margin: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              color: active,
                              borderRadius: BorderRadius.circular(10)),
                          width: 120,
                          child: Center(
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: _isLoading
                                    ? CircularProgressIndicator(
                                        color: light,
                                      )
                                    : Text("Submit",
                                        style: TextStyle(
                                            color: light, fontSize: 15))),
                          )),
                    ),
                  )
                ],
              )
            ])),
      ),
    ));
  }
}
