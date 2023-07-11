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

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
                width: 700,
                height: 420,
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
                        //chart
                        Row(
                          children: [
                            Container(
                              child: Column(children: [
                                Row(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 50.0,
                                          lineWidth: 10,
                                          percent: 1.0,
                                          center: RadialBar(
                                            chartData: [
                                              ChartData('David', 25,
                                                  Colors.cyanAccent),
                                              ChartData(
                                                  'Steve', 38, Colors.blueGrey),
                                              ChartData('Jack', 34,
                                                  Colors.deepOrangeAccent),
                                              ChartData('Others', 52,
                                                  Colors.greenAccent)
                                            ],
                                          ),
                                          progressColor: Colors.pink,
                                        ),
                                        CircularPercentIndicator(
                                          radius: 20.0,
                                          lineWidth: 10,
                                          percent: 1.0,
                                          center: Text("SKM"),
                                        )
                                      ],
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 50.0,
                                          lineWidth: 12,
                                          percent: 1.0,
                                          center: RadialBar(
                                            chartData: [
                                              ChartData('David', 25,
                                                  Colors.cyanAccent),
                                              ChartData(
                                                  'Steve', 38, Colors.blueGrey),
                                              ChartData('Jack', 34,
                                                  Colors.deepOrangeAccent),
                                              ChartData('Others', 52,
                                                  Colors.greenAccent)
                                            ],
                                          ),
                                          progressColor: Colors.pink,
                                        ),
                                        CircularPercentIndicator(
                                          radius: 20.0,
                                          lineWidth: 12,
                                          percent: 1.0,
                                          center: Text("SKM"),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 50.0,
                                          lineWidth: 10,
                                          percent: 1.0,
                                          center: RadialBar(
                                            chartData: [
                                              ChartData('David', 25,
                                                  Colors.cyanAccent),
                                              ChartData(
                                                  'Steve', 38, Colors.blueGrey),
                                              ChartData('Jack', 34,
                                                  Colors.deepOrangeAccent),
                                              ChartData('Others', 52,
                                                  Colors.greenAccent)
                                            ],
                                          ),
                                          progressColor: Colors.pink,
                                        ),
                                        CircularPercentIndicator(
                                          radius: 20.0,
                                          lineWidth: 10,
                                          percent: 1.0,
                                          center: Text("SKM"),
                                        )
                                      ],
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 50.0,
                                          lineWidth: 10,
                                          percent: 1.0,
                                          center: RadialBar(
                                            chartData: [
                                              ChartData('David', 25,
                                                  Colors.cyanAccent),
                                              ChartData(
                                                  'Steve', 38, Colors.blueGrey),
                                              ChartData('Jack', 34,
                                                  Colors.deepOrangeAccent),
                                              ChartData('Others', 52,
                                                  Colors.greenAccent)
                                            ],
                                          ),
                                          progressColor: Colors.pink,
                                        ),
                                        CircularPercentIndicator(
                                          radius: 20.0,
                                          lineWidth: 10,
                                          percent: 1.0,
                                          center: Text("SKM"),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 100,
                              height: 80,
                              child: Column(
                                children: [
                                  FAProgressBar(
                                    borderRadius: BorderRadius.circular(1),
                                    progressColor: Colors.green,
                                    size: 15,
                                    currentValue: 80,
                                  ),
                                  FAProgressBar(
                                    borderRadius: BorderRadius.circular(1),
                                    progressColor: Colors.green,
                                    size: 15,
                                    currentValue: 80,
                                  ),
                                  FAProgressBar(
                                    borderRadius: BorderRadius.circular(1),
                                    progressColor: Colors.green,
                                    size: 15,
                                    currentValue: 80,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: 270),
                    Image(
                      image: AssetImage("assets/images/gears.png"),
                      width: 100,
                    ),
                  ],
                )),
            SizedBox(width: 12),
            DashboardContainer(
                height: 420,
                width: 375,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Text(
                      "TOP 5 BREAKDOWN MESIN",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return BreakdownItem();
                        })
                  ],
                ))
          ],
        )
      ],
    );
  }
}
