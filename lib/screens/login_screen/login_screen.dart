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
        child: Row(
          children: [
            Expanded(
              flex: 1,
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
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 223,
                          top: 247,
                        ),
                        child: Container(
                          width: 544,
                          height: 655,
                          child: Column(
                            children: [],
                          ),
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
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 240,
                          top: 232,
                        ),
                        child: Container(
                          width: 544,
                          height: 655,
                          child: Column(
                            children: [],
                          ),
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
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 257,
                          top: 222,
                        ),
                        child: Container(
                          width: 544,
                          height: 655,
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: GoogleFonts.montserrat(
                                  textStyle:
                                      Theme.of(context).textTheme.displayMedium,
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
                                  height: 70.38,
                                  width: 359.4,
                                  padding: const EdgeInsets.only(
                                    top: 756.71,
                                    left: 357.18,
                                  ),
                                  decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ElevatedButton(
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    onPressed: () {},
                                  )),
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
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: const Color.fromARGB(
                                        255, 209, 209, 209),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 4)),
                              ],
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    child: Image(
                      image: AssetImage("assets/images/image_32.png"),
                      fit: BoxFit.contain,
                    ),
                    width: 927,
                    height: 1028,
                  ),
                  // Container(
                  //     child: Marquee(
                  //   text: 'Some sample text that takes some space.',
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   blankSpace: 20.0,
                  //   velocity: 100.0,
                  //   pauseAfterRound: Duration(seconds: 1),
                  //   startPadding: 10.0,
                  //   accelerationDuration: Duration(seconds: 1),
                  //   accelerationCurve: Curves.linear,
                  //   decelerationDuration: Duration(milliseconds: 500),
                  //   decelerationCurve: Curves.easeOut,
                  // ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
