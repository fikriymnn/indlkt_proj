import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  height: 36,
                  width: 244,
                  child: Image(
                    image: AssetImage("assets/images/logo.png"),
                  ),
                ),
                Container(
                  child: Center(child: Text("Welcome To Inventory Management")),
                  width: 993,
                  height: 36,
                ),
                Center(
                  child: Container(
                    width: 544,
                    height: 655,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: const Color.fromARGB(255, 209, 209, 209),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(7.0, 8.0)),
                    ]),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  child: Image(
                    image: AssetImage("assets/images/image_32.png"),
                    fit: BoxFit.contain,
                  ),
                  width: 927,
                  height: 1028,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
