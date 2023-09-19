import 'package:flutter/material.dart';
import 'package:indlkt_proj/screens/dashboard_screens/dashboard_overview_screen.dart';
import 'package:indlkt_proj/screens/dashboard_screens/dashboard_productivity_screen.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_card.dart';
import 'package:indlkt_proj/screens/data_master_screens/data_master_screen.dart';
import 'package:indlkt_proj/widgets/appbar.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../constants/style.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;
  final List screens = [
    DashboardOverview(),
    DashboardProductivity(),
  ];
  @override
  Widget build(BuildContext context) {
    double mediaQuery = MediaQuery.of(context).size.width;
    return Builder(builder: (context) {
      return Scaffold(
          appBar: CustomAppBar(title: 'Dashboard', viewTime: true),
          floatingActionButton:
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Image(
                        width: 200,
                        image: AssetImage("assets/images/circle_bg.png"))),
                Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    child: Image(
                        width: 200,
                        image: AssetImage("assets/images/circle_bg2.png"))),
                Container(
                  margin: EdgeInsets.only(left: mediaQuery * 0.028),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Container(
                          child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = 0;
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                    right: 5, top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 4,
                                          offset: Offset(0, 0),
                                          color: dark.withOpacity(0.65))
                                    ],
                                    border: Border.all(
                                      color: Color.fromARGB(255, 2, 57, 101),
                                    ),
                                    color:
                                        selectedIndex == 0 ? blue : lightBlue,
                                    borderRadius: BorderRadius.circular(10)),
                                width: 150,
                                padding: EdgeInsets.all(5),
                                child: Center(
                                    child: Text(
                                  "Overview",
                                  style: TextStyle(
                                      color: selectedIndex == 0 ? light : dark),
                                ))),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = 1;
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                    right: 5, top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 4,
                                          offset: Offset(0, 0),
                                          color: dark.withOpacity(0.65))
                                    ],
                                    border: Border.all(
                                      color: Color.fromARGB(255, 2, 57, 101),
                                    ),
                                    color:
                                        selectedIndex == 1 ? blue : lightBlue,
                                    borderRadius: BorderRadius.circular(10)),
                                width: 150,
                                padding: EdgeInsets.all(5),
                                child: Center(
                                    child: Text(
                                  "Productivity",
                                  style: TextStyle(
                                      color: selectedIndex == 1 ? light : dark),
                                ))),
                          )
                        ],
                      )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: screens[selectedIndex],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
