import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/custom_textfield.dart';

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
  dynamic role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Users"),
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
                padding: const EdgeInsets.only(top: 20, right: 55, left: 38),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50, top: 20),
                          child: Text('Add new user',
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
                              height: MediaQuery.of(context).size.width * 0.53,
                              child: Column(children: [
                                Column(
                                  children: [
                                    SizedBox(height: 45),
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text("Tambah User",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          height: 65,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
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
                                          padding:
                                              const EdgeInsets.only(left: 30),
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
                                          padding:
                                              const EdgeInsets.only(left: 30),
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
                                          padding:
                                              const EdgeInsets.only(left: 30),
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
                                          padding:
                                              const EdgeInsets.only(left: 30),
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
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
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
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: 120,
                                            child: Center(
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Text("Submit",
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
