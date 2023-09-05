import 'dart:math';

import 'package:chart_components/bar_chart_component.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widget_productivity.dart/chart.dart';
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

  dynamic labelTahunNow = "";
  dynamic labelTahunThen = "";
  dynamic labelWeek1 = "";
  dynamic labelWeek2 = "";
  dynamic labelWeek3 = "";
  dynamic labelWeek4 = "";
  dynamic labelmoon1 = "";
  dynamic labelmoon2 = "";

//Value data Ctn
  dynamic tahunNowCtn = 0;
  dynamic tahunThenCtn = 0;
  dynamic week1Ctn = 0;
  dynamic week2Ctn = 0;
  dynamic week3Ctn = 0;
  dynamic week4Ctn = 0;
  dynamic moon1Ctn = 0;
  dynamic moon2Ctn = 0;

  final db = FirebaseFirestore.instance;
  List dataProductCtn = [];

  getTahunNow() async {
    var tahunn = int.parse(tahun);
    QuerySnapshot querySnapshot =
        await db.collection("product").where("tahun", isEqualTo: tahunn).get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        tahunNowCtn = tahunFix * 100;

        weekSort1 = findMax(List.generate(
            dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        print(weekSort1);
      } else {
        setState(() {
          tahunNowCtn = 0;
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
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;

        tahunThenCtn = tahunFix * 100;
      } else {
        setState(() {
          tahunThenCtn = 0;
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
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var weekFik = actualO / planingO;

        week1Ctn = weekFik * 100;
      } else {
        setState(() {
          week1Ctn = 0;
        });
      }
      labelWeek1 = weeks1.toString();
      getWeek2();
      getMoon(weeks1);
    });
  }

  getWeek2() async {
    var tahunn = int.parse(tahun);

    var weeks2;
    if (weekSort1 == 1) {
      weeks2 = 0;
    } else {
      weeks2 = weekSort1 - 1;
    }
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("week", isEqualTo: weeks2)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var weekFik = actualO / planingO;

        week2Ctn = weekFik * 100;
        weekSort2 = weeks2;
      } else {
        setState(() {
          week2Ctn = 0;
          weekSort2 = weeks2;
        });
      }
      labelWeek2 = weeks2.toString();
      getWeek3();
    });
  }

  getWeek3() async {
    var tahunn = int.parse(tahun);

    var weeks3;
    if (weekSort1 == 1) {
      weeks3 = 0;
    } else {
      weeks3 = weekSort2 - 1;
    }
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("week", isEqualTo: weeks3)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var weekFik = actualO / planingO;

        week3Ctn = weekFik * 100;
        weekSort3 = weeks3;
      } else {
        setState(() {
          week3Ctn = 0;
          weekSort3 = weeks3;
        });
      }
      labelWeek3 = weeks3.toString();
      getWeek4();
    });
  }

  getWeek4() async {
    var tahunn = int.parse(tahun);

    var weeks4;
    if (weekSort1 == 1) {
      weeks4 = 0;
    } else {
      weeks4 = weekSort3 - 1;
    }
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("week", isEqualTo: weeks4)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var weekFik = actualO / planingO;

        week4Ctn = weekFik * 100;
        weekSort4 = weeks4;
      } else {
        setState(() {
          week4Ctn = 0;
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
        moonSort2 = "-";
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
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var moonFik = actualO / planingO;

        moon1Ctn = moonFik * 100;
        moonSort1 = moon;
      } else {
        setState(() {
          moon1Ctn = 0;
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
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var moonFik = actualO / planingO;

        moon2Ctn = moonFik * 100;
        moonSort2 = moon;
      } else {
        setState(() {
          moon2Ctn = 0;
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
                        ChartProductivity(
                            title: "Production Archievement (CTN)",
                            labelMoon1: labelmoon1,
                            labelMoon2: labelmoon2,
                            labelTahunNow: labelTahunNow,
                            labelTahunThen: labelTahunThen,
                            labelWeek1: labelWeek1,
                            labelWeek2: labelWeek2,
                            labelWeek3: labelWeek3,
                            labelWeek4: labelWeek4,
                            moon1: moon1Ctn,
                            moon2: moon2Ctn,
                            tahunNow: tahunNowCtn,
                            tahunThen: tahunThenCtn,
                            week1: week1Ctn,
                            week2: week2Ctn,
                            week3: week3Ctn,
                            week4: week4Ctn)
                        // Bar 2
                      ],
                    ),
                    Row(
                      children: [
                        // Bar 3

                        // Bar 4
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
