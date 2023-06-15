import 'package:flutter/material.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_container.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_productivity_container.dart';

import '../../constants/style.dart';

class DashboardProductivity extends StatefulWidget {
  const DashboardProductivity({super.key});

  @override
  State<DashboardProductivity> createState() => _DashboardProductivityState();
}

class _DashboardProductivityState extends State<DashboardProductivity> {
  @override
  Widget build(BuildContext context) {
    double mediaQuery = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        DashboardContainer(
            width: mediaQuery * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Performance Dashboard",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Container(
                      decoration: BoxDecoration(
                          color: blue, borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 40, left: 40, top: 8, bottom: 8),
                        child: Text(
                          "PRODUCTIVITY",
                          style: TextStyle(
                              color: light,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        ProductivityContainer(),
                        ProductivityContainer()
                      ],
                    ),
                    Row(
                      children: [
                        ProductivityContainer(),
                        ProductivityContainer()
                      ],
                    )
                  ],
                )
              ],
            )),
      ],
    );
  }
}
