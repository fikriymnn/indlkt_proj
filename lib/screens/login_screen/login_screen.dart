import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_captcha/local_captcha.dart';
import 'package:marquee/marquee.dart';

import '../../constants/style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 31),
                      child: Container(
                        color: Colors.white,
                        width: 170.8,
                        height: 25.2,
                        child: Image(
                          image: AssetImage("assets/images/logo.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 91.7, top: 62.3, bottom: 21),
                      child: Container(
                        child: Center(
                          child: Text(
                            "Welcome To Inventory Management!",
                            style: GoogleFonts.montserrat(
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        width: 543.2,
                        height: 32.2,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 120),
                      width: 404.6,
                      height: 482.3,
                      child: Stack(
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage("assets/images/cahaya.png"),
                            ),
                            // child: RiveAnimation.asset(
                            //     "assets/RiveAssets/onboard_animation.riv"),
                            width: 900,
                            height: 700,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              width: 380.8,
                              height: 458.5,
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
                            bottom: 14,
                            left: 14,
                            child: Container(
                              width: 380.8,
                              height: 458.5,
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
                              width: 380.8,
                              height: 458.5,
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 37.1, top: 28.7),
                                    child: Text(
                                      "Login",
                                      style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                        fontSize: 25.2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 27.937,
                                        right: 16.905,
                                        top: 34.59,
                                        bottom: 16.93),
                                    child: Container(
                                      child: TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons
                                                .perm_contact_calendar_outlined),
                                            hintText: 'username',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 27.937,
                                        right: 16.905,
                                        bottom: 16.93),
                                    child: Container(
                                      child: TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                                Icons.lock_outline_rounded),
                                            hintText: 'password',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                  ),
                                  Container(),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 49.266,
                                              width: 251.426,
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
                child: Stack(
                  children: [
                    Container(
                      child: const Image(
                        image: AssetImage("assets/images/image_32.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Marquee(
                        text: 'Some sample text that takes some space.',

                        style: TextStyle(fontWeight: FontWeight.bold),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        blankSpace: 20.0,
                        velocity: 100.0,
                        // pauseAfterRound: Duration(seconds: 1),
                        startPadding: 10.0,
                        // accelerationDuration: Duration(seconds: 1),
                        accelerationCurve: Curves.linear,
                        // decelerationDuration: Duration(milliseconds: 500),
                        decelerationCurve: Curves.easeOut,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
