import 'dart:math';

import 'package:chart_components/bar_chart_component.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_container.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_productivity_container.dart';

import '../../constants/style.dart';
import 'package:intl/intl.dart';

class DashboardProductivity extends StatefulWidget {
  const DashboardProductivity({super.key});

  @override
  State<DashboardProductivity> createState() => _DashboardProductivityState();
}

class _DashboardProductivityState extends State<DashboardProductivity> {
  @override
  void initState() {
    // TODO: implement initState
    getTahunNow();

    super.initState();
  }

  var tahun = DateFormat.y().format(DateTime.now());

  var weekSort1 = 4;
  var weekSort2;
  var weekSort3;
  var weekSort4;

  var moonSort1;
  var moonSort2;

  dynamic tahunNow = 0;
  dynamic tahunThen = 0;
  dynamic week1 = 0;
  dynamic week2 = 0;
  dynamic week3 = 0;
  dynamic week4 = 0;
  dynamic moon1 = 0;
  dynamic moon2 = 0;
  dynamic labelTahunNow = "";
  dynamic labelTahunThen = "";
  dynamic labelWeek1 = "";
  dynamic labelWeek2 = "";
  dynamic labelWeek3 = "";
  dynamic labelWeek4 = "";
  dynamic labelmoon1 = "";
  dynamic labelmoon2 = "";

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

  final db = FirebaseFirestore.instance;
  List dataProduct = [];

  getTahunNow() async {
    var tahunn = int.parse(tahun);
    QuerySnapshot querySnapshot =
        await db.collection("product").where("tahun", isEqualTo: tahunn).get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProduct = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        tahunNow = tahunFix * 100;

        weekSort1 = findMax(List.generate(
            dataProduct.length, (index) => dataProduct[index]['week']));
        print(weekSort1);
      } else {
        setState(() {
          tahunNow = 0;
          weekSort1 = 4;
        });
      }
      labelTahunNow = tahun.toString();
      getTahunthen();
      getWeek1();
    });
  }

  int findMax(List<int> numbers) {
    return numbers.reduce(max);
  }

  getTahunthen() async {
    var tahunn = int.parse(tahun);
    var Tahun = tahunn - 1;
    QuerySnapshot querySnapshot =
        await db.collection("product").where("tahun", isEqualTo: Tahun).get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProduct = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;

        tahunThen = tahunFix * 100;
      } else {
        setState(() {
          tahunThen = 0;
        });
      }
      labelTahunThen = Tahun.toString();
    });
  }

  getWeek1() async {
    var tahunn = int.parse(tahun);

    var weeks1 = weekSort1;
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("week", isEqualTo: weeks1)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProduct = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var weekFik = actualO / planingO;

        week1 = weekFik * 100;
      } else {
        setState(() {
          week1 = 0;
        });
      }
      labelWeek1 = weeks1.toString();
      getWeek2();
      getMoon(weeks1);
    });
  }

  getWeek2() async {
    var tahunn = int.parse(tahun);

    var weeks2 = weekSort1 - 1;
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("week", isEqualTo: weeks2)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProduct = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var weekFik = actualO / planingO;

        week2 = weekFik * 100;
        weekSort2 = weeks2;
      } else {
        setState(() {
          week2 = 0;
          weekSort2 = weeks2;
        });
      }
      labelWeek2 = weeks2.toString();
      getWeek3();
    });
  }

  getWeek3() async {
    var tahunn = int.parse(tahun);

    var weeks3 = weekSort2 - 1;
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("week", isEqualTo: weeks3)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProduct = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var weekFik = actualO / planingO;

        week3 = weekFik * 100;
        weekSort3 = weeks3;
      } else {
        setState(() {
          week3 = 0;
          weekSort3 = weeks3;
        });
      }
      labelWeek3 = weeks3.toString();
      getWeek4();
    });
  }

  getWeek4() async {
    var tahunn = int.parse(tahun);

    var weeks4 = weekSort3 - 1;
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("week", isEqualTo: weeks4)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProduct = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var weekFik = actualO / planingO;

        week4 = weekFik * 100;
        weekSort4 = weeks4;
      } else {
        setState(() {
          week4 = 0;
          weekSort4 = weeks4;
        });
      }
      labelWeek4 = weeks4.toString();
    });
  }

  getMoon(weekSort) {
    if (weekSort == 1 || weekSort == 2 || weekSort == 3 || weekSort == 4) {
      setState(() {
        moonSort1 = "January";
        moonSort2 = "December";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 5 ||
        weekSort == 6 ||
        weekSort == 7 ||
        weekSort == 8) {
      setState(() {
        moonSort1 = "February";
        moonSort2 = "January";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 9 ||
        weekSort == 10 ||
        weekSort == 11 ||
        weekSort == 12 ||
        weekSort == 13) {
      setState(() {
        moonSort1 = "March";
        moonSort2 = "February";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 14 ||
        weekSort == 15 ||
        weekSort == 16 ||
        weekSort == 17) {
      setState(() {
        moonSort1 = "April";
        moonSort2 = "March";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 18 ||
        weekSort == 19 ||
        weekSort == 20 ||
        weekSort == 21) {
      setState(() {
        moonSort1 = "May";
        moonSort2 = "April";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 22 ||
        weekSort == 23 ||
        weekSort == 24 ||
        weekSort == 25 ||
        weekSort == 26) {
      setState(() {
        moonSort1 = "June";
        moonSort2 = "May";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 27 ||
        weekSort == 28 ||
        weekSort == 29 ||
        weekSort == 30) {
      setState(() {
        moonSort1 = "July";
        moonSort2 = "June";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 31 ||
        weekSort == 32 ||
        weekSort == 33 ||
        weekSort == 34) {
      setState(() {
        moonSort1 = "August";
        moonSort2 = "July";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 35 ||
        weekSort == 36 ||
        weekSort == 37 ||
        weekSort == 38 ||
        weekSort == 39) {
      setState(() {
        moonSort1 = "September";
        moonSort2 = "August";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 40 ||
        weekSort == 41 ||
        weekSort == 42 ||
        weekSort == 43) {
      setState(() {
        moonSort1 = "October";
        moonSort2 = "September";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 44 ||
        weekSort == 45 ||
        weekSort == 46 ||
        weekSort == 47) {
      setState(() {
        moonSort1 = "November";
        moonSort2 = "October";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 48 ||
        weekSort == 49 ||
        weekSort == 50 ||
        weekSort == 51 ||
        weekSort == 52) {
      setState(() {
        moonSort1 = "December";
        moonSort2 = "November";
        getMoon1(moonSort1, moonSort2);
      });
    }
  }

  getMoon1(moonAwal, moonAkhir) async {
    var tahunn = int.parse(tahun);

    var moon = moonAwal;
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("bulan", isEqualTo: moon)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProduct = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var moonFik = actualO / planingO;

        moon1 = moonFik * 100;
        moonSort1 = moon;
      } else {
        setState(() {
          moon1 = 0;
        });
      }
      labelmoon1 = moon.toString();
      getMoon2(moonAkhir);
    });
  }

  getMoon2(moonAkhir) async {
    var tahunn = int.parse(tahun);

    var moon = moonAkhir;
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("bulan", isEqualTo: moon)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProduct = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProduct.length, (index) {
          double x = double.parse(dataProduct[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var moonFik = actualO / planingO;

        moon2 = moonFik * 100;
        moonSort2 = moon;
      } else {
        setState(() {
          moon2 = 0;
        });
      }
      labelmoon2 = moon.toString();
    });
  }

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
                        Text("Filter Week",
                            style: TextStyle(fontWeight: FontWeight.bold)),
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
                                items: [
                                  1,
                                  2,
                                  3,
                                  4,
                                  5,
                                  6,
                                  7,
                                  8,
                                  9,
                                  10,
                                  11,
                                  12,
                                  13,
                                  14,
                                  15,
                                  16,
                                  17,
                                  18,
                                  19,
                                  20,
                                  21,
                                  22,
                                  23,
                                  24,
                                  25,
                                  26,
                                  27,
                                  28,
                                  29,
                                  30,
                                  31,
                                  32,
                                  33,
                                  34,
                                  35,
                                  36,
                                  37,
                                  38,
                                  39,
                                  40,
                                  41,
                                  42,
                                  43,
                                  44,
                                  45,
                                  46,
                                  47,
                                  48,
                                  49,
                                  50,
                                  51,
                                  52
                                ],
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
                                dropDownMenuItems: [
                                  1,
                                  2,
                                  3,
                                  4,
                                  5,
                                  6,
                                  7,
                                  8,
                                  9,
                                  10,
                                  11,
                                  12,
                                  13,
                                  14,
                                  15,
                                  16,
                                  17,
                                  18,
                                  19,
                                  20,
                                  21,
                                  22,
                                  23,
                                  24,
                                  25,
                                  26,
                                  27,
                                  28,
                                  29,
                                  30,
                                  31,
                                  32,
                                  33,
                                  34,
                                  35,
                                  36,
                                  37,
                                  38,
                                  39,
                                  40,
                                  41,
                                  42,
                                  43,
                                  44,
                                  45,
                                  46,
                                  47,
                                  48,
                                  49,
                                  50,
                                  51,
                                  52
                                ],
                                onChanged: (a) {
                                  setState(() {
                                    weekSort1 = a;
                                  });
                                  getWeek1();
                                },
                              ),
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Filter Year",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
                                    tahun = a;
                                  });
                                  getTahunNow();
                                  getWeek1();
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
                              fontSize: 30),
                        ),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        // Bar 1
                        ProductivityContainer(
                          proTitle: 'Production Archievement (CTN)',
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 15, right: 15, left: 15),
                              child: Container(
                                width: 120,
                                height:
                                    MediaQuery.of(context).size.height * 0.32,
                                child: BarChart(
                                  data: [tahunThen, tahunNow],
                                  labels: [labelTahunThen, labelTahunNow],
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
                                data: [moon2, moon1],
                                labels: [labelmoon2, labelmoon1],
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
                                data: [
                                  week1,
                                  week2,
                                  week3,
                                  week4,
                                ],
                                labels: [
                                  labelWeek1,
                                  labelWeek2,
                                  labelWeek3,
                                  labelWeek4
                                ],
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
                          proTitle: 'LE Process',
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
                          proTitle: 'LE Fillpack',
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
                          proTitle: 'LP Process',
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
