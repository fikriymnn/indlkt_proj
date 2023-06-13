import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

import '../../constants/style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 31),
                      child: Container(
                        color: Colors.white,
                        width: 244,
                        height: 36,
                        child: Image(
                          image: AssetImage("assets/images/logo.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 131),
                      child: Container(
                        child: Center(
                          child: Text(
                            "Welcome To Inventory Management!",
                            style: GoogleFonts.montserrat(
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        width: 776,
                        height: 46,
                      ),
                    ),
                    Container(
                      width: 578,
                      height: 689,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              width: 544,
                              height: 655,
                              decoration: BoxDecoration(
                                color: active,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: active,
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 4)),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Container(
                              width: 544,
                              height: 655,
                              decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: blue,
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 4)),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 544,
                              height: 655,
                              decoration: BoxDecoration(
                                color: light,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 4)),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Login",
                                    style: GoogleFonts.montserrat(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Container(
                                      child: TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            hintText: 'username',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Container(
                                      child: TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            hintText: 'password',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 70.38,
                                              width: 359.4,
                                              padding: const EdgeInsets.only(
                                                top: 756.71,
                                                left: 357.18,
                                              ),
                                              decoration: BoxDecoration(
                                                  color: blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Text(
                                                'Login',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            //forgot password screen
                                          },
                                          child: const Text(
                                            'Forgot Password',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 927,
                  height: 1028,
                  child: const Image(
                    image: AssetImage("assets/images/image_32.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
