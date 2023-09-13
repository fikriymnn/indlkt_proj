import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_textfield.dart';

class EditUser extends StatefulWidget {
  const EditUser({super.key});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController NIK = TextEditingController();
  TextEditingController noTelp = TextEditingController();
  dynamic role;

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
                        padding: EdgeInsets.only(right: mediaQuery * 0.182),
                        child: Text("Email :",
                            style: TextStyle(
                                color: dark.withOpacity(0.8),
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ),
                      CustomTextField(
                          controller: email, hint: "Masukan Email...")
                    ],
                  ),
                  SizedBox(height: 23),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: mediaQuery * 0.151),
                        child: Text("Password :",
                            style: TextStyle(
                                color: dark.withOpacity(0.8),
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ),
                      CustomTextField(
                          controller: password, hint: "Masukan Password...")
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
                              value: "user",
                              child: Text("user"),
                            ),
                            DropdownMenuItem(
                              value: "admin",
                              child: Text("admin"),
                            ),
                            DropdownMenuItem(
                              value: "super admin",
                              child: Text("super admin"),
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
                      onTap: () {},
                      child: Container(
                          margin: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              color: active,
                              borderRadius: BorderRadius.circular(10)),
                          width: 120,
                          child: Center(
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text("Submit",
                                    style:
                                        TextStyle(color: light, fontSize: 15))),
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
