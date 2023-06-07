import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 200,
                  width: 600,
                  child: Image(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  child: Text("Welcome To Inventory Management"),
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
                  height: 600,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
