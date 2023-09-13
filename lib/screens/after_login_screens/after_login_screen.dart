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
          color: blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 1200,
                child: Text(
                  'INVENTORY MANAGEMENT PT.INDOLAKTO',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: mediaQuery * 0.042,
                      fontWeight: FontWeight.bold,
                      color: light),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 900,
                  decoration: BoxDecoration(
                      color: light, borderRadius: BorderRadius.circular(15)),
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
                                color: active,
                                borderRadius: BorderRadius.circular(10)),
                            height: 200,
                            width: 200,
                            child: Center(
                              child: Text(
                                "Productivity",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: light),
                              ),
                            ),
                          )),
                      InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            color: active,
                            borderRadius: BorderRadius.circular(10)),
                        height: 200,
                        width: 200,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: active,
                                borderRadius: BorderRadius.circular(10)),
                            height: 200,
                            width: 200,
                            child: Center(
                              child: Text(
                                "Utility",
                                style: TextStyle(
                                    fontSize: 20,
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
                            color: active,
                            borderRadius: BorderRadius.circular(10)),
                        height: 200,
                        width: 200,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: active,
                                borderRadius: BorderRadius.circular(10)),
                            height: 200,
                            width: 200,
                            child: Center(
                              child: Text(
                                "WWTP",
                                style: TextStyle(
                                    fontSize: 20,
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
