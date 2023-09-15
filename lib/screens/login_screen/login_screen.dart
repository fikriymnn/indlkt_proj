import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indlkt_proj/screens/login_screen/widgets/chaptcha.dart';
import 'package:indlkt_proj/screens/user_screens/widgets/add_user.dart';
import 'package:indlkt_proj/widgets/side_bar.dart';
import 'package:local_captcha/local_captcha.dart';
import 'package:marquee/marquee.dart';
import 'package:rive/rive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickalert/quickalert.dart';

import '../../constants/style.dart';
import '../../widgets/validasi.dart';
import '../after_login_screens/after_login_screen.dart';
import '../user_screens/widgets/forgot_user.dart';

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
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    print(mediaQueryWidth);
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
                  width: mediaQueryWidth * 0.519,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: mediaQueryWidth * 1.852,
                          height: mediaQueryWidth * 0.519,
                          child: RiveAnimation.asset("assets/RiveAssets/c.riv"),
                        ),
                      ),
                      Container(
                        width: mediaQueryWidth * 0.519,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: mediaQueryWidth * 0.023),
                              child: Container(
                                color: Colors.white,
                                width: mediaQueryWidth * 0.126,
                                height: mediaQueryWidth * 0.0186,
                                child: Image(
                                  image: AssetImage("assets/images/logo.png"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: mediaQueryWidth * 0.068,
                                  top: mediaQueryWidth * 0.046,
                                  bottom: mediaQueryWidth * 0.0156),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Welcome To Inventory Management!",
                                    style: GoogleFonts.montserrat(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                      fontSize: mediaQueryWidth * 0.0190,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                width: mediaQueryWidth * 0.403,
                                height: mediaQueryWidth * 0.024,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: mediaQueryWidth * 0.089),
                              width: mediaQueryWidth * 0.3,
                              height: mediaQueryWidth * 0.402,
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
                                      width: mediaQueryWidth * 0.282,
                                      height: mediaQueryWidth * 0.379,
                                      decoration: BoxDecoration(
                                        color: active,
                                        borderRadius: BorderRadius.circular(
                                            mediaQueryWidth * 0.0223),
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
                                    bottom: mediaQueryWidth * 0.0104,
                                    left: mediaQueryWidth * 0.0104,
                                    child: Container(
                                      width: mediaQueryWidth * 0.282,
                                      height: mediaQueryWidth * 0.3796,
                                      decoration: BoxDecoration(
                                        color: blue,
                                        borderRadius: BorderRadius.circular(
                                            mediaQueryWidth * 0.0223),
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
                                      width: mediaQueryWidth * 0.282,
                                      height: mediaQueryWidth * 0.38,
                                      decoration: BoxDecoration(
                                        color: light,
                                        borderRadius: BorderRadius.circular(
                                            mediaQueryWidth * 0.0223),
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
                                              padding: EdgeInsets.only(
                                                  left: mediaQueryWidth * 0.028,
                                                  top: mediaQueryWidth * 0.019),
                                              child: Text(
                                                "Login",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium,
                                                  fontSize:
                                                      mediaQueryWidth * 0.0188,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left:
                                                      mediaQueryWidth * 0.0207,
                                                  right:
                                                      mediaQueryWidth * 0.0125,
                                                  top: mediaQueryWidth * 0.015,
                                                  bottom:
                                                      mediaQueryWidth * 0.0125),
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
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  mediaQueryWidth *
                                                                      0.008))),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left:
                                                      mediaQueryWidth * 0.0207,
                                                  right:
                                                      mediaQueryWidth * 0.0125,
                                                  bottom:
                                                      mediaQueryWidth * 0.0125),
                                              child: Container(
                                                child: TextFormField(
                                                  onEditingComplete: () {
                                                    _submitFormOnLogin();
                                                  },
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
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  mediaQueryWidth *
                                                                      0.008))),
                                                ),
                                              ),
                                            ),
                                            // Column(
                                            //   crossAxisAlignment:
                                            //       CrossAxisAlignment.start,
                                            //   children: [
                                            //     Padding(
                                            //       padding: EdgeInsets.only(
                                            //         left: mediaQueryWidth *
                                            //             0.0207,
                                            //         top: mediaQueryWidth *
                                            //             0.0081,
                                            //       ),
                                            //       child: Text("Chaptcha",
                                            //           style: GoogleFonts.rubik(
                                            //             textStyle:
                                            //                 Theme.of(context)
                                            //                     .textTheme
                                            //                     .displayMedium,
                                            //             fontSize:
                                            //                 mediaQueryWidth *
                                            //                     0.008,
                                            //           )),
                                            //     ),
                                            //     Padding(
                                            //       padding: EdgeInsets.only(
                                            //           bottom: mediaQueryWidth *
                                            //               0.007),
                                            //       child: Row(
                                            //         mainAxisAlignment:
                                            //             MainAxisAlignment
                                            //                 .center,
                                            //         children: [
                                            //           LocalCaptcha(
                                            //             key: ValueKey(
                                            //                 _configFormData
                                            //                     .toString()),
                                            //             controller:
                                            //                 _localCaptchaController,
                                            //             height:
                                            //                 mediaQueryWidth *
                                            //                     0.0504,
                                            //             width: mediaQueryWidth *
                                            //                 0.142,
                                            //             backgroundColor:
                                            //                 Colors.grey[100]!,
                                            //             chars: _configFormData
                                            //                 .chars,
                                            //             length: _configFormData
                                            //                 .length,
                                            //             fontSize: _configFormData
                                            //                         .fontSize >
                                            //                     0
                                            //                 ? _configFormData
                                            //                     .fontSize
                                            //                 : null,
                                            //             caseSensitive:
                                            //                 _configFormData
                                            //                     .caseSensitive,
                                            //             codeExpireAfter:
                                            //                 _configFormData
                                            //                     .codeExpireAfter,
                                            //           ),
                                            //           InkWell(
                                            //             onTap: () =>
                                            //                 _localCaptchaController
                                            //                     .refresh(),
                                            //             child: Icon(
                                            //                 Icons.repeat_sharp),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                            // Padding(
                                            //   padding: EdgeInsets.only(
                                            //       left:
                                            //           mediaQueryWidth * 0.0207,
                                            //       right:
                                            //           mediaQueryWidth * 0.0125,
                                            //       bottom:
                                            //           mediaQueryWidth * 0.0125),
                                            //   child: TextFormField(
                                            //     onEditingComplete: () {
                                            //       _submitFormOnLogin();
                                            //     },
                                            //     decoration: InputDecoration(
                                            //         enabledBorder:
                                            //             OutlineInputBorder(
                                            //                 borderSide:
                                            //                     BorderSide(
                                            //                         color:
                                            //                             blue)),
                                            //         hintText: 'Enter Chaptcha',
                                            //         border: OutlineInputBorder(
                                            //             borderRadius:
                                            //                 BorderRadius.circular(
                                            //                     mediaQueryWidth *
                                            //                         0.008))),
                                            //     validator: (value) {
                                            //       if (value != null &&
                                            //           value.isNotEmpty) {
                                            //         if (value.length !=
                                            //             _configFormData
                                            //                 .length) {
                                            //           return '* Code must be length of ${_configFormData.length}.';
                                            //         }

                                            //         final validation =
                                            //             _localCaptchaController
                                            //                 .validate(value);

                                            //         switch (validation) {
                                            //           case LocalCaptchaValidation
                                            //                 .invalidCode:
                                            //             return '* Invalid code.';
                                            //           case LocalCaptchaValidation
                                            //                 .codeExpired:
                                            //             return '* Code expired.';
                                            //           case LocalCaptchaValidation
                                            //                 .valid:
                                            //           default:
                                            //             return null;
                                            //         }
                                            //       }

                                            //       return '* Required field.';
                                            //     },
                                            //     onSaved: (value) =>
                                            //         _inputCode = value ?? '',
                                            //   ),
                                            // ),
                                            Container(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          _submitFormOnLogin();
                                                        },
                                                        child: Container(
                                                            height:
                                                                mediaQueryWidth *
                                                                    0.037,
                                                            width:
                                                                mediaQueryWidth *
                                                                    0.186,
                                                            decoration: BoxDecoration(
                                                                color: blue,
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        mediaQueryWidth *
                                                                            0.008)),
                                                            child: Center(
                                                              child: Text(
                                                                'login',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      mediaQueryWidth *
                                                                          0.0104,
                                                                ),
                                                              ),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                elevation: 0,
                                                                content: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top: 85,
                                                                        right:
                                                                            55,
                                                                        left:
                                                                            38),
                                                                    child: Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        height: MediaQuery.of(context)
                                                                            .size
                                                                            .height,
                                                                        child:
                                                                            AddUser())),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 8.0),
                                                          child: Container(
                                                              height:
                                                                  mediaQueryWidth *
                                                                      0.037,
                                                              width:
                                                                  mediaQueryWidth *
                                                                      0.186,
                                                              decoration: BoxDecoration(
                                                                  color: blue,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          mediaQueryWidth *
                                                                              0.008)),
                                                              child: Center(
                                                                child: Text(
                                                                  'Register',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        mediaQueryWidth *
                                                                            0.0104,
                                                                  ),
                                                                ),
                                                              )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: mediaQueryWidth *
                                                        0.0029),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              elevation: 0,
                                                              content: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 85,
                                                                      right: 55,
                                                                      left: 38),
                                                                  child: Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.6,
                                                                      height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height,
                                                                      child:
                                                                          ForgotUser())),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Text(
                                                        'Forgot Password',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          fontSize:
                                                              mediaQueryWidth *
                                                                  0.0081,
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
                        width: mediaQueryWidth * 1,
                        height: mediaQueryHeight * 1,
                        child: const Image(
                          image: AssetImage("assets/images/image_32.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: mediaQueryWidth * 0.263,
                          height: mediaQueryWidth * 0.263,
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
