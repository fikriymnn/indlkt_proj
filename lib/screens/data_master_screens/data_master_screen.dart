import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indlkt_proj/screens/data_master_screens/widget/breakdown_export.dart';
import 'package:indlkt_proj/screens/data_master_screens/widget/downtime_export.dart';
import 'package:indlkt_proj/screens/data_master_screens/widget/idle_time_export.dart';
import 'package:indlkt_proj/screens/data_master_screens/widget/tabel_breakdown.dart';
import 'package:indlkt_proj/screens/data_master_screens/widget/tabel_downtime.dart';
import 'package:indlkt_proj/screens/data_master_screens/widget/tabel_idletime.dart';

import 'package:indlkt_proj/widgets/tabel_plus.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:table_plus/table_plus.dart';

import '../../constants/style.dart';
import '../../widgets/appbar.dart';
import 'widget/custom_export.dart';
import '../../widgets/custom_container.dart';
import '../dashboard_screens/dashboard_overview_screen.dart';
import '../dashboard_screens/dashboard_productivity_screen.dart';
import '../product_acv_screens/product_acv_form.dart';

class DataMasterScreen extends StatefulWidget {
  const DataMasterScreen({super.key});

  @override
  State<DataMasterScreen> createState() => _DataMasterScreenState();
}

class _DataMasterScreenState extends State<DataMasterScreen> {
  int selectedIndex = 0;
  final List screens = [
    DashboardOverview(),
    DashboardProductivity(),
  ];
  Widget tabel(selectedIndex) {
    if (selectedIndex == 0) {
      return tabel_plus();
    } else if (selectedIndex == 1) {
      return tabel_breakdown();
    } else if (selectedIndex == 2) {
      return tabel_downtime();
    } else if (selectedIndex == 3) {
      return tabel_idletime();
    } else {
      return tabel_plus();
    }
  }

  Widget export(selectedIndex) {
    if (selectedIndex == 0) {
      return exportPage();
    } else if (selectedIndex == 1) {
      return exportBreakdown();
    } else if (selectedIndex == 2) {
      return exportDowntime();
    } else if (selectedIndex == 3) {
      return exportIdleTime();
    } else {
      return exportPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Data Master",
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 40, top: 20),
                //   child: Text('Data Master',
                //       style: TextStyle(
                //           color: blue,
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold)),
                // ),
                Padding(
                  padding: const EdgeInsets.only(right: 281, top: 35),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: light,
                                  elevation: 0,
                                  content: Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: export(selectedIndex)),
                                  ),
                                );
                                ;
                              },
                            );
                          },
                          child: Container(
                              margin: EdgeInsets.only(
                                  right: 5, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  color: active,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4,
                                        offset: Offset(0, 0),
                                        color: active)
                                  ],
                                  border: Border.all(
                                    color: red,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              width: 150,
                              height: 35,
                              padding: EdgeInsets.all(5),
                              child: Center(
                                  child: Row(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 9),
                                      child: Icon(
                                        Icons.download,
                                        color: light,
                                        size: 17,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Select Data",
                                    style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                        fontSize: 15,
                                        color: light),
                                  ),
                                ],
                              ))),
                        ),
                      ],
                    ),
                  ),
                ),

                CustomContainer(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 10),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.028),
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
                                            right: 15, top: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 4,
                                                  offset: Offset(0, 0),
                                                  color: dark.withOpacity(0.65))
                                            ],
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 2, 57, 101),
                                            ),
                                            color: selectedIndex == 0
                                                ? Color.fromARGB(
                                                    255, 195, 225, 250)
                                                : blue,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: 79,
                                        height: 38,
                                        padding: EdgeInsets.all(5),
                                        child: Center(
                                            child: Text(
                                          "Data Shift",
                                          style: GoogleFonts.montserrat(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                              fontSize: 10,
                                              color: selectedIndex == 0
                                                  ? dark
                                                  : light),
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
                                            right: 15, top: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 4,
                                                  offset: Offset(0, 0),
                                                  color: dark.withOpacity(0.65))
                                            ],
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 2, 57, 101),
                                            ),
                                            color: selectedIndex == 1
                                                ? Color.fromARGB(
                                                    255, 195, 225, 250)
                                                : blue,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: 144,
                                        height: 38,
                                        padding: EdgeInsets.all(5),
                                        child: Center(
                                            child: Text(
                                          "Data Breakdown",
                                          style: GoogleFonts.montserrat(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                              fontSize: 10,
                                              color: selectedIndex == 1
                                                  ? dark
                                                  : light),
                                        ))),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = 2;
                                      });
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            right: 15, top: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 4,
                                                  offset: Offset(0, 0),
                                                  color: dark.withOpacity(0.65))
                                            ],
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 2, 57, 101),
                                            ),
                                            color: selectedIndex == 2
                                                ? Color.fromARGB(
                                                    255, 195, 225, 250)
                                                : blue,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: 144,
                                        height: 38,
                                        padding: EdgeInsets.all(5),
                                        child: Center(
                                            child: Text(
                                          "Data Down Time",
                                          style: GoogleFonts.montserrat(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                              fontSize: 10,
                                              color: selectedIndex == 2
                                                  ? dark
                                                  : light),
                                        ))),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = 3;
                                      });
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            right: 15, top: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 4,
                                                  offset: Offset(0, 0),
                                                  color: dark.withOpacity(0.65))
                                            ],
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 2, 57, 101),
                                            ),
                                            color: selectedIndex == 3
                                                ? Color.fromARGB(
                                                    255, 195, 225, 250)
                                                : blue,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: 100,
                                        height: 38,
                                        padding: EdgeInsets.all(5),
                                        child: Center(
                                            child: Text(
                                          "Data Idle Time",
                                          style: GoogleFonts.montserrat(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                              fontSize: 10,
                                              color: selectedIndex == 3
                                                  ? dark
                                                  : light),
                                        ))),
                                  ),
                                ],
                              )),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    tabel(selectedIndex)
                  ],
                )),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
