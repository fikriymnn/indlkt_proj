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

class breakdownDetail extends StatefulWidget {
  final String shift,
      departement,
      date,
      product,
      line,
      bdMin,
      bdHour,
      problem,
      freq,
      reason,
      mesin;

  const breakdownDetail({
    super.key,
    required this.shift,
    required this.departement,
    required this.product,
    required this.line,
    required this.date,
    required this.bdMin,
    required this.bdHour,
    required this.problem,
    required this.freq,
    required this.reason,
    required this.mesin,
  });

  @override
  State<breakdownDetail> createState() => _breakdownDetailState();
}

class _breakdownDetailState extends State<breakdownDetail> {
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
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Container(
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.cancel_outlined,
                                          color: Colors.red,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ),
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
                            Padding(
                                padding: EdgeInsets.only(left: 30, top: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Breakdown",
                                        style: TextStyle(
                                            color: dark.withOpacity(0.8),
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                        width: 900,
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
                                            child: Column(
                                              children: [
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
                                                        child: Center(
                                                            child: Text("1",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color:
                                                                        light))),
                                                        decoration: BoxDecoration(
                                                            color: blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100))),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text("Mesin",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        SmallTextfield(
                                                          value: widget.mesin,
                                                          readOnly: true,
                                                          width: 150,
                                                          hint: 'input2',
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text("Reason Breakdown",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        SmallTextfield(
                                                          width: 150,
                                                          value: widget.reason,
                                                          readOnly: true,
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text("Freq",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        SmallTextfield(
                                                          width: 80,
                                                          // controller: form,
                                                          value: widget.freq,
                                                          readOnly: true,
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text("BD Hour(Min)",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        SmallTextfield(
                                                          width: 150,
                                                          value: widget.bdMin,
                                                          readOnly: true,
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text("BD Hour",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        SmallTextfield(
                                                          width: 150,
                                                          // controller: form3,
                                                          readOnly: true,
                                                          value: widget.bdHour,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 25),
                                                Row(children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 70),
                                                            child: Text(
                                                                "Problem",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
                                                        SizedBox(height: 20),
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 40),
                                                            width: 400,
                                                            height: 90,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: light,
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: dark
                                                                      .withOpacity(
                                                                          0.5)),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 10,
                                                                      right: 10,
                                                                      top: 5),
                                                              child:
                                                                  TextFormField(
                                                                maxLines: 4,
                                                                initialValue:
                                                                    widget
                                                                        .problem,
                                                                readOnly: true,
                                                                decoration: InputDecoration.collapsed(
                                                                    hintText:
                                                                        "input",
                                                                    hintStyle: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        color: dark
                                                                            .withOpacity(0.3))),
                                                              ),
                                                            ))
                                                      ]),
                                                ])
                                              ],
                                            )))
                                  ],
                                )),
                            SizedBox(height: 20),
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
