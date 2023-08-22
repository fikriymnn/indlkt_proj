import 'package:chart_components/bar_chart_component.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
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
  dynamic week = 0;
  dynamic year = 2023;
  dynamic month = [];

  List<double> data = [100, 50, 30, 60];

  List<String> labels = ["2", "3", "4", "5"];

  List<double> dataMonth = [
    50,
    70,
  ];

  List<String> labelsMonth = ["januari", "februari"];

  List<double> dataYear = [67, 20];

  List<String> labelsYear = ["2022", "2023"];
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
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Performance Dashboard",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text("Filter Week"),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: light,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: CustomSearchableDropDown(
                                enabled: true,
                                items: [1, 2, 3, 4, 5],
                                label: 'Pilih Week...',
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: dark.withOpacity(0.5))),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Icon(Icons.search),
                                ),
                                dropDownMenuItems: [1, 2, 3, 4, 5],
                                onChanged: (a) {
                                  setState(() {
                                    week = a;
                                  });
                                  for (int i = 0;
                                      i < Calender().calender.length;
                                      i++) {
                                    if (week ==
                                            Calender().calender[i]["week"][0] ||
                                        week ==
                                            Calender().calender[i]["week"][1] ||
                                        week ==
                                            Calender().calender[i]["week"][2] ||
                                        week ==
                                            Calender().calender[i]["week"][3]) {
                                      setState(() {
                                        month = Calender().calender[i]["month"];
                                      });
                                    }
                                  }
                                },
                              ),
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Filter Year"),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: light,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: CustomSearchableDropDown(
                                enabled: true,
                                items: Calender().year,
                                label: 'Pilih Tahun...',
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: dark.withOpacity(0.5))),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Icon(Icons.search),
                                ),
                                dropDownMenuItems: Calender().year,
                                onChanged: (a) {
                                  setState(() {
                                    year = a;
                                  });
                                },
                              ),
                            )),
                      ],
                    )
                  ],
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
                        // Bar 1
                        ProductivityContainer(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 15, right: 15, left: 15),
                              child: Container(
                                width: 120,
                                height:
                                    MediaQuery.of(context).size.height * 0.32,
                                child: BarChart(
                                  data: dataYear,
                                  labels: labelsYear,
                                  labelStyle: TextStyle(fontSize: 18),
                                  valueStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  displayValue: true,
                                  reverse: true,
                                  getColor: Data.getColor,
                                  getIcon: Data.getIcon,
                                  barWidth: 45,
                                  barSeparation: 20,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  animationCurve: Curves.easeInOutSine,
                                  itemRadius: 10,
                                  iconHeight: 24,
                                  footerHeight: 24,
                                  headerValueHeight: 16,
                                  roundValuesOnText: false,
                                  lineGridColor: light,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 120,
                              height: MediaQuery.of(context).size.height * 0.32,
                              child: BarChart(
                                data: dataMonth,
                                labels: labelsMonth,
                                labelStyle: TextStyle(fontSize: 18),
                                valueStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                displayValue: true,
                                reverse: true,
                                getColor: Data.getColor2,
                                getIcon: Data.getIcon,
                                barWidth: 45,
                                barSeparation: 20,
                                animationDuration: Duration(milliseconds: 1000),
                                animationCurve: Curves.easeInOutSine,
                                itemRadius: 10,
                                iconHeight: 24,
                                footerHeight: 24,
                                headerValueHeight: 16,
                                roundValuesOnText: true,
                                lineGridColor: light,
                              ),
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            Container(
                              width: 250,
                              height: MediaQuery.of(context).size.height * 0.32,
                              child: BarChart(
                                data: data,
                                labels: labels,
                                labelStyle: TextStyle(fontSize: 18),
                                valueStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                displayValue: true,
                                reverse: true,
                                getColor: Data.getColor1,
                                getIcon: Data.getIcon,
                                barWidth: 45,
                                barSeparation: 20,
                                animationDuration: Duration(milliseconds: 1000),
                                animationCurve: Curves.easeInOutSine,
                                itemRadius: 10,
                                iconHeight: 24,
                                footerHeight: 24,
                                headerValueHeight: 16,
                                roundValuesOnText: false,
                                lineGridColor: light,
                              ),
                            ),
                          ],
                        ),
                        // Bar 2
                        ProductivityContainer(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 15, right: 15, left: 15),
                              child: Container(
                                width: 120,
                                height:
                                    MediaQuery.of(context).size.height * 0.32,
                                child: BarChart(
                                  data: dataYear,
                                  labels: labelsYear,
                                  labelStyle: TextStyle(fontSize: 18),
                                  valueStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  displayValue: true,
                                  reverse: true,
                                  getColor: Data.getColor,
                                  getIcon: Data.getIcon,
                                  barWidth: 45,
                                  barSeparation: 20,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  animationCurve: Curves.easeInOutSine,
                                  itemRadius: 10,
                                  iconHeight: 24,
                                  footerHeight: 24,
                                  headerValueHeight: 16,
                                  roundValuesOnText: false,
                                  lineGridColor: light,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 120,
                              height: MediaQuery.of(context).size.height * 0.32,
                              child: BarChart(
                                data: dataMonth,
                                labels: labelsMonth,
                                labelStyle: TextStyle(fontSize: 18),
                                valueStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                displayValue: true,
                                reverse: true,
                                getColor: Data.getColor2,
                                getIcon: Data.getIcon,
                                barWidth: 45,
                                barSeparation: 20,
                                animationDuration: Duration(milliseconds: 1000),
                                animationCurve: Curves.easeInOutSine,
                                itemRadius: 10,
                                iconHeight: 24,
                                footerHeight: 24,
                                headerValueHeight: 16,
                                roundValuesOnText: true,
                                lineGridColor: light,
                              ),
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            Container(
                              width: 250,
                              height: MediaQuery.of(context).size.height * 0.32,
                              child: BarChart(
                                data: data,
                                labels: labels,
                                labelStyle: TextStyle(fontSize: 18),
                                valueStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                displayValue: true,
                                reverse: true,
                                getColor: Data.getColor1,
                                getIcon: Data.getIcon,
                                barWidth: 45,
                                barSeparation: 20,
                                animationDuration: Duration(milliseconds: 1000),
                                animationCurve: Curves.easeInOutSine,
                                itemRadius: 10,
                                iconHeight: 24,
                                footerHeight: 24,
                                headerValueHeight: 16,
                                roundValuesOnText: false,
                                lineGridColor: light,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        // Bar 3
                        ProductivityContainer(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 15, right: 15, left: 15),
                              child: Container(
                                width: 120,
                                height:
                                    MediaQuery.of(context).size.height * 0.32,
                                child: BarChart(
                                  data: dataYear,
                                  labels: labelsYear,
                                  labelStyle: TextStyle(fontSize: 18),
                                  valueStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  displayValue: true,
                                  reverse: true,
                                  getColor: Data.getColor,
                                  getIcon: Data.getIcon,
                                  barWidth: 45,
                                  barSeparation: 20,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  animationCurve: Curves.easeInOutSine,
                                  itemRadius: 10,
                                  iconHeight: 24,
                                  footerHeight: 24,
                                  headerValueHeight: 16,
                                  roundValuesOnText: false,
                                  lineGridColor: light,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 120,
                              height: MediaQuery.of(context).size.height * 0.32,
                              child: BarChart(
                                data: dataMonth,
                                labels: labelsMonth,
                                labelStyle: TextStyle(fontSize: 18),
                                valueStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                displayValue: true,
                                reverse: true,
                                getColor: Data.getColor2,
                                getIcon: Data.getIcon,
                                barWidth: 45,
                                barSeparation: 20,
                                animationDuration: Duration(milliseconds: 1000),
                                animationCurve: Curves.easeInOutSine,
                                itemRadius: 10,
                                iconHeight: 24,
                                footerHeight: 24,
                                headerValueHeight: 16,
                                roundValuesOnText: true,
                                lineGridColor: light,
                              ),
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            Container(
                              width: 250,
                              height: MediaQuery.of(context).size.height * 0.32,
                              child: BarChart(
                                data: data,
                                labels: labels,
                                labelStyle: TextStyle(fontSize: 18),
                                valueStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                displayValue: true,
                                reverse: true,
                                getColor: Data.getColor1,
                                getIcon: Data.getIcon,
                                barWidth: 45,
                                barSeparation: 20,
                                animationDuration: Duration(milliseconds: 1000),
                                animationCurve: Curves.easeInOutSine,
                                itemRadius: 10,
                                iconHeight: 24,
                                footerHeight: 24,
                                headerValueHeight: 16,
                                roundValuesOnText: false,
                                lineGridColor: light,
                              ),
                            ),
                          ],
                        ),
                        // Bar 4
                        ProductivityContainer(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 15, right: 15, left: 15),
                              child: Container(
                                width: 120,
                                height:
                                    MediaQuery.of(context).size.height * 0.32,
                                child: BarChart(
                                  data: dataYear,
                                  labels: labelsYear,
                                  labelStyle: TextStyle(fontSize: 18),
                                  valueStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  displayValue: true,
                                  reverse: true,
                                  getColor: Data.getColor,
                                  getIcon: Data.getIcon,
                                  barWidth: 45,
                                  barSeparation: 20,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  animationCurve: Curves.easeInOutSine,
                                  itemRadius: 10,
                                  iconHeight: 24,
                                  footerHeight: 24,
                                  headerValueHeight: 16,
                                  roundValuesOnText: false,
                                  lineGridColor: light,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 120,
                              height: MediaQuery.of(context).size.height * 0.32,
                              child: BarChart(
                                data: dataMonth,
                                labels: labelsMonth,
                                labelStyle: TextStyle(fontSize: 18),
                                valueStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                displayValue: true,
                                reverse: true,
                                getColor: Data.getColor2,
                                getIcon: Data.getIcon,
                                barWidth: 45,
                                barSeparation: 20,
                                animationDuration: Duration(milliseconds: 1000),
                                animationCurve: Curves.easeInOutSine,
                                itemRadius: 10,
                                iconHeight: 24,
                                footerHeight: 24,
                                headerValueHeight: 16,
                                roundValuesOnText: true,
                                lineGridColor: light,
                              ),
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            Container(
                              width: 250,
                              height: MediaQuery.of(context).size.height * 0.32,
                              child: BarChart(
                                data: data,
                                labels: labels,
                                labelStyle: TextStyle(fontSize: 18),
                                valueStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                displayValue: true,
                                reverse: true,
                                getColor: Data.getColor1,
                                getIcon: Data.getIcon,
                                barWidth: 45,
                                barSeparation: 20,
                                animationDuration: Duration(milliseconds: 1000),
                                animationCurve: Curves.easeInOutSine,
                                itemRadius: 10,
                                iconHeight: 24,
                                footerHeight: 24,
                                headerValueHeight: 16,
                                roundValuesOnText: false,
                                lineGridColor: light,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            )),
      ],
    );
  }
}

class Data {
  static Color getColor(double value) {
    return Colors.amber.shade900;
  }

  static Color getColor1(double value) {
    return Colors.amber.shade600;
  }

  static Color getColor2(double value) {
    return Colors.amber.shade300;
  }

  static Icon getIcon(double value) {
    return Icon(Icons.percent, size: 15);
  }
}

class Calender {
  dynamic year = [
    "2023",
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030",
    "2031",
    "2032",
    "2033",
    "2034",
    "2035",
    "2036",
    "2037",
    "2038",
    "2039",
    "2040",
    "2041",
  ];

  dynamic calender = [
    {
      "week": [1, 2, 3, 4],
      "month": "jan"
    },
    {
      "week": [5, 6, 7, 8],
      "month": "feb"
    }
  ];
}
