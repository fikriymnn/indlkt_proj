import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indlkt_proj/screens/login_screen/widgets/chaptcha.dart';
import 'package:local_captcha/local_captcha.dart';
import 'package:marquee/marquee.dart';
import 'package:rive/rive.dart';

import '../../constants/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obsecureText = true;
  final _captchaFormKey = GlobalKey<FormState>();

  final _localCaptchaController = LocalCaptchaController();
  final _configFormData = ConfigFormData();

  var _inputCode = '';

  @override
  void dispose() {
    _localCaptchaController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 700,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: 2500,
                          height: 700,
                          child: RiveAnimation.asset("assets/RiveAssets/c.riv"),
                        ),
                      ),
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
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
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
                              height: 500.3,
                              child: Stack(
                                children: [
                                  // Positioned(
                                  //   // child: Image(
                                  //   //   image: AssetImage("assets/images/cahaya.png"),
                                  //   // ),
                                  //   left: 0,
                                  //   child: RiveAnimation.asset(
                                  //       "assets/RiveAssets/onboard_animation.riv"),
                                  //   width: 1900,
                                  //   height: 2000,
                                  // ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Container(
                                      width: 380.8,
                                      height: 476.5,
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
                                      height: 476.5,
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
                                      height: 476.5,
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
                                      child: Form(
                                        key: _captchaFormKey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 37.1, top: 25.7),
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
                                                  top: 20.59,
                                                  bottom: 16.93),
                                              child: Container(
                                                child: TextField(
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          blue)),
                                                      prefixIcon: Icon(Icons
                                                          .perm_contact_calendar_outlined),
                                                      hintText: 'username',
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10))),
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
                                                  obscureText: _obsecureText,
                                                  decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          blue)),
                                                      prefixIcon: Icon(Icons
                                                          .lock_outline_rounded),
                                                      suffixIcon:
                                                          GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            _obsecureText =
                                                                !_obsecureText;
                                                          });
                                                        },
                                                        child: Icon(_obsecureText
                                                            ? Icons.visibility
                                                            : Icons
                                                                .visibility_off),
                                                      ),
                                                      hintText: 'password',
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10))),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 27.937,
                                                    top: 10.8,
                                                  ),
                                                  child: Text("Chaptcha",
                                                      style: GoogleFonts.rubik(
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .displayMedium,
                                                        fontSize: 10,
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 9.24),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      LocalCaptcha(
                                                        key: ValueKey(
                                                            _configFormData
                                                                .toString()),
                                                        controller:
                                                            _localCaptchaController,
                                                        height: 68,
                                                        width: 191.415,
                                                        backgroundColor:
                                                            Colors.grey[100]!,
                                                        chars: _configFormData
                                                            .chars,
                                                        length: _configFormData
                                                            .length,
                                                        fontSize: _configFormData
                                                                    .fontSize >
                                                                0
                                                            ? _configFormData
                                                                .fontSize
                                                            : null,
                                                        caseSensitive:
                                                            _configFormData
                                                                .caseSensitive,
                                                        codeExpireAfter:
                                                            _configFormData
                                                                .codeExpireAfter,
                                                      ),
                                                      InkWell(
                                                        onTap: () =>
                                                            _localCaptchaController
                                                                .refresh(),
                                                        child: Icon(
                                                            Icons.repeat_sharp),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 27.937,
                                                  right: 16.905,
                                                  bottom: 16.93),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color:
                                                                        blue)),
                                                    hintText: 'Enter Chaptcha',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10))),
                                                validator: (value) {
                                                  if (value != null &&
                                                      value.isNotEmpty) {
                                                    if (value.length !=
                                                        _configFormData
                                                            .length) {
                                                      return '* Code must be length of ${_configFormData.length}.';
                                                    }

                                                    final validation =
                                                        _localCaptchaController
                                                            .validate(value);

                                                    switch (validation) {
                                                      case LocalCaptchaValidation
                                                            .invalidCode:
                                                        return '* Invalid code.';
                                                      case LocalCaptchaValidation
                                                            .codeExpired:
                                                        return '* Code expired.';
                                                      case LocalCaptchaValidation
                                                            .valid:
                                                      default:
                                                        return null;
                                                    }
                                                  }

                                                  return '* Required field.';
                                                },
                                                onSaved: (value) =>
                                                    _inputCode = value ?? '',
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      if (_captchaFormKey
                                                              .currentState
                                                              ?.validate() ??
                                                          false) {
                                                        _captchaFormKey
                                                            .currentState!
                                                            .save();

                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Code: "$_inputCode" is valid.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                  child:
                                                                      const Text(
                                                                          'OK'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                        height: 49.266,
                                                        width: 251.426,
                                                        decoration: BoxDecoration(
                                                            color: blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Center(
                                                          child: const Text(
                                                            'Login',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3.8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        //forgot password screen
                                                      },
                                                      child: const Text(
                                                        'Forgot Password',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          fontSize: 10.15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 355,
                          height: 355,
                          child: RiveAnimation.asset(
                              "assets/RiveAssets/bulat.riv"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
