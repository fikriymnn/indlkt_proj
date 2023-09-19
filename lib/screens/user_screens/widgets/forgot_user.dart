import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_textfield.dart';

class ForgotUser extends StatefulWidget {
  const ForgotUser();

  @override
  State<ForgotUser> createState() => _ForgotUserState();
}

class _ForgotUserState extends State<ForgotUser> {
  TextEditingController email = TextEditingController();

  bool _isLoading = false;
  void _forgetPassFCT() async {
    if (email.text.isEmpty || !email.text.contains("@")) {
      CoolAlert.show(
        width: 500,
        context: context,
        type: CoolAlertType.warning,
        text: "Masukan Email Dengan Benar",
      );
    } else {
      setState(() {
        _isLoading = true;
      });
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: email.text.toLowerCase());
        CoolAlert.show(
          width: 500,
          context: context,
          type: CoolAlertType.info,
          text: "Link Reset Password Telah Di Kirim Ke Alamat Email Anda",
        );
      } on FirebaseException catch (error) {
        CoolAlert.show(
          width: 500,
          context: context,
          type: CoolAlertType.error,
          text: error.message,
        );
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        CoolAlert.show(
          width: 500,
          context: context,
          type: CoolAlertType.error,
          text: error.toString(),
        );
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
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
                        child: Text("Forgot Password",
                            style: TextStyle(
                                color: dark.withOpacity(0.8),
                                fontSize: 35,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 65,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: mediaQuery * 0.18),
                        child: Text("Email :",
                            style: TextStyle(
                                color: dark.withOpacity(0.8),
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ),
                      CustomTextField(
                        controller: email,
                        hint: "Masukan Email...",
                      )
                    ],
                  ),
                  SizedBox(height: 23),
                  Center(
                    child: InkWell(
                      onTap: () {
                        _forgetPassFCT();
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
