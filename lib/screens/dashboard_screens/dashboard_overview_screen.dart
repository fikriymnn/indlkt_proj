import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:indlkt_proj/constants/style.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/detail_pouch.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/detail_proses.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_card.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_container.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_donut_button.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_overview_breakdown.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_overview_chart.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_overview_datepicker.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_overview_radial.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/detail_sachet.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/detail_tall_can.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DashboardOverview extends StatefulWidget {
  const DashboardOverview({super.key});

  @override
  State<DashboardOverview> createState() => _DashboardOverviewState();
}

class _DashboardOverviewState extends State<DashboardOverview> {
  List dataaa = [];

  List dataProses = [];
  List dataFilterProses = [];

  List dataPouch = [];
  List dataFilterPouch = [];

  int selectedShift = 0;
  int dropdownValue = 0;
  int showProgress = 0;
  DateTime? _fromSelectedDate = DateTime.now();
  DateTime? _toSelectedDate = DateTime.now();

  int? FromFix;
  int? ToFix;

  List<String> output2 = ["1", "2", "3", "4", "5"];
  Function? onClik;

  String selectedDateText(select) {
    return DateFormat("dd/MMMM/yyyy").format(select);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topBreakdown();
    DataProses();
  }

  List dataBreakdown = [];
  final map2 = <String, int>{};

  void topBreakdown() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("breakdown").get();
    setState(() {
      dataBreakdown = querySnapshot.docs.map((doc) => doc.data()).toList();
      var myList2 = List.generate(
          dataBreakdown.length, (index) => dataBreakdown[index]["top"]);

      for (final m in myList2) {
        final letter = m;
        map2[letter] = map2.containsKey(letter) ? map2[letter]! + 1 : 1;
      }

      output2 = map2.keys.toList(growable: false);
      output2.sort((k1, k2) => map2[k2]!.compareTo(map2[k1] as num));

      print(output2);
    });
  }

  void DataProses() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("product")
        .where("createdAt", isGreaterThanOrEqualTo: FromFix)
        .where("createdAt", isLessThanOrEqualTo: ToFix)
        .get();
    setState(() {
      dataProses = querySnapshot.docs.map((doc) => doc.data()).toList();
      dataProsesFilter();
      // for (var i = 0; i < dataaa.length; i++) {
      //   if (dataaa[i]["product"] == "Process_SKM") {
      //     dataProses.add(dataaa[i]);
      //   }
      // }

      // for (var i = 0; i < dataaa.length; i++) {
      //   if (dataaa[i]["product"] == "Filling_Packing_SKM_Pouch") {
      //     dataPouch.add(dataaa[i]);
      //   }
      // }
    });
  }

  void dataProsesFilter() {
    if (selectedShift == 0 && dropdownValue == 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["product"] == "Filling_Packing_SKM_Pouch") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterProses = data;
      });
    } else if (selectedShift != 0 && dropdownValue == 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["shift"] == selectedShift.toString() &&
            dataProses[i]["product"] == "Filling_Packing_SKM_Pouch") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterProses = data;
      });
    } else if (selectedShift == 0 && dropdownValue != 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["line"] == dropdownValue.toString() &&
            dataProses[i]["product"] == "Filling_Packing_SKM_Pouch") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterProses = data;
      });
    } else if (selectedShift != 0 && dropdownValue != 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["shift"] == selectedShift.toString() &&
            dataProses[i]["line"] == dropdownValue.toString() &&
            dataProses[i]["product"] == "Filling_Packing_SKM_Pouch ") {
          data.add(dataProses[i]);
        }
        setState(() {
          dataFilterProses = data;
        });
      }
    }

    print(dataFilterProses);
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Widget detail(v) {
      if (v == 1) {
        return Detail1(
          from: FromFix,
          to: ToFix,
          dropdownValue: dropdownValue,
          selectedShift: selectedShift,
        );
      } else if (v == 2) {
        return Detail2(
          dropdownValue: dropdownValue,
          selectedShift: selectedShift,
        );
      } else if (v == 3) {
        return Detail3(
          dropdownValue: dropdownValue,
          selectedShift: selectedShift,
        );
      } else if (v == 4) {
        return Detail4(
          dropdownValue: dropdownValue,
          selectedShift: selectedShift,
        );
      } else {
        return Container();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('product')
                    .where("createdAt", isGreaterThanOrEqualTo: FromFix)
                    .where("createdAt", isLessThanOrEqualTo: ToFix)
                    .snapshots(),
                builder: (context, snapshot) {
                  var Le, Lp, Bd, Dt, ActOutput, PlaningOutput, Skm;
                  double LeFix, LpFix, BdFix, DtFix, SkmFix;
                  if (!snapshot.hasData) {
                    LeFix = 0.0;
                    LpFix = 0.0;
                    BdFix = 0.0;
                    DtFix = 0.0;
                    SkmFix = 0.0;
                  } else {
                    final doc = snapshot.data!.docs;

                    Le = List.generate(doc.length, (index) {
                      double x = double.parse(doc[index]['le']);
                      String z = x.toStringAsFixed(0);
                      int a = int.parse(z);

                      return a;
                    }).fold(0, (p, c) => p + c);
                    Lp = List.generate(doc.length, (index) {
                      double x = double.parse(doc[index]['lp']);
                      String z = x.toStringAsFixed(0);
                      int a = int.parse(z);

                      return a;
                    }).fold(0, (p, c) => p + c);
                    Bd = List.generate(doc.length, (index) {
                      double x = double.parse(doc[index]['bd']);
                      String z = x.toStringAsFixed(0);
                      int a = int.parse(z);

                      return a;
                    }).fold(0, (p, c) => p + c);
                    Dt = List.generate(doc.length, (index) {
                      double x = double.parse(doc[index]['dt']);
                      String z = x.toStringAsFixed(0);
                      int a = int.parse(z);

                      return a;
                    }).fold(0, (p, c) => p + c);

                    ActOutput = List.generate(doc.length, (index) {
                      double x = double.parse(doc[index]['actual_output']);
                      String z = x.toStringAsFixed(0);
                      int a = int.parse(z);

                      return a;
                    }).fold(0, (p, c) => p + c);
                    PlaningOutput = List.generate(doc.length, (index) {
                      double x = double.parse(doc[index]['planing_output']);
                      String z = x.toStringAsFixed(0);
                      int a = int.parse(z);

                      return a;
                    }).fold(0, (p, c) => p + c);

                    if (Le == 0) {
                      LeFix = 0;
                    } else {
                      LeFix = Le / doc.length;
                    }

                    if (Lp == 0) {
                      LpFix = 0;
                    } else {
                      LpFix = Lp / doc.length;
                    }

                    if (Dt == 0) {
                      DtFix = 0;
                    } else {
                      DtFix = Dt / doc.length;
                    }
                    if (Bd == 0) {
                      BdFix = 0;
                    } else {
                      BdFix = Bd / doc.length;
                    }
                    if (ActOutput == 0 && PlaningOutput == 0) {
                      SkmFix = 0;
                    } else {
                      Skm = ActOutput / PlaningOutput;
                      SkmFix = Skm * 100;
                    }
                  }

                  return DashboardCard(
                      color: active,
                      Product: "SKM",
                      LE: LeFix.toStringAsFixed(0),
                      LP: LpFix.toStringAsFixed(0),
                      ProdAcv: SkmFix.toStringAsFixed(0),
                      DT: DtFix.toStringAsFixed(0),
                      BD: BdFix.toStringAsFixed(0));
                }),
            SizedBox(width: width * 0.042),
            DashboardCard(
                color: Color(0xff2BB8C1),
                Product: "UHT",
                LE: "-",
                LP: "-",
                ProdAcv: "-",
                DT: "-",
                BD: "-"),
            SizedBox(width: width * 0.042),
            DashboardCard(
                color: Color(0xff50E279),
                Product: "Factory",
                LE: "-",
                LP: "-",
                ProdAcv: "-",
                DT: "-",
                BD: "-")
          ],
        ),
        SizedBox(height: 15),
        Container(
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('From'),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            offset: Offset(0, 0),
                            color: dark.withOpacity(0.4))
                      ],
                      color: Color.fromARGB(255, 229, 228, 228),
                      border: Border.all(color: blue),
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                      onTap: () async {
                        DateTime? pickDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000));

                        setState(() {
                          _fromSelectedDate = pickDate;
                          int noww = _fromSelectedDate!.millisecondsSinceEpoch;

                          DateTime date =
                              DateTime.fromMillisecondsSinceEpoch(noww);
                          var moon;
                          var day;

                          if (date.month == 10 ||
                              date.month == 11 ||
                              date.month == 12) {
                            moon = "${date.month}";
                          } else {
                            moon = "0" + "${date.month}";
                          }

                          if (date.day == 1 ||
                              date.day == 2 ||
                              date.day == 3 ||
                              date.day == 4 ||
                              date.day == 5 ||
                              date.day == 6 ||
                              date.day == 7 ||
                              date.day == 8 ||
                              date.day == 9) {
                            day = "0" + "${date.day}";
                          } else {
                            day = "${date.day}";
                          }
                          String datetime = date.year.toString() + moon + day;
                          FromFix = int.parse(datetime);
                          print(FromFix);
                          DataProses();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 2, bottom: 2),
                        child: Text(
                            "${_fromSelectedDate != null ? selectedDateText(_fromSelectedDate) : DateFormat("dd/MMMM/yyyy").format(DateTime.now())}"),
                      )),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
              child: Container(width: 80, color: blue, height: 3),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('To'),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            offset: Offset(0, 0),
                            color: dark.withOpacity(0.4))
                      ],
                      color: Color.fromARGB(255, 229, 228, 228),
                      border: Border.all(color: blue),
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                      onTap: () async {
                        DateTime? pickDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000));

                        setState(() {
                          _toSelectedDate = pickDate;
                          int noww = _toSelectedDate!.millisecondsSinceEpoch;
                          DateTime date =
                              DateTime.fromMillisecondsSinceEpoch(noww);
                          var moon;
                          var day;

                          if (date.month == 10 ||
                              date.month == 11 ||
                              date.month == 12) {
                            moon = "${date.month}";
                          } else {
                            moon = "0" + "${date.month}";
                          }

                          if (date.day == 1 ||
                              date.day == 2 ||
                              date.day == 3 ||
                              date.day == 4 ||
                              date.day == 5 ||
                              date.day == 6 ||
                              date.day == 7 ||
                              date.day == 8 ||
                              date.day == 9) {
                            day = "0" + "${date.day}";
                          } else {
                            day = "${date.day}";
                          }
                          String datetime = date.year.toString() + moon + day;
                          ToFix = int.parse(datetime);
                          print(ToFix);
                          DataProses();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 2, bottom: 2),
                        child: Text(
                            "${_toSelectedDate != null ? selectedDateText(_toSelectedDate) : DateFormat("dd/MMMM/yyyy").format(DateTime.now())}"),
                      )),
                ),
              ],
            )
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardContainer(
                width: 1000,
                child: Stack(children: [
                  Row(
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
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  topLeft:
                                                      Radius.circular(10))),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedShift = 1;
                                              });
                                              dataProsesFilter();
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
                                            color: selectedShift == 2
                                                ? light
                                                : blue,
                                            border: Border.all(),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedShift = 2;
                                              });
                                              dataProsesFilter();
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
                                                  topRight:
                                                      Radius.circular(10))),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedShift = 3;
                                              });
                                              dataProsesFilter();
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
                                        dataProsesFilter();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            bottom: 2,
                                            right: 4,
                                            left: 4),
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
                                        border:
                                            Border.all(width: 1, color: blue),
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
                                              dataProsesFilter();
                                            },
                                            items: [
                                              DropdownMenuItem(
                                                child: Text("all"),
                                                value: 0,
                                              ),
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
                                        StreamBuilder(
                                            stream: selectedShift == 0 &&
                                                    dropdownValue == 0
                                                ? FirebaseFirestore.instance
                                                    .collection('product')
                                                    // .where("product",
                                                    //     isEqualTo:
                                                    //         "Process_SKM")
                                                    .where("createdAt",
                                                        isGreaterThanOrEqualTo:
                                                            FromFix)
                                                    .where("createdAt",
                                                        isLessThanOrEqualTo:
                                                            ToFix)
                                                    .snapshots()
                                                : selectedShift != 0 &&
                                                        dropdownValue == 0
                                                    ? FirebaseFirestore.instance
                                                        .collection('product')
                                                        .where("product",
                                                            isEqualTo:
                                                                "Process_SKM")
                                                        .where("shift",
                                                            isEqualTo:
                                                                selectedShift
                                                                    .toString())
                                                        // .where("createdAt",
                                                        //     isGreaterThanOrEqualTo:
                                                        //         FromFix)
                                                        // .where("createdAt",
                                                        //     isLessThanOrEqualTo:
                                                        //         ToFix)
                                                        .snapshots()
                                                    : selectedShift == 0 &&
                                                            dropdownValue != 0
                                                        ? FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'product')
                                                            .where("product",
                                                                isEqualTo:
                                                                    "Process_SKM")
                                                            .where("line",
                                                                isEqualTo:
                                                                    dropdownValue
                                                                        .toString())
                                                            // .where("createdAt",
                                                            //     isGreaterThanOrEqualTo:
                                                            //         FromFix)
                                                            // .where("createdAt",
                                                            //     isLessThanOrEqualTo:
                                                            //         ToFix)
                                                            .snapshots()
                                                        : selectedShift != 0 &&
                                                                dropdownValue !=
                                                                    0
                                                            ? FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'product')
                                                                .where(
                                                                    "product",
                                                                    isEqualTo:
                                                                        "Process_SKM")
                                                                .where("shift",
                                                                    isEqualTo:
                                                                        selectedShift
                                                                            .toString())
                                                                .where("line",
                                                                    isEqualTo:
                                                                        dropdownValue
                                                                            .toString())
                                                                // .where("createdAt", isGreaterThanOrEqualTo: FromFix)
                                                                // .where("createdAt", isLessThanOrEqualTo: ToFix)
                                                                .snapshots()
                                                            : null,
                                            builder: (context,
                                                AsyncSnapshot snapshot) {
                                              if (!snapshot.hasData) {
                                                return Text("no Data");
                                              }

                                              final doc = snapshot.data.docs;

                                              var leCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['le']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var lpCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['lp']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var bdCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['bd']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var dtCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['dt']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);

                                              var actualO = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]
                                                        ['actual_output']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var planingO = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]
                                                        ['planing_output']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);

                                              double LeFix = leCuy / doc.length;
                                              double LpFix = lpCuy / doc.length;
                                              double dtFix = dtCuy / doc.length;
                                              double bdFix = bdCuy / doc.length;
                                              double SkmFix =
                                                  actualO / planingO;

                                              return InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    showProgress = 1;
                                                  });
                                                },
                                                child: Column(
                                                  children: [
                                                    Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right: 5),
                                                              height: 15,
                                                              width: 15,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xffE48D9D),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                            ),
                                                            Text(
                                                              "Process_SKM",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Container(
                                                            child:
                                                                CircularPercentIndicator(
                                                              radius: 80.0,
                                                              lineWidth: 16.0,
                                                              percent: SkmFix,
                                                              center: RadialBar(
                                                                chartData: [
                                                                  ChartData(
                                                                      'LE',
                                                                      LeFix,
                                                                      blueLE),
                                                                  ChartData(
                                                                      'LP',
                                                                      LpFix,
                                                                      greenLP),
                                                                  ChartData(
                                                                      'DT',
                                                                      dtFix,
                                                                      redDT),
                                                                  ChartData(
                                                                      'BD',
                                                                      bdFix,
                                                                      orangeBD),
                                                                ],
                                                              ),
                                                              progressColor:
                                                                  const Color(
                                                                      0xffE48D9D),
                                                            ),
                                                          ),
                                                          CircularPercentIndicator(
                                                            radius: 30.0,
                                                            lineWidth: 12,
                                                            percent: 0.2,
                                                            center: Text("SKM"),
                                                            progressColor:
                                                                redSKM,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),

                                        // Radial Bar 2
                                        StreamBuilder(
                                            stream: selectedShift == 0 &&
                                                    dropdownValue == 0
                                                ? FirebaseFirestore.instance
                                                    .collection('product')
                                                    // .where("createdAt",
                                                    //     isGreaterThanOrEqualTo:
                                                    //         FromFix)
                                                    // .where("createdAt",
                                                    //     isLessThanOrEqualTo:
                                                    //         ToFix)

                                                    .where("product",
                                                        isEqualTo:
                                                            "Filling_Packing_SKM_Pouch")
                                                    .snapshots()
                                                : selectedShift != 0 &&
                                                        dropdownValue == 0
                                                    ? FirebaseFirestore.instance
                                                        .collection('product')
                                                        .where("product",
                                                            isEqualTo:
                                                                "Filling_Packing_SKM_Pouch")
                                                        .where("shift",
                                                            isEqualTo:
                                                                selectedShift
                                                                    .toString())
                                                        // .where("createdAt",
                                                        //     isGreaterThanOrEqualTo:
                                                        //         FromFix)
                                                        // .where("createdAt",
                                                        //     isLessThanOrEqualTo:
                                                        //         ToFix)
                                                        .snapshots()
                                                    : selectedShift == 0 &&
                                                            dropdownValue != 0
                                                        ? FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'product')
                                                            .where("product",
                                                                isEqualTo:
                                                                    "Filling_Packing_SKM_Pouch")
                                                            .where("line",
                                                                isEqualTo:
                                                                    dropdownValue
                                                                        .toString())
                                                            // .where("createdAt",
                                                            //     isGreaterThanOrEqualTo:
                                                            //         FromFix)
                                                            // .where("createdAt",
                                                            //     isLessThanOrEqualTo:
                                                            //         ToFix)
                                                            .snapshots()
                                                        : selectedShift != 0 &&
                                                                dropdownValue !=
                                                                    0
                                                            ? FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'product')
                                                                .where(
                                                                    "product",
                                                                    isEqualTo:
                                                                        "Filling_Packing_SKM_Pouch")
                                                                .where("shift",
                                                                    isEqualTo:
                                                                        selectedShift
                                                                            .toString())
                                                                .where("line",
                                                                    isEqualTo:
                                                                        dropdownValue
                                                                            .toString())
                                                                // .where("createdAt", isGreaterThanOrEqualTo: FromFix)
                                                                // .where("createdAt", isLessThanOrEqualTo: ToFix)
                                                                .snapshots()
                                                            : null,
                                            builder: (context,
                                                AsyncSnapshot snapshot) {
                                              if (!snapshot.hasData) {
                                                return Text("no Data");
                                              }

                                              final doc = snapshot.data.docs;

                                              var leCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['le']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var lpCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['lp']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var bdCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['bd']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var dtCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['dt']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);

                                              var actualO = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]
                                                        ['actual_output']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var planingO = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]
                                                        ['planing_output']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);

                                              double LeFix = leCuy / doc.length;
                                              double LpFix = lpCuy / doc.length;
                                              double dtFix = dtCuy / doc.length;
                                              double bdFix = bdCuy / doc.length;
                                              double SkmFix =
                                                  actualO / planingO;

                                              return InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    showProgress = 2;
                                                  });
                                                },
                                                child: Column(
                                                  children: [
                                                    Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right: 5),
                                                              height: 15,
                                                              width: 15,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xff872643),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                            ),
                                                            Text(
                                                              "Filling Packing SKM Pouch",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Container(
                                                            child:
                                                                CircularPercentIndicator(
                                                              radius: 80.0,
                                                              lineWidth: 16.0,
                                                              percent: SkmFix,
                                                              center: RadialBar(
                                                                chartData: [
                                                                  ChartData(
                                                                      'LE',
                                                                      LeFix,
                                                                      blueLE),
                                                                  ChartData(
                                                                      'LP',
                                                                      LpFix,
                                                                      greenLP),
                                                                  ChartData(
                                                                      'DT',
                                                                      dtFix,
                                                                      redDT),
                                                                  ChartData(
                                                                      'BD',
                                                                      bdFix,
                                                                      orangeBD),
                                                                ],
                                                              ),
                                                              progressColor:
                                                                  const Color(
                                                                      0xff872643),
                                                            ),
                                                          ),
                                                          CircularPercentIndicator(
                                                            radius: 30.0,
                                                            lineWidth: 12,
                                                            percent: 0.2,
                                                            center: Text("SKM"),
                                                            progressColor:
                                                                redSKM,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                        // Radial Bar 3
                                        StreamBuilder(
                                            stream: selectedShift == 0 &&
                                                    dropdownValue == 0
                                                ? FirebaseFirestore.instance
                                                    .collection('product')
                                                    // .where("createdAt",
                                                    //     isGreaterThanOrEqualTo:
                                                    //         FromFix)
                                                    // .where("createdAt",
                                                    //     isLessThanOrEqualTo:
                                                    //         ToFix)

                                                    .where("product",
                                                        isEqualTo:
                                                            "Filling_Packing_SKM_Tall_Can")
                                                    .snapshots()
                                                : selectedShift != 0 &&
                                                        dropdownValue == 0
                                                    ? FirebaseFirestore.instance
                                                        .collection('product')
                                                        .where("product",
                                                            isEqualTo:
                                                                "Filling_Packing_SKM_Tall_Can")
                                                        .where("shift",
                                                            isEqualTo:
                                                                selectedShift
                                                                    .toString())
                                                        // .where("createdAt",
                                                        //     isGreaterThanOrEqualTo:
                                                        //         FromFix)
                                                        // .where("createdAt",
                                                        //     isLessThanOrEqualTo:
                                                        //         ToFix)
                                                        .snapshots()
                                                    : selectedShift == 0 &&
                                                            dropdownValue != 0
                                                        ? FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'product')
                                                            .where("product",
                                                                isEqualTo:
                                                                    "Filling_Packing_SKM_Tall_Can")
                                                            .where("line",
                                                                isEqualTo:
                                                                    dropdownValue
                                                                        .toString())
                                                            // .where("createdAt",
                                                            //     isGreaterThanOrEqualTo:
                                                            //         FromFix)
                                                            // .where("createdAt",
                                                            //     isLessThanOrEqualTo:
                                                            //         ToFix)
                                                            .snapshots()
                                                        : selectedShift != 0 &&
                                                                dropdownValue !=
                                                                    0
                                                            ? FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'product')
                                                                .where(
                                                                    "product",
                                                                    isEqualTo:
                                                                        "Filling_Packing_SKM_Tall_Can")
                                                                .where("shift",
                                                                    isEqualTo:
                                                                        selectedShift
                                                                            .toString())
                                                                .where("line",
                                                                    isEqualTo:
                                                                        dropdownValue
                                                                            .toString())
                                                                // .where("createdAt", isGreaterThanOrEqualTo: FromFix)
                                                                // .where("createdAt", isLessThanOrEqualTo: ToFix)
                                                                .snapshots()
                                                            : null,
                                            builder: (context,
                                                AsyncSnapshot snapshot) {
                                              if (!snapshot.hasData) {
                                                return Text("no Data");
                                              }

                                              final doc = snapshot.data.docs;

                                              var leCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['le']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var lpCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['lp']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var bdCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['bd']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var dtCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['dt']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);

                                              var actualO = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]
                                                        ['actual_output']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var planingO = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]
                                                        ['planing_output']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);

                                              double LeFix = leCuy / doc.length;
                                              double LpFix = lpCuy / doc.length;
                                              double dtFix = dtCuy / doc.length;
                                              double bdFix = bdCuy / doc.length;
                                              double SkmFix =
                                                  actualO / planingO;

                                              return InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    showProgress = 3;
                                                  });
                                                },
                                                child: Column(
                                                  children: [
                                                    Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right: 5),
                                                              height: 15,
                                                              width: 15,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xff194B6D),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                            ),
                                                            Text(
                                                              "Filling Packing SKM Tall Can",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Container(
                                                            child:
                                                                CircularPercentIndicator(
                                                              radius: 80.0,
                                                              lineWidth: 16.0,
                                                              percent: SkmFix,
                                                              center: RadialBar(
                                                                chartData: [
                                                                  ChartData(
                                                                      'LE',
                                                                      LeFix,
                                                                      blueLE),
                                                                  ChartData(
                                                                      'LP',
                                                                      LpFix,
                                                                      greenLP),
                                                                  ChartData(
                                                                      'DT',
                                                                      dtFix,
                                                                      redDT),
                                                                  ChartData(
                                                                      'BD',
                                                                      bdFix,
                                                                      orangeBD),
                                                                ],
                                                              ),
                                                              progressColor:
                                                                  const Color(
                                                                      0xff194B6D),
                                                            ),
                                                          ),
                                                          CircularPercentIndicator(
                                                            radius: 30.0,
                                                            lineWidth: 12,
                                                            percent: 0.2,
                                                            center: Text("SKM"),
                                                            progressColor:
                                                                redSKM,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                        // Radial Bar 4
                                        StreamBuilder(
                                            stream: selectedShift == 0 &&
                                                    dropdownValue == 0
                                                ? FirebaseFirestore.instance
                                                    .collection('product')
                                                    // .where("createdAt",
                                                    //     isGreaterThanOrEqualTo:
                                                    //         FromFix)
                                                    // .where("createdAt",
                                                    //     isLessThanOrEqualTo:
                                                    //         ToFix)

                                                    .where("product",
                                                        isEqualTo:
                                                            "Filling_Packing_SKM_Sachet")
                                                    .snapshots()
                                                : selectedShift != 0 &&
                                                        dropdownValue == 0
                                                    ? FirebaseFirestore.instance
                                                        .collection('product')
                                                        .where("product",
                                                            isEqualTo:
                                                                "Filling_Packing_SKM_Sachet")
                                                        .where("shift",
                                                            isEqualTo:
                                                                selectedShift
                                                                    .toString())
                                                        // .where("createdAt",
                                                        //     isGreaterThanOrEqualTo:
                                                        //         FromFix)
                                                        // .where("createdAt",
                                                        //     isLessThanOrEqualTo:
                                                        //         ToFix)
                                                        .snapshots()
                                                    : selectedShift == 0 &&
                                                            dropdownValue != 0
                                                        ? FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'product')
                                                            .where("product",
                                                                isEqualTo:
                                                                    "Filling_Packing_SKM_Sachet")
                                                            .where("line",
                                                                isEqualTo:
                                                                    dropdownValue
                                                                        .toString())
                                                            // .where("createdAt",
                                                            //     isGreaterThanOrEqualTo:
                                                            //         FromFix)
                                                            // .where("createdAt",
                                                            //     isLessThanOrEqualTo:
                                                            //         ToFix)
                                                            .snapshots()
                                                        : selectedShift != 0 &&
                                                                dropdownValue !=
                                                                    0
                                                            ? FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'product')
                                                                .where(
                                                                    "product",
                                                                    isEqualTo:
                                                                        "Filling_Packing_SKM_Sachet")
                                                                .where("shift",
                                                                    isEqualTo:
                                                                        selectedShift
                                                                            .toString())
                                                                .where("line",
                                                                    isEqualTo:
                                                                        dropdownValue
                                                                            .toString())
                                                                // .where("createdAt", isGreaterThanOrEqualTo: FromFix)
                                                                // .where("createdAt", isLessThanOrEqualTo: ToFix)
                                                                .snapshots()
                                                            : null,
                                            builder: (context,
                                                AsyncSnapshot snapshot) {
                                              if (!snapshot.hasData) {
                                                return Text("no Data");
                                              }

                                              final doc = snapshot.data.docs;

                                              var leCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['le']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var lpCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['lp']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var bdCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['bd']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var dtCuy = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]['dt']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);

                                              var actualO = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]
                                                        ['actual_output']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);
                                              var planingO = List.generate(
                                                  doc.length, (index) {
                                                double x = double.parse(
                                                    doc[index]
                                                        ['planing_output']);
                                                String z = x.toStringAsFixed(0);
                                                int a = int.parse(z);

                                                return a;
                                              }).fold(0, (p, c) => p + c);

                                              double LeFix = leCuy / doc.length;
                                              double LpFix = lpCuy / doc.length;
                                              double dtFix = dtCuy / doc.length;
                                              double bdFix = bdCuy / doc.length;
                                              double SkmFix =
                                                  actualO / planingO;

                                              return InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    showProgress = 4;
                                                  });
                                                },
                                                child: Column(
                                                  children: [
                                                    Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right: 5),
                                                              height: 15,
                                                              width: 15,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xff297E6F),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                            ),
                                                            Text(
                                                              "Filling Packing SKM Sachet",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Container(
                                                            child:
                                                                CircularPercentIndicator(
                                                              radius: 80.0,
                                                              lineWidth: 16.0,
                                                              percent: SkmFix,
                                                              center: RadialBar(
                                                                chartData: [
                                                                  ChartData(
                                                                      'LE',
                                                                      LeFix,
                                                                      blueLE),
                                                                  ChartData(
                                                                      'LP',
                                                                      LpFix,
                                                                      greenLP),
                                                                  ChartData(
                                                                      'DT',
                                                                      dtFix,
                                                                      redDT),
                                                                  ChartData(
                                                                      'BD',
                                                                      bdFix,
                                                                      orangeBD),
                                                                ],
                                                              ),
                                                              progressColor:
                                                                  const Color(
                                                                      0xff297E6F),
                                                            ),
                                                          ),
                                                          CircularPercentIndicator(
                                                            radius: 30.0,
                                                            lineWidth: 12,
                                                            percent: 0.2,
                                                            center: Text("SKM"),
                                                            progressColor:
                                                                redSKM,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ]),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Column(
                                  children: [
                                    detail(showProgress),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset("assets/images/gears.png",
                            width: 120, height: 120),
                      ),
                    ],
                  )
                ])),
            SizedBox(width: 12),
            // DashboardContainer(
            //     height: 620,
            //     width: 375,
            //     child: Column(
            //       children: [
            //         SizedBox(height: 15),
            //         Text(
            //           "TOP 5 BREAKDOWN MESIN",
            //           style:
            //               TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //         ),
            //         SizedBox(height: 45),
            //         ListView.builder(
            //             itemCount: output2.length >= 6 ? 5 : output2.length,
            //             shrinkWrap: true,
            //             itemBuilder: (context, index) {
            //               return Column(
            //                 children: [
            //                   StreamBuilder(
            //                       stream: FirebaseFirestore.instance
            //                           .collection('breakdown')
            //                           .where("top", isEqualTo: output2[index])
            //                           .snapshots(),
            //                       builder: (context, snapshot) {
            //                         final doc = snapshot.data!.docs;
            //                         if (!snapshot.hasData) {
            //                           return Text("no Data");
            //                         }

            //                         var totalHour =
            //                             List.generate(doc.length, (index) {
            //                           double x =
            //                               double.parse(doc[index]['bdHour']);

            //                           return x;
            //                         }).reduce((a, b) => a + b);
            //                         return BreakdownItem(
            //                             title: doc[0]["mesin"],
            //                             desc: doc[0]["reason"],
            //                             number: totalHour.toStringAsFixed(2));
            //                       }),
            //                   SizedBox(
            //                     height: 25,
            //                   )
            //                 ],
            //               );
            //             })
            //       ],
            //     ))
          ],
        )
      ],
    );
  }
}

class Detail {
  Widget detail = Container();

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
