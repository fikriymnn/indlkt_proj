import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/custom_dropdown.dart';
import 'package:indlkt_proj/widgets/appbar.dart';

import '../../constants/style.dart';
import '../../widgets/breakdown_form.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/display_field.dart';
import '../../widgets/down_time_form.dart';
import '../../widgets/idle_time_form.dart';
import '../../widgets/small_custom_dropdown.dart';
import '../../widgets/small_custom_textfield.dart';

class idletime_detail extends StatefulWidget {
  final String shift,
      departement,
      date,
      product,
      line,
      idleDesc,
      idleMin,
      name,
      nik,
      idleHour;

  const idletime_detail({
    super.key,
    required this.shift,
    required this.departement,
    required this.product,
    required this.line,
    required this.date,
    required this.idleDesc,
    required this.idleMin,
    required this.idleHour,
    required this.name,
    required this.nik,
  });

  @override
  State<idletime_detail> createState() => _idletime_detailState();
}

class _idletime_detailState extends State<idletime_detail> {
  String? namaLaporan, date;
  String? shift;
  String? departement;
  String? product;
  String? line;

  int bLength = 1;

  String? mesins;
  String? reasons;

  //Breakdown

  // List<DownTime> downTime = [DownTime()];
  // List<IdleTime> idleTime = [IdleTime()];

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(title: "Detail Data", viewTime: false),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 20, bottom: 20),
                    child: Container(
                        margin: EdgeInsets.only(left: mediaQueryWidth * 0.028),
                        width: mediaQueryWidth * 0.8,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
                                  color: dark.withOpacity(0.4))
                            ],
                            color: light,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Container(
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(widget.name,
                                      style: TextStyle(
                                          color: light, fontSize: 17)),
                                ),
                                decoration: BoxDecoration(
                                  color: blue,
                                  borderRadius: BorderRadius.circular(11),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        offset: Offset(0, 0),
                                        color: dark.withOpacity(0.4))
                                  ],
                                ),
                              )
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              Container(
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(widget.nik,
                                      style: TextStyle(
                                          color: light, fontSize: 17)),
                                ),
                                decoration: BoxDecoration(
                                  color: blue,
                                  borderRadius: BorderRadius.circular(11),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        offset: Offset(0, 0),
                                        color: dark.withOpacity(0.4))
                                  ],
                                ),
                              )
                            ]),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(height: 20),
                                  Center(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: mediaQueryWidth * 0.16,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: lightGrey,
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 4,
                                                  offset: Offset(0, 0),
                                                  color: dark.withOpacity(0.4))
                                            ],
                                            border: Border.all(
                                                width: 1, color: blue),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8, top: 10),
                                              child: Text(widget.date)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text("Shift",
                                                  style: TextStyle(
                                                      color:
                                                          dark.withOpacity(0.8),
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 41),
                                                  child: CustomTextField(
                                                    displayValue: widget.shift,
                                                    readOnly: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text("Departement",
                                                  style: TextStyle(
                                                      color:
                                                          dark.withOpacity(0.8),
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              displayValue: widget.departement,
                                              readOnly: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text("Product",
                                                  style: TextStyle(
                                                      color:
                                                          dark.withOpacity(0.8),
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              displayValue: widget.product,
                                              readOnly: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            child: Text("Line",
                                                style: TextStyle(
                                                    color:
                                                        dark.withOpacity(0.8),
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          CustomTextField(
                                            displayValue: widget.line,
                                            readOnly: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                        child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [],
                                        )
                                      ],
                                    )),
                                    Flexible(
                                        child: Row(children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      )
                                    ]))
                                  ]),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [],
                                        ),
                                      ),
                                      Flexible(child: Container()),
                                      Flexible(child: Container())
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                                padding: EdgeInsets.only(left: 30, top: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Idle Time",
                                        style: TextStyle(
                                            color: dark.withOpacity(0.8),
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                        margin: EdgeInsets.only(top: 40),
                                        width: 600,
                                        decoration: BoxDecoration(
                                          color: light,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 4,
                                                offset: Offset(0, 2),
                                                color: dark.withOpacity(0.8))
                                          ],
                                          border: Border.all(
                                              width: 3, color: lightGrey),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 11,
                                              bottom: 11),
                                          child: Column(children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    width: 25,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        color: blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100)),
                                                    child: Center(
                                                        child: Text(
                                                      "1",
                                                      style: TextStyle(
                                                          color: light),
                                                    ))),
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("Idle Desc",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    SmallTextfield(
                                                      readOnly: true,
                                                      width: 150,
                                                      value: widget.idleDesc,
                                                      // controller: idleMin,
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("Idle(Min)",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    SmallTextfield(
                                                      readOnly: true,
                                                      width: 150,
                                                      value: widget.idleMin,
                                                      // controller: idleMin,
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("Idle(Hour)",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    SmallTextfield(
                                                      width: 150,
                                                      readOnly: true,
                                                      value: widget.idleHour,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                )
                                              ],
                                            ),
                                          ]),
                                        )),
                                    SizedBox(height: 30),
                                  ],
                                ))
                          ],
                        ))),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
