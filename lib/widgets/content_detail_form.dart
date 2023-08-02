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

class detail_form extends StatefulWidget {
  const detail_form({super.key});

  @override
  State<detail_form> createState() => _detail_formState();
}

class _detail_formState extends State<detail_form> {
  String? namaLaporan;
  String? shift;
  String? departement;
  String? product;
  String? line;

  TextEditingController actualOutput = TextEditingController();
  TextEditingController grossHour = TextEditingController();
  TextEditingController nominalSpeed = TextEditingController();
  TextEditingController totalHour = TextEditingController();
  TextEditingController netHour = TextEditingController();
  TextEditingController targetHour = TextEditingController();
  TextEditingController planningOutput = TextEditingController();

  dynamic Function() le = () {
    return "le";
  };
  dynamic Function() lp = () {
    return "lp";
  };
  dynamic Function() dt = () {
    return "dt";
  };
  dynamic Function() bd = () {
    return "bd";
  };

  int bLength = 1;

  String? mesins;
  String? reasons;

  //Breakdown
  List<String?> mesin = [];
  List<String?> reason = [];
  List<TextEditingController> freq = [];
  List<TextEditingController> dbMin = [];
  List<TextEditingController> problem = [];

  // //DownTime
  // List<String?> mesin = [];
  // List<String?> reason = [];
  // List<TextEditingController> freq = [];
  // List<TextEditingController> dbMin = [];
  // List<TextEditingController> problem = [];

  // //IdleTime
  // List<String?> mesin = [];
  // List<String?> reason = [];
  // List<TextEditingController> freq = [];
  // List<TextEditingController> dbMin = [];
  // List<TextEditingController> problem = [];

  MesinData() {
    mesin = [mesins];
  }

  ReasonData() {
    reason = [reasons];
  }

  // List<DownTime> downTime = [DownTime()];
  // List<IdleTime> idleTime = [IdleTime()];

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;

    for (int i = 0; i < bLength; i++) freq.add(TextEditingController());
    for (int i = 0; i < bLength; i++) dbMin.add(TextEditingController());
    for (int i = 0; i < bLength; i++) problem.add(TextEditingController());
    for (int i = 0; i < bLength; i++) mesin.add(mesins);
    for (int i = 0; i < bLength; i++) reason.add(reasons);

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
                                              child: Text("data")),
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
                                            CustomTextField(
                                              displayValue: "sss",
                                              readOnly: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text("Actual Output",
                                                  style: TextStyle(
                                                      color:
                                                          dark.withOpacity(0.8),
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              displayValue: "sss",
                                              readOnly: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text("Gross Hour",
                                                  style: TextStyle(
                                                      color:
                                                          dark.withOpacity(0.8),
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              displayValue: "sss",
                                              readOnly: true,
                                            ),
                                          ],
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
                                              child: Text("Departement",
                                                  style: TextStyle(
                                                      color:
                                                          dark.withOpacity(0.8),
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              displayValue: "sss",
                                              readOnly: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text("Nominal Speed",
                                                  style: TextStyle(
                                                      color:
                                                          dark.withOpacity(0.8),
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              displayValue: "sss",
                                              readOnly: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text("Net Hour",
                                                  style: TextStyle(
                                                      color:
                                                          dark.withOpacity(0.8),
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              displayValue: "sss",
                                              readOnly: true,
                                            ),
                                          ],
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
                                              displayValue: "sss",
                                              readOnly: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text("Total Hour",
                                                  style: TextStyle(
                                                      color:
                                                          dark.withOpacity(0.8),
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              displayValue: "sss",
                                              readOnly: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text("Target Hour",
                                                  style: TextStyle(
                                                      color:
                                                          dark.withOpacity(0.8),
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              displayValue: "sss",
                                              readOnly: true,
                                            ),
                                          ],
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
                                            displayValue: "sss",
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
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text("%LE",
                                                  style: TextStyle(
                                                      color:
                                                          dark.withOpacity(0.8),
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            DisplayField(
                                              value: le(),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text("%LP",
                                                  style: TextStyle(
                                                      color:
                                                          dark.withOpacity(0.8),
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            DisplayField(value: lp()),
                                          ],
                                        )
                                      ],
                                    )),
                                    Flexible(
                                        child: Row(children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            child: Text("%DT",
                                                style: TextStyle(
                                                    color:
                                                        dark.withOpacity(0.8),
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          DisplayField(value: dt()),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            child: Text("%BD",
                                                style: TextStyle(
                                                    color:
                                                        dark.withOpacity(0.8),
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          DisplayField(value: bd()),
                                        ],
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
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text("Planning Output",
                                                  style: TextStyle(
                                                      color:
                                                          dark.withOpacity(0.8),
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              displayValue: "sss",
                                              readOnly: true,
                                            ),
                                          ],
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
                                                          value: "iddhjhdjh",
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
                                                          value: "sss",
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
                                                          value: "sss",
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
                                                          value: "sss",
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
                                                          value: "sss",
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
                                                              child: TextField(
                                                                maxLines: 4,
                                                                controller:
                                                                    TextEditingController(),
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
                            Padding(
                                padding: EdgeInsets.only(left: 30, top: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Down Time",
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
                                          child: Column(children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Center(
                                                      child: Text("2",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: light))),
                                                  width: 25,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                      color: blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
                                                ),
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("DT",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    SmallTextfield(
                                                      value: "sss",
                                                      readOnly: true,
                                                      width: 150,
                                                      // controller: actMin,
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("Sub DT",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    SmallTextfield(
                                                      value: "sss",
                                                      readOnly: true,
                                                      width: 150,
                                                      // controller: actMin,
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("STD",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    SmallTextfield(
                                                      value: "sss",
                                                      readOnly: true,
                                                      width: 80,
                                                      // controller: actMin,
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("Act(Min)",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    SmallTextfield(
                                                      value: "sss",
                                                      readOnly: true,
                                                      width: 150,
                                                      // controller: actMin,
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("Act(Hour)",
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
                                                      value: "dt",
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                )
                                              ],
                                            ),
                                          ]),
                                        ))
                                  ],
                                )),
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
                                                      "3",
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
                                                      value: "sss",
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
                                                      value: "sss",
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
                                                      value: "idle",
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
                                )),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  for (int i = 0; i < bLength; i++) {
                                    var a = freq[i].text;
                                    var b = dbMin[i].text;
                                    var c = problem[i].text;
                                    var d = mesin[i];
                                    var e = reason[i];

                                    print(a);
                                    print(b);
                                    print(c);
                                    print(d);
                                    print(e);
                                  }
                                  freq.add(TextEditingController());
                                },
                                child: Container(
                                  margin: EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                      color: active,
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 120,
                                ),
                              ),
                            )
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
