import 'package:flutter/material.dart';
import 'package:indlkt_proj/constants/style.dart';

import '../../widgets/side_bar.dart';

class AfterLogin extends StatefulWidget {
  const AfterLogin({super.key});

  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  @override
  Widget build(BuildContext context) {
    dynamic mediaQuery = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/afterlogin.png"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 1100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SideBar()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.circular(10)),
                            height: 200,
                            width: 230,
                            child: Center(
                              child: Text(
                                "Productivity",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: light),
                              ),
                            ),
                          )),
                      InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(10)),
                        height: 200,
                        width: 230,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.circular(10)),
                            height: 200,
                            width: 200,
                            child: Center(
                              child: Text(
                                "Utility",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: light),
                              ),
                            ),
                          ),
                        ),
                      )),
                      InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(10)),
                        height: 200,
                        width: 230,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.circular(10)),
                            height: 200,
                            width: 200,
                            child: Center(
                              child: Text(
                                "WWTP",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: light),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
