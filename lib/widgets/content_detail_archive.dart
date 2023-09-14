import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/small_custom_textfield.dart';

import '../constants/style.dart';
import 'custom_textfield.dart';
import 'display_field.dart';

class ContentDetailArchive extends StatefulWidget {
  final String id;
  const ContentDetailArchive({super.key, required this.id});

  @override
  State<ContentDetailArchive> createState() => _ContentDetailArchiveState();
}

class _ContentDetailArchiveState extends State<ContentDetailArchive> {
  @override
  Widget build(BuildContext context) {
    dynamic mediaQueryWidth = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("archive")
            .where("uid", isEqualTo: widget.id)
            .snapshots(),
        builder: (context, snapshot) {
          final doc = snapshot.data!.docs;
          return ListView.builder(
              itemCount: doc.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                dynamic name = doc[index]["name"];
                dynamic shift = doc[index]["shift"];
                dynamic date = doc[index]["date"];
                dynamic departement = doc[index]["departement"];
                dynamic product = doc[index]["product"];
                dynamic line = doc[index]["line"];
                dynamic planing = doc[index]["planing_output"];
                dynamic actual = doc[index]["actual_output"];
                dynamic speed = doc[index]["nominal_speed"];
                dynamic totalHour = doc[index]["total_hour"];
                dynamic grossHour = doc[index]["gross_hour"];
                dynamic netHour = doc[index]["net_hour"];
                dynamic target = doc[index]["target_hour"];
                dynamic lp = doc[index]["lp"];
                dynamic le = doc[index]["le"];
                dynamic dt = doc[index]["dt"];
                dynamic bd = doc[index]["bd"];
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              right: 20, top: 20, bottom: 20),
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: mediaQueryWidth * 0.028),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(children: [
                                          Container(
                                            height: 40,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(name,
                                                  style: TextStyle(
                                                      color: light,
                                                      fontSize: 17)),
                                            ),
                                            decoration: BoxDecoration(
                                              color: blue,
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 5,
                                                    offset: Offset(0, 0),
                                                    color:
                                                        dark.withOpacity(0.4))
                                              ],
                                            ),
                                          )
                                        ]),
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
                                                        color: dark
                                                            .withOpacity(0.4))
                                                  ],
                                                  border: Border.all(
                                                      width: 1, color: blue),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8,
                                                            right: 8,
                                                            top: 10),
                                                    child: Text(date)),
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: Text("Shift",
                                                        style: TextStyle(
                                                            color: dark
                                                                .withOpacity(
                                                                    0.8),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  CustomTextField(
                                                    displayValue: shift,
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: Text("Actual Output",
                                                        style: TextStyle(
                                                            color: dark
                                                                .withOpacity(
                                                                    0.8),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  CustomTextField(
                                                    displayValue: actual,
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: Text("Gross Hour",
                                                        style: TextStyle(
                                                            color: dark
                                                                .withOpacity(
                                                                    0.8),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  CustomTextField(
                                                    displayValue: grossHour,
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: Text("Departement",
                                                        style: TextStyle(
                                                            color: dark
                                                                .withOpacity(
                                                                    0.8),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  CustomTextField(
                                                    displayValue: departement,
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: Text("Nominal Speed",
                                                        style: TextStyle(
                                                            color: dark
                                                                .withOpacity(
                                                                    0.8),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  CustomTextField(
                                                    displayValue: speed,
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: Text("Net Hour",
                                                        style: TextStyle(
                                                            color: dark
                                                                .withOpacity(
                                                                    0.8),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  CustomTextField(
                                                    displayValue: netHour,
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: Text("Product",
                                                        style: TextStyle(
                                                            color: dark
                                                                .withOpacity(
                                                                    0.8),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  CustomTextField(
                                                    displayValue: product,
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: Text("Total Hour",
                                                        style: TextStyle(
                                                            color: dark
                                                                .withOpacity(
                                                                    0.8),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  CustomTextField(
                                                    displayValue: totalHour,
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: Text("Target Hour",
                                                        style: TextStyle(
                                                            color: dark
                                                                .withOpacity(
                                                                    0.8),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  CustomTextField(
                                                    displayValue: target,
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
                                                      const EdgeInsets.only(
                                                          left: 30),
                                                  child: Text("Line",
                                                      style: TextStyle(
                                                          color: dark
                                                              .withOpacity(0.8),
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                CustomTextField(
                                                  displayValue: line,
                                                  readOnly: true,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: Text("%LE",
                                                        style: TextStyle(
                                                            color: dark
                                                                .withOpacity(
                                                                    0.8),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  DisplayField(
                                                    value: le,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: Text("%LP",
                                                        style: TextStyle(
                                                            color: dark
                                                                .withOpacity(
                                                                    0.8),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  DisplayField(value: lp),
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
                                                      const EdgeInsets.only(
                                                          left: 30),
                                                  child: Text("%DT",
                                                      style: TextStyle(
                                                          color: dark
                                                              .withOpacity(0.8),
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                DisplayField(value: dt),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 30),
                                                  child: Text("%BD",
                                                      style: TextStyle(
                                                          color: dark
                                                              .withOpacity(0.8),
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                DisplayField(value: bd),
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: Text(
                                                        "Planning Output",
                                                        style: TextStyle(
                                                            color: dark
                                                                .withOpacity(
                                                                    0.8),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  CustomTextField(
                                                    displayValue: planing,
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
                                      padding:
                                          EdgeInsets.only(left: 30, top: 50),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                    color:
                                                        dark.withOpacity(0.8))
                                              ],
                                              border: Border.all(
                                                  width: 3, color: lightGrey),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: StreamBuilder(
                                                stream: FirebaseFirestore
                                                    .instance
                                                    .collection('archive')
                                                    .doc(widget.id)
                                                    .collection("breakdown")
                                                    .snapshots(),
                                                builder: (context, snapshot) {
                                                  final doc =
                                                      snapshot.data!.docs;
                                                  if (!snapshot.hasData) {
                                                    return Text("");
                                                  }

                                                  return ListView.builder(
                                                      itemCount: doc.length,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (context, index) {
                                                        String mesin =
                                                            doc[index]
                                                                    ["mesin"] ??
                                                                "-";
                                                        String reason = doc[
                                                                    index]
                                                                ["reason"] ??
                                                            "-";
                                                        String freq = doc[index]
                                                                ["freq"] ??
                                                            "-";
                                                        String bdMin =
                                                            doc[index]
                                                                    ["bdMin"] ??
                                                                "-";
                                                        String bdHour = doc[
                                                                    index]
                                                                ["bdHour"] ??
                                                            "-";
                                                        String problem = doc[
                                                                    index]
                                                                ["problem"] ??
                                                            "-";
                                                        return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20,
                                                                    right: 20,
                                                                    top: 11,
                                                                    bottom: 11),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                        width:
                                                                            25,
                                                                        height:
                                                                            25,
                                                                        child: Center(
                                                                            child:
                                                                                Text("${index + 1}", style: TextStyle(fontSize: 15, color: light))),
                                                                        decoration: BoxDecoration(color: blue, borderRadius: BorderRadius.circular(100))),
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                            "Mesin",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold)),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        SmallTextfield(
                                                                          value:
                                                                              mesin,
                                                                          readOnly:
                                                                              true,
                                                                          width:
                                                                              150,
                                                                          hint:
                                                                              'input2',
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                            "Reason Breakdown",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold)),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        SmallTextfield(
                                                                          width:
                                                                              150,
                                                                          value:
                                                                              reason,
                                                                          readOnly:
                                                                              true,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                            "Freq",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold)),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        SmallTextfield(
                                                                          width:
                                                                              80,
                                                                          // controller: form,
                                                                          value:
                                                                              freq,
                                                                          readOnly:
                                                                              true,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                            "BD Hour(Min)",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold)),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        SmallTextfield(
                                                                          width:
                                                                              150,
                                                                          value:
                                                                              bdMin,
                                                                          readOnly:
                                                                              true,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                            "BD Hour",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold)),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        SmallTextfield(
                                                                          width:
                                                                              150,
                                                                          // controller: form3,
                                                                          readOnly:
                                                                              true,
                                                                          value:
                                                                              bdHour,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    )
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 25),
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
                                                                                EdgeInsets.only(left: 70),
                                                                            child: Text("Problem", style: TextStyle(fontWeight: FontWeight.bold))),
                                                                        SizedBox(
                                                                            height:
                                                                                20),
                                                                        Container(
                                                                            margin:
                                                                                EdgeInsets.only(left: 40),
                                                                            width: 400,
                                                                            height: 90,
                                                                            decoration: BoxDecoration(
                                                                              color: light,
                                                                              border: Border.all(width: 1, color: dark.withOpacity(0.5)),
                                                                              borderRadius: BorderRadius.circular(5),
                                                                            ),
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                                                              child: TextFormField(
                                                                                maxLines: 4,
                                                                                initialValue: problem,
                                                                                readOnly: true,
                                                                                decoration: InputDecoration.collapsed(hintText: "input", hintStyle: TextStyle(fontSize: 13, color: dark.withOpacity(0.3))),
                                                                              ),
                                                                            ))
                                                                      ]),
                                                                ])
                                                              ],
                                                            ));
                                                      });
                                                }),
                                          )
                                        ],
                                      )),
                                  SizedBox(height: 20),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 30, top: 50),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                    color:
                                                        dark.withOpacity(0.8))
                                              ],
                                              border: Border.all(
                                                  width: 3, color: lightGrey),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: StreamBuilder(
                                                stream: FirebaseFirestore
                                                    .instance
                                                    .collection('archive')
                                                    .doc(widget.id)
                                                    .collection("downtime")
                                                    .snapshots(),
                                                builder: (context, snapshot) {
                                                  final doc =
                                                      snapshot.data!.docs;
                                                  if (!snapshot.hasData) {
                                                    return Text("");
                                                  }

                                                  return ListView.builder(
                                                      itemCount: doc.length,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (context, index) {
                                                        String dt = doc[index]
                                                                ["dt"] ??
                                                            "-";
                                                        String subDt =
                                                            doc[index]
                                                                    ["subDt"] ??
                                                                "-";
                                                        String std = doc[index]
                                                                ["std"] ??
                                                            "-";
                                                        String actMin = doc[
                                                                    index]
                                                                ["actMin"] ??
                                                            "-";
                                                        String actHour = doc[
                                                                    index]
                                                                ["actHour"] ??
                                                            "-";

                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20,
                                                                  right: 20,
                                                                  top: 11,
                                                                  bottom: 11),
                                                          child: Column(
                                                              children: [
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      child: Center(
                                                                          child: Text(
                                                                              "${index + 1}",
                                                                              style: TextStyle(fontSize: 15, color: light))),
                                                                      width: 25,
                                                                      height:
                                                                          25,
                                                                      decoration: BoxDecoration(
                                                                          color:
                                                                              blue,
                                                                          borderRadius:
                                                                              BorderRadius.circular(100)),
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                            "DT",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold)),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        SmallTextfield(
                                                                          value:
                                                                              dt,
                                                                          readOnly:
                                                                              true,
                                                                          width:
                                                                              150,
                                                                          // controller: actMin,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                            "Sub DT",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold)),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        SmallTextfield(
                                                                          value:
                                                                              subDt,
                                                                          readOnly:
                                                                              true,
                                                                          width:
                                                                              150,
                                                                          // controller: actMin,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                            "STD",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold)),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        SmallTextfield(
                                                                          value:
                                                                              std,
                                                                          readOnly:
                                                                              true,
                                                                          width:
                                                                              80,
                                                                          // controller: actMin,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                            "Act(Min)",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold)),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        SmallTextfield(
                                                                          value:
                                                                              actMin,
                                                                          readOnly:
                                                                              true,
                                                                          width:
                                                                              150,
                                                                          // controller: actMin,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                            "Act(Hour)",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold)),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        SmallTextfield(
                                                                          readOnly:
                                                                              true,
                                                                          width:
                                                                              150,
                                                                          value:
                                                                              actHour,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    )
                                                                  ],
                                                                ),
                                                              ]),
                                                        );
                                                      });
                                                }),
                                          )
                                        ],
                                      )),
                                  SizedBox(height: 20),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 30, top: 50),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                    color:
                                                        dark.withOpacity(0.8))
                                              ],
                                              border: Border.all(
                                                  width: 3, color: lightGrey),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: StreamBuilder(
                                                stream: FirebaseFirestore
                                                    .instance
                                                    .collection('archive')
                                                    .doc(widget.id)
                                                    .collection("idle_time")
                                                    .snapshots(),
                                                builder: (context, snapshot) {
                                                  final doc =
                                                      snapshot.data!.docs;
                                                  if (!snapshot.hasData) {
                                                    return Text("");
                                                  }

                                                  return ListView.builder(
                                                      itemCount: doc.length,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (context, index) {
                                                        String idleDes = doc[
                                                                    index]
                                                                ["idleDesc"] ??
                                                            "-";
                                                        String idleMin = doc[
                                                                    index]
                                                                ["idleMin"] ??
                                                            "-";
                                                        String idleHour = doc[
                                                                    index]
                                                                ["idleHour"] ??
                                                            "-";

                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20,
                                                                  right: 20,
                                                                  top: 11,
                                                                  bottom: 11),
                                                          child: Column(
                                                              children: [
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                        width:
                                                                            25,
                                                                        height:
                                                                            25,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                blue,
                                                                            borderRadius:
                                                                                BorderRadius.circular(100)),
                                                                        child: Center(
                                                                            child: Text(
                                                                          "${index + 1}",
                                                                          style:
                                                                              TextStyle(color: light),
                                                                        ))),
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                            "Idle Desc",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold)),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        SmallTextfield(
                                                                          readOnly:
                                                                              true,
                                                                          width:
                                                                              150,
                                                                          value:
                                                                              idleDes,
                                                                          // controller: idleMin,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                            "Idle(Min)",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold)),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        SmallTextfield(
                                                                          readOnly:
                                                                              true,
                                                                          width:
                                                                              150,
                                                                          value:
                                                                              idleMin,
                                                                          // controller: idleMin,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                            "Idle(Hour)",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold)),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        SmallTextfield(
                                                                          width:
                                                                              150,
                                                                          readOnly:
                                                                              true,
                                                                          value:
                                                                              idleHour,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    )
                                                                  ],
                                                                ),
                                                              ]),
                                                        );
                                                      });
                                                }),
                                          ),
                                          SizedBox(height: 30),
                                        ],
                                      )),
                                ],
                              ))),
                    ]);
              });
        });
  }
}
