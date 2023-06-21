import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indlkt_proj/screens/login_screen/widgets/chaptcha.dart';
import 'package:indlkt_proj/widgets/side_bar.dart';
import 'package:local_captcha/local_captcha.dart';
import 'package:marquee/marquee.dart';
import 'package:rive/rive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickalert/quickalert.dart';

import '../../constants/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth authInstance = FirebaseAuth.instance;
  bool _obsecureText = true;
  final _captchaFormKey = GlobalKey<FormState>();

  final _localCaptchaController = LocalCaptchaController();
  final _configFormData = ConfigFormData();

  var _inputCode = '';

  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();

  final _passFocusNode = FocusNode();

  @override
  void dispose() {
    _localCaptchaController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();

    super.dispose();
  }

  bool _isLoading = false;

  Future<void> _submitFormOnLogin() async {
    final isValid = _captchaFormKey.currentState!.validate();
    User? user = FirebaseAuth.instance.currentUser;
    FocusScope.of(context).unfocus();

    if (isValid) {
      _captchaFormKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });

      try {
        await authInstance.signInWithEmailAndPassword(
            email: _emailTextController.text.toLowerCase().trim(),
            password: _passTextController.text.trim());

        // ignore: use_build_context_synchronously

        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation animation, Animation secondaryAnimation) {
              return SideBar();
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

        print('Successfully logged in');
      } on FirebaseException catch (error) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: '${error.message}',
        );
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: '$error',
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
                              height: 542.3,
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
                                      height: 511.5,
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
                                      height: 512.5,
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
                                      height: 512.5,
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
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value!.isEmpty ||
                                                        !value.contains('@')) {
                                                      return 'Masukkan email dengan benar';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  onEditingComplete: () =>
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              _passFocusNode),
                                                  controller:
                                                      _emailTextController,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          blue)),
                                                      prefixIcon: Icon(Icons
                                                          .perm_contact_calendar_outlined),
                                                      hintText: 'email',
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
                                                child: TextFormField(
                                                  obscureText: _obsecureText,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  controller:
                                                      _passTextController,
                                                  focusNode: _passFocusNode,
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Masukkan password dengan benar';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
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
                                                onEditingComplete: () {
                                                  _submitFormOnLogin();
                                                },
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
                                                      _submitFormOnLogin();
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
