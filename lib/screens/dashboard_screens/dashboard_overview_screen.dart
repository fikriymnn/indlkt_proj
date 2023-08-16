import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:indlkt_proj/constants/style.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_card.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_container.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_donut_button.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_overview_breakdown.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_overview_chart.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_overview_datepicker.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_overview_radial.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DashboardOverview extends StatefulWidget {
  const DashboardOverview({super.key});

  @override
  State<DashboardOverview> createState() => _DashboardOverviewState();
}

class _DashboardOverviewState extends State<DashboardOverview> {
  final List<DataItem> dataset = [
    DataItem(
        0.25,
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Tap here.',
              recognizer: TapGestureRecognizer()
                ..onTap = () => print('Tap Here onTap'),
            )
          ]),
        ),
        active),
    DataItem(
        0.25,
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Tap here.',
              recognizer: TapGestureRecognizer()
                ..onTap = () => print('Tap Here onTap'),
            )
          ]),
        ),
        blue),
    DataItem(
        0.25,
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Tap here.',
              recognizer: TapGestureRecognizer()
                ..onTap = () => print('Tap Here onTap'),
            )
          ]),
        ),
        light),
    DataItem(
        0.25,
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Tap here.',
              recognizer: TapGestureRecognizer()
                ..onTap = () => print('Tap Here onTap'),
            )
          ]),
        ),
        lightGrey),
  ];

  int selectedShift = 0;
  int dropdownValue = 1;
  int showProgress = 0;

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Widget detail(v) {
      if (v == 1) {
        return Detail().detail1;
      } else if (v == 2) {
        return Detail().detail2;
      } else if (v == 3) {
        return Detail().detail3;
      } else if (v == 4) {
        return Detail().detail4;
      } else {
        return Container();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DashboardCard(
                color: active,
                Product: "SKM",
                LE: 9.2,
                LP: 9.2,
                ProdAcv: 9.2,
                DT: 9.2,
                BD: 9.2),
            SizedBox(width: width * 0.042),
            DashboardCard(
                color: Color(0xff2BB8C1),
                Product: "UHT",
                LE: 9.2,
                LP: 9.2,
                ProdAcv: 9.2,
                DT: 9.2,
                BD: 9.2),
            SizedBox(width: width * 0.042),
            DashboardCard(
                color: Color(0xff50E279),
                Product: "Factory",
                LE: 9.2,
                LP: 9.2,
                ProdAcv: 9.2,
                DT: 9.2,
                BD: 9.2)
          ],
        ),
        SizedBox(height: 15),
        DatePicker(),
        SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardContainer(
                width: 900,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          "Pencapaian dan Performa",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Shift",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Row(children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: selectedShift == 1
                                                ? light
                                                : blue,
                                            border: Border.all(),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                topLeft: Radius.circular(10))),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedShift = 1;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: 8,
                                                left: 8,
                                                top: 1.5,
                                                bottom: 1.5),
                                            child: Text("1",
                                                style: TextStyle(
                                                    color: selectedShift == 1
                                                        ? dark
                                                        : light)),
                                          ),
                                        )),
                                    Container(
                                        decoration: BoxDecoration(
                                          color:
                                              selectedShift == 2 ? light : blue,
                                          border: Border.all(),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedShift = 2;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: 8,
                                                left: 8,
                                                top: 1.5,
                                                bottom: 1.5),
                                            child: Text("2",
                                                style: TextStyle(
                                                    color: selectedShift == 2
                                                        ? dark
                                                        : light)),
                                          ),
                                        )),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: selectedShift == 3
                                                ? light
                                                : blue,
                                            border: Border.all(),
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10),
                                                topRight: Radius.circular(10))),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedShift = 3;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: 8,
                                                left: 8,
                                                top: 1.5,
                                                bottom: 1.5),
                                            child: Text(
                                              "3",
                                              style: TextStyle(
                                                  color: selectedShift == 3
                                                      ? dark
                                                      : light),
                                            ),
                                          ),
                                        ))
                                  ]),
                                ],
                              ),
                              SizedBox(width: 10),
                              Container(
                                  decoration: BoxDecoration(
                                    color: selectedShift == 0 ? light : blue,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 4,
                                          offset: Offset(0, 0),
                                          color: dark.withOpacity(0.4))
                                    ],
                                    border: Border.all(width: 1, color: dark),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedShift = 0;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2, bottom: 2, right: 4, left: 4),
                                      child: Text("all shift",
                                          style: TextStyle(
                                              color: selectedShift == 0
                                                  ? dark
                                                  : light)),
                                    ),
                                  )),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Text("Line",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: light,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            offset: Offset(0, 0),
                                            color: dark.withOpacity(0.4))
                                      ],
                                      border: Border.all(width: 1, color: blue),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: DropdownButton(
                                          underline: Container(),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          value: dropdownValue,
                                          onChanged: (e) {
                                            setState(() {
                                              dropdownValue = e!;
                                            });
                                          },
                                          items: [
                                            DropdownMenuItem(
                                              child: Text("1"),
                                              value: 1,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("2"),
                                              value: 2,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("3"),
                                              value: 3,
                                            )
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                        SizedBox(
                          height: 20,
                        ),
                        //chart

                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 480,
                                height: 500,
                                child: GridView.count(
                                    childAspectRatio: 3 / 3,
                                    crossAxisCount: 2,
                                    children: [
                                      // Radial Bar 1
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            showProgress = 1;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 5),
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                          color: blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                    ),
                                                    Text("Filling_packing_SKM"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                CircularPercentIndicator(
                                                  radius: 80.0,
                                                  lineWidth: 16.0,
                                                  percent: 0.8,
                                                  center: RadialBar(
                                                    chartData: [
                                                      ChartData('David', 25,
                                                          Colors.cyanAccent),
                                                      ChartData('Steve', 38,
                                                          Colors.blueGrey),
                                                      ChartData(
                                                          'Jack',
                                                          34,
                                                          Colors
                                                              .deepOrangeAccent),
                                                      ChartData('Others', 52,
                                                          Colors.greenAccent)
                                                    ],
                                                  ),
                                                  progressColor: Colors.pink,
                                                ),
                                                CircularPercentIndicator(
                                                  radius: 30.0,
                                                  lineWidth: 12,
                                                  percent: 0.2,
                                                  center: Text("SKM"),
                                                  progressColor: Colors.pink,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Radial Bar 2
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            showProgress = 2;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 5),
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                          color: blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                    ),
                                                    Text("Filling_packing_SKM"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                CircularPercentIndicator(
                                                  radius: 80.0,
                                                  lineWidth: 16.0,
                                                  percent: 0.8,
                                                  center: RadialBar(
                                                    chartData: [
                                                      ChartData('David', 25,
                                                          Colors.cyanAccent),
                                                      ChartData('Steve', 38,
                                                          Colors.blueGrey),
                                                      ChartData(
                                                          'Jack',
                                                          34,
                                                          Colors
                                                              .deepOrangeAccent),
                                                      ChartData('Others', 52,
                                                          Colors.greenAccent)
                                                    ],
                                                  ),
                                                  progressColor: Colors.pink,
                                                ),
                                                CircularPercentIndicator(
                                                  radius: 30.0,
                                                  lineWidth: 12,
                                                  percent: 0.2,
                                                  center: Text("SKM"),
                                                  progressColor: Colors.pink,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Radial Bar 3
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            showProgress = 3;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 5),
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                          color: blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                    ),
                                                    Text("Filling_packing_SKM"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                CircularPercentIndicator(
                                                  radius: 80.0,
                                                  lineWidth: 16.0,
                                                  percent: 0.8,
                                                  center: RadialBar(
                                                    chartData: [
                                                      ChartData('David', 25,
                                                          Colors.cyanAccent),
                                                      ChartData('Steve', 38,
                                                          Colors.blueGrey),
                                                      ChartData(
                                                          'Jack',
                                                          34,
                                                          Colors
                                                              .deepOrangeAccent),
                                                      ChartData('Others', 52,
                                                          Colors.greenAccent)
                                                    ],
                                                  ),
                                                  progressColor: Colors.pink,
                                                ),
                                                CircularPercentIndicator(
                                                  radius: 30.0,
                                                  lineWidth: 12,
                                                  percent: 0.2,
                                                  center: Text("SKM"),
                                                  progressColor: Colors.pink,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Radial Bar 4
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            showProgress = 4;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 5),
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                          color: blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                    ),
                                                    Text("Filling_packing_SKM"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                CircularPercentIndicator(
                                                  radius: 80.0,
                                                  lineWidth: 16.0,
                                                  percent: 0.8,
                                                  center: RadialBar(
                                                    chartData: [
                                                      ChartData('David', 25,
                                                          Colors.cyanAccent),
                                                      ChartData('Steve', 38,
                                                          Colors.blueGrey),
                                                      ChartData(
                                                          'Jack',
                                                          34,
                                                          Colors
                                                              .deepOrangeAccent),
                                                      ChartData('Others', 52,
                                                          Colors.greenAccent)
                                                    ],
                                                  ),
                                                  progressColor: Colors.pink,
                                                ),
                                                CircularPercentIndicator(
                                                  radius: 30.0,
                                                  lineWidth: 12,
                                                  percent: 0.2,
                                                  center: Text("SKM"),
                                                  progressColor: Colors.pink,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Column(
                                children: [detail(showProgress)],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(width: 12),
            DashboardContainer(
                height: 620,
                width: 375,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Text(
                      "TOP 5 BREAKDOWN MESIN",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 45),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              BreakdownItem(
                                  title: "Utility",
                                  desc: "Listrik Trip/Deep Sag",
                                  number: 140),
                              SizedBox(
                                height: 35,
                              )
                            ],
                          );
                        })
                  ],
                ))
          ],
        )
      ],
    );
  }
}

class Detail {
  Widget detail = Container();

  Widget detail1 = Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Filling_packing_SKM"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(colors: [
                      Colors.green,
                      Color.fromARGB(255, 164, 219, 166)
                    ]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 100,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("41287/45000")
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BD"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(
                        colors: [blue, Color.fromARGB(255, 129, 141, 182)]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 80,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("94,59%")
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BD"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(
                        colors: [blue, Color.fromARGB(255, 129, 141, 182)]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 80,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("94,59%")
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BD"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(
                        colors: [blue, Color.fromARGB(255, 129, 141, 182)]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 80,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("94,59%")
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BD"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(
                        colors: [blue, Color.fromARGB(255, 129, 141, 182)]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 80,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("94,59%")
              ],
            ),
          ],
        ),
      ],
    ),
  );

  Widget detail2 = Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Filling_packing_SKM"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(colors: [
                      Colors.green,
                      Color.fromARGB(255, 164, 219, 166)
                    ]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 20,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("41287/45000")
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BD"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(
                        colors: [blue, Color.fromARGB(255, 129, 141, 182)]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 20,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("94,59%")
              ],
            ),
          ],
        ),
      ],
    ),
  );

  Widget detail3 = Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Filling_packing_SKM"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(colors: [
                      Colors.green,
                      Color.fromARGB(255, 164, 219, 166)
                    ]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 95,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("41287/45000")
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BD"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(
                        colors: [blue, Color.fromARGB(255, 129, 141, 182)]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 10,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("94,59%")
              ],
            ),
          ],
        ),
      ],
    ),
  );

  Widget detail4 = Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Filling_packing_SKM"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(colors: [
                      Colors.green,
                      Color.fromARGB(255, 164, 219, 166)
                    ]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 50,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("41287/45000")
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BD"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(
                        colors: [blue, Color.fromARGB(255, 129, 141, 182)]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 37,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("94,59%")
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
