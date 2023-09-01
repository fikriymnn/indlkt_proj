import 'dart:async';
import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_search/flutter_dropdown_search.dart';
import 'package:indlkt_proj/widgets/custom_dropdown.dart';
import 'package:indlkt_proj/widgets/appbar.dart';
import 'package:uuid/uuid.dart';

import '../../constants/style.dart';
import '../../widgets/breakdown_form.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/display_field.dart';
import '../../widgets/down_time_form.dart';
import '../../widgets/idle_time_form.dart';
import '../../widgets/large_display_field.dart';
import '../../widgets/small_custom_dropdown.dart';
import '../../widgets/small_custom_textfield.dart';
import 'package:intl/intl.dart';

class FormInputData extends StatefulWidget {
  const FormInputData({super.key});

  @override
  State<FormInputData> createState() => _FormInputDataState();
}

class _FormInputDataState extends State<FormInputData> {
  //Breadkdown dropdown
  List<String>? bdMesinList = [""];
  List<String>? subDTList = [''];
  List<DropdownMenuItem<String>> lineList = [];
  List listToSearch = ["Acep", "Lutfi", "Tio"];

  var selected;
  late List selectedList;

  //List data form
  bool _isLoading = false;
  String? bdHourTotal = '0';
  String? actHourTotal = '0';
  String? idleHourTotal = '0';

  String? bdHourChild = "0";
  String? actHourChild = "0";
  String? idleHourChild = "0";

  List<String?> bdHourList = [];
  List<String?> actHourList = [];
  List<String?> idleHourList = [];

  //Product Form
  String grossHour = "0";
  String actualOutputs = "0";
  String nominalSpeeds = "0";
  String totalHours = "0";
  String netHour = "0";
  String targetHour = "0";
  String le = "0";
  String lp = "0";
  String dt = "0";
  String bd = "0";
  String zz = "60";

  String? namaLaporan;
  String? shift;
  String? departement;
  String? product;
  String? line;

  TextEditingController actualOutput = TextEditingController();
  TextEditingController _controller = TextEditingController();

  TextEditingController nominalSpeed = TextEditingController();
  TextEditingController totalHour = TextEditingController();

  TextEditingController planningOutput = TextEditingController();
  TextEditingController weekController = TextEditingController();

  //Breakdown
  int bLength = 1;

  String? mesins;
  String? reasons;
  var reasonLists = [""];

  var reasonList = [];
  List<String?> mesin = [];
  List<String?> reason = [];
  List<TextEditingController> freq = [];
  List<TextEditingController> dbMin = [];
  List<TextEditingController> problem = [];
  List<String?> bdHour = [];

  //DownTime
  int dLength = 1;

  String? downtimes;
  String? subDTs;
  String? stds = "";

  List<String?> downtime = [];
  List<String?> subDT = [];
  List<String?> std = [];
  List<TextEditingController> actMin = [];

  //IdleTime
  int iLength = 1;

  String? idleDescs;

  List<String?> idleDesc = [];
  List<TextEditingController> idleMin = [];

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;

    //breakdown
    for (int i = 0; i < bLength; i++) freq.add(TextEditingController());
    for (int i = 0; i < bLength; i++)
      dbMin.add(TextEditingController(text: "0"));
    for (int i = 0; i < bLength; i++) problem.add(TextEditingController());
    for (int i = 0; i < bLength; i++) mesin.add(mesins);
    for (int i = 0; i < bLength; i++) reason.add(reasons);
    for (int i = 0; i < bLength; i++) bdHourList.add(bdHourChild);
    for (int i = 0; i < bLength; i++) reasonList.add(reasonLists);

    //downtime
    for (int i = 0; i < dLength; i++)
      actMin.add(TextEditingController(text: "0"));
    for (int i = 0; i < dLength; i++) subDT.add(subDTs);
    for (int i = 0; i < dLength; i++) downtime.add(downtimes);
    for (int i = 0; i < dLength; i++) std.add(stds);
    for (int i = 0; i < bLength; i++) actHourList.add(actHourChild);

    //idle time
    for (int i = 0; i < iLength; i++)
      idleMin.add(TextEditingController(text: "0"));
    for (int i = 0; i < iLength; i++) idleDesc.add(idleDescs);
    for (int i = 0; i < bLength; i++) idleHourList.add(idleHourChild);

    return Scaffold(
      appBar: CustomAppBar(title: "Input Data"),
      body: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 20),
                child: Row(
                  children: [
                    Text('Laporan Acv/',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    Text('Tambah Data Baru',
                        style: TextStyle(
                            color: blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(right: 20, top: 20, bottom: 20),
                  child: Container(
                      margin: EdgeInsets.only(left: mediaQueryWidth * 0.028),
                      width: mediaQueryWidth * 0.8,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            offset: Offset(0, 0),
                            color: dark.withOpacity(0.4))
                      ], color: light, borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Center(
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: lightGrey,
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
                                        hint: Text("Pilih Nama Laporan"),
                                        underline: Container(),
                                        borderRadius: BorderRadius.circular(10),
                                        value: namaLaporan,
                                        onChanged: (e) {
                                          setState(() {
                                            namaLaporan = e!;
                                            if (namaLaporan == "Process_SKM") {
                                              bdMesinList =
                                                  DataBD().process_SKM_Mesin;
                                              lineList = Line().process;
                                            } else if (namaLaporan ==
                                                "Filling_Packing_SKM_Can") {
                                              bdMesinList = DataBD()
                                                  .filling_SKM_Can_Mesin;
                                              lineList = Line().skm_can;
                                            } else if (namaLaporan ==
                                                "Filling_Packing_SKM_Tall_Can") {
                                              bdMesinList =
                                                  DataBD().filling_SKM_Tall_Can;
                                              lineList = Line().skm_can;
                                            } else if (namaLaporan ==
                                                "Filling_Packing_SKM_Sachet") {
                                              bdMesinList =
                                                  DataBD().filling_SKM_Sachet;
                                              lineList = Line().skm_sachet;
                                            } else if (namaLaporan ==
                                                "Filling_Packing_SKM_Pouch") {
                                              bdMesinList =
                                                  DataBD().filling_SKM_Pouch;
                                              lineList = Line().skm_pouch;
                                            }
                                          });
                                        },
                                        items: [
                                          DropdownMenuItem(
                                            child: Text(
                                                "Filling_Packing_SKM_Pouch"),
                                            value: "Filling_Packing_SKM_Pouch",
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                                "Filling_Packing_SKM_Sachet"),
                                            value: "Filling_Packing_SKM_Sachet",
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                                "Filling_Packing_SKM_Tall_Can"),
                                            value:
                                                "Filling_Packing_SKM_Tall_Can",
                                          ),
                                          DropdownMenuItem(
                                            child:
                                                Text("Filling_Packing_SKM_Can"),
                                            value: "Filling_Packing_SKM_Can",
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Process_SKM"),
                                            value: "Process_SKM",
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text("Shift",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        CustomDropdown(
                                            hintText: "Pilih Shift...",
                                            onChange: (e) {
                                              setState(() {
                                                shift = e;
                                              });
                                            },
                                            value: shift,
                                            dropdownItems: [
                                              DropdownMenuItem(
                                                child: Text("1"),
                                                value: "1",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("2"),
                                                value: "2",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("3"),
                                                value: "3",
                                              )
                                            ]),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            child: Text("Actual Output",
                                                style: TextStyle(
                                                    color:
                                                        dark.withOpacity(0.8),
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          CustomTextField(
                                            hint: "Masukan Actual Output...",
                                            controller: actualOutput,
                                            onChange: (value) {
                                              setState(() {
                                                var target = num.parse(value) /
                                                    num.parse(nominalSpeeds);

                                                targetHour =
                                                    target.toStringAsFixed(2);

                                                actualOutputs =
                                                    value.toString();
                                                var leV =
                                                    num.parse(targetHour) /
                                                        num.parse(netHour);
                                                var lpV =
                                                    num.parse(targetHour) /
                                                        num.parse(grossHour);
                                                var dtV =
                                                    num.parse(actHourTotal!) /
                                                        num.parse(grossHour);
                                                var bdV =
                                                    num.parse(bdHourTotal!) /
                                                        num.parse(netHour);
                                                bd = bdV.toStringAsFixed(2);
                                                dt = dtV.toStringAsFixed(2);
                                                le = leV.toStringAsFixed(2);
                                                lp = lpV.toStringAsFixed(2);
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            child: Text("Gross Hour",
                                                style: TextStyle(
                                                    color:
                                                        dark.withOpacity(0.8),
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          largeDisplayField(
                                            value: grossHour,
                                          )
                                        ],
                                      ),
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
                                              const EdgeInsets.only(left: 30),
                                          child: Text("Departement",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        CustomDropdown(
                                            hintText: "Pilih Departement...",
                                            onChange: (e) {
                                              setState(() {
                                                departement = e;
                                              });
                                            },
                                            value: departement,
                                            dropdownItems: [
                                              DropdownMenuItem(
                                                child: Text("SKM"),
                                                value: "SKM",
                                              )
                                            ]),
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
                                              const EdgeInsets.only(left: 30),
                                          child: Text("Nominal Speed",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        CustomTextField(
                                          hint: "Masukan Nominal Speed...",
                                          controller: nominalSpeed,
                                          onChange: (value) {
                                            setState(() {
                                              var target =
                                                  num.parse(actualOutputs) /
                                                      num.parse(value);
                                              var speed = num.parse(value);
                                              nominalSpeeds = speed.toString();
                                              targetHour =
                                                  target.toStringAsFixed(2);
                                              var leV = num.parse(targetHour) /
                                                  num.parse(netHour);
                                              var lpV = num.parse(targetHour) /
                                                  num.parse(grossHour);
                                              var dtV =
                                                  num.parse(actHourTotal!) /
                                                      num.parse(grossHour);
                                              var bdV =
                                                  num.parse(bdHourTotal!) /
                                                      num.parse(netHour);
                                              bd = bdV.toStringAsFixed(2);
                                              dt = dtV.toStringAsFixed(2);
                                              le = leV.toStringAsFixed(2);
                                              lp = lpV.toStringAsFixed(2);
                                            });
                                          },
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
                                              const EdgeInsets.only(left: 30),
                                          child: Text("Net Hour",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        largeDisplayField(value: netHour)
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
                                              const EdgeInsets.only(left: 30),
                                          child: Text("Product",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        CustomDropdown(
                                            hintText: "Pilih Product...",
                                            onChange: (e) {
                                              setState(() {
                                                product = e;
                                              });
                                            },
                                            value: product,
                                            dropdownItems: [
                                              DropdownMenuItem(
                                                child: Text(
                                                    "Filling_Packing_SKM_Pouch"),
                                                value:
                                                    "Filling_Packing_SKM_Pouch",
                                              ),
                                              DropdownMenuItem(
                                                child: Text(
                                                    "Filling_Packing_SKM_Sachet"),
                                                value:
                                                    "Filling_Packing_SKM_Sachet",
                                              ),
                                              DropdownMenuItem(
                                                child: Text(
                                                    "Filling_Packing_SKM_Tall_Can"),
                                                value:
                                                    "Filling_Packing_SKM_Tall_Can",
                                              ),
                                              DropdownMenuItem(
                                                child: Text(
                                                    "Filling_Packing_SKM_Can"),
                                                value:
                                                    "Filling_Packing_SKM_Can",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("Process_SKM"),
                                                value: "Process_SKM",
                                              )
                                            ]),
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
                                              const EdgeInsets.only(left: 30),
                                          child: Text("Total Hour",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        CustomTextField(
                                          hint: "Masukan Total Hour",
                                          controller: totalHour,
                                          onChange: (value) {
                                            setState(() {
                                              var gress = num.parse(value) -
                                                  num.parse(idleHourTotal!);

                                              var net = gress -
                                                  num.parse(actHourTotal!);
                                              //gross hour digit
                                              grossHour =
                                                  gress.toStringAsFixed(2);
                                              netHour = net.toStringAsFixed(2);
                                              var leV = num.parse(targetHour) /
                                                  num.parse(netHour);
                                              var lpV = num.parse(targetHour) /
                                                  num.parse(grossHour);
                                              var dtV =
                                                  num.parse(actHourTotal!) /
                                                      num.parse(grossHour);
                                              var bdV =
                                                  num.parse(bdHourTotal!) /
                                                      num.parse(netHour);

                                              totalHours = value.toString();
                                              bd = bdV.toStringAsFixed(2);
                                              dt = dtV.toStringAsFixed(2);
                                              le = leV.toStringAsFixed(2);
                                              lp = lpV.toStringAsFixed(2);
                                            });
                                          },
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
                                              const EdgeInsets.only(left: 30),
                                          child: Text("Target Hour",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        largeDisplayField(value: targetHour)
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
                                                color: dark.withOpacity(0.8),
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      CustomDropdown(
                                          hintText: "Pilih Line...",
                                          onChange: (e) {
                                            setState(() {
                                              line = e;
                                            });
                                          },
                                          value: line,
                                          dropdownItems: lineList)
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
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text("%LE",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        DisplayField(
                                          value: (double.parse(le) * 100)
                                              .toStringAsFixed(3),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text("%LP",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        DisplayField(
                                            value: (double.parse(lp) * 100)
                                                .toStringAsFixed(3)),
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
                                                color: dark.withOpacity(0.8),
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      DisplayField(
                                          value: (double.parse(dt) * 100)
                                              .toStringAsFixed(3)),
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
                                                color: dark.withOpacity(0.8),
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      DisplayField(
                                          value: (double.parse(bd) * 100)
                                              .toStringAsFixed(3)),
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
                                              const EdgeInsets.only(left: 30),
                                          child: Text("Planning Output",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        CustomTextField(
                                          hint: "Masukan Planning Output..",
                                          controller: planningOutput,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(child: Container()),
                                  Flexible(child: Container())
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(children: [
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Text("Week",
                                            style: TextStyle(
                                                color: dark.withOpacity(0.8),
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      CustomTextField(
                                        hint: "Masukan week...",
                                        controller: weekController,
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(child: Container()),
                                Flexible(child: Container()),
                              ])
                            ],
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
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 11,
                                              bottom: 11),
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: bLength,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return BreakdownForm(
                                                      index: index + 1,
                                                      bdMin: dbMin[index],
                                                      freq: freq[index],
                                                      problem: problem[index],
                                                      reason: "reason",
                                                      onChange: (value) {
                                                        setState(() {
                                                          var number =
                                                              num.parse(value);
                                                          var aa = number / 60;

                                                          bdHourList[index] = aa
                                                              .toStringAsFixed(
                                                                  2);

                                                          var integer = bdHourList.fold(
                                                              0.00,
                                                              (a, b) =>
                                                                  double.parse(a
                                                                      .toString()) +
                                                                  double.parse(b
                                                                      .toString()));

                                                          bdHourTotal = integer
                                                              .toStringAsFixed(
                                                                  2);

                                                          var leV = num.parse(
                                                                  targetHour) /
                                                              num.parse(
                                                                  netHour);
                                                          var lpV = num.parse(
                                                                  targetHour) /
                                                              num.parse(
                                                                  grossHour);
                                                          var dtV = num.parse(
                                                                  actHourTotal!) /
                                                              num.parse(
                                                                  grossHour);
                                                          var bdV = num.parse(
                                                                  bdHourTotal!) /
                                                              num.parse(
                                                                  netHour);
                                                          bd = bdV
                                                              .toStringAsFixed(
                                                                  2);
                                                          dt = dtV
                                                              .toStringAsFixed(
                                                                  2);
                                                          le = leV
                                                              .toStringAsFixed(
                                                                  2);
                                                          lp = lpV
                                                              .toStringAsFixed(
                                                                  2);
                                                        });
                                                      },
                                                      bdHour:
                                                          bdHourList[index]!,
                                                      dropdownItemMesin:
                                                          bdMesinList!,
                                                      valueMesin: mesin[index],
                                                      onChangeMesin: (a) {
                                                        setState(() {
                                                          mesin[index] = a;
                                                          if (mesin[index] ==
                                                              "Dumper") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .dumper_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Mixer") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .mixer_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Pasteurizer") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .pasteurizer_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Homogenizer") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .homogenizer_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Flash_Cooler") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .flash_cooler_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "CT") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .ct_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Utility") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .utility_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Slurry") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .slurry_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Filler_Closer") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .filler_closer_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Labeling") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .labeling_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Cermex_Cartoning") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .cermex_cartoning_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Robot_Palletizer_Can") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .robot_palletizer_can;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "CIP_Kitchen") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .cip_kitchen;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Piltz") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .piltz_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Folding") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .folding_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Omori") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .omori_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Samwoo") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .samwoo_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Bossar") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .bossar_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Cartoning") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .cartoning_reason;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Robotic_Palletizer_Pouch") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .robotic_palletizer_pouch;
                                                          } else if (mesin[
                                                                  index] ==
                                                              "Carton_Sealer") {
                                                            reasonList[index] =
                                                                DataBD()
                                                                    .carton_sealer;
                                                          }
                                                        });
                                                      },
                                                      dropdownItemReason:
                                                          reasonList[index],
                                                      onChangeReason: (a) {
                                                        setState(() {
                                                          reason[index] = a;
                                                        });
                                                      },
                                                      valueReason:
                                                          reason[index],
                                                    );
                                                  }),
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      bLength++;
                                                    });
                                                  },
                                                  child: Icon(
                                                      Icons.add_circle_rounded,
                                                      color: active,
                                                      size: 45))
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
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 11,
                                              bottom: 11),
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: dLength,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return DownTimeForm(
                                                        index: index,
                                                        actMin: actMin[index],
                                                        onChange: (value) {
                                                          setState(() {
                                                            var aa = num.parse(
                                                                    value) /
                                                                60;
                                                            actHourList[index] =
                                                                aa.toStringAsFixed(
                                                                    2);

                                                            var integer = actHourList.fold(
                                                                0.00,
                                                                (a, b) =>
                                                                    double.parse(a
                                                                        .toString()) +
                                                                    double.parse(
                                                                        b.toString()));
                                                            actHourTotal = integer
                                                                .toStringAsFixed(
                                                                    2);

                                                            var net = num.parse(
                                                                    grossHour) -
                                                                num.parse(
                                                                    actHourTotal!);
                                                            var groos = num.parse(
                                                                    totalHours) -
                                                                num.parse(
                                                                    idleHourTotal!);

                                                            netHour = net
                                                                .toStringAsFixed(
                                                                    2);

                                                            grossHour = groos
                                                                .toString();

                                                            var leV = num.parse(
                                                                    targetHour) /
                                                                num.parse(
                                                                    netHour);
                                                            var lpV = num.parse(
                                                                    targetHour) /
                                                                num.parse(
                                                                    grossHour);
                                                            var dtV = aa /
                                                                num.parse(
                                                                    grossHour);
                                                            var bdV = num.parse(
                                                                    bdHourTotal!) /
                                                                num.parse(
                                                                    netHour);
                                                            bd = bdV
                                                                .toStringAsFixed(
                                                                    2);
                                                            dt = dtV
                                                                .toStringAsFixed(
                                                                    2);
                                                            le = leV
                                                                .toStringAsFixed(
                                                                    2);
                                                            lp = lpV
                                                                .toStringAsFixed(
                                                                    2);
                                                          });
                                                        },
                                                        actHour:
                                                            actHourList[index]!,
                                                        dropdownItemDT:
                                                            DataDT().dt,
                                                        onChangeDT: (a) {
                                                          setState(() {
                                                            downtime[index] = a;
                                                          });
                                                          if (a == "Set_Up") {
                                                            setState(() =>
                                                                subDTList =
                                                                    DataDT()
                                                                        .set_up);
                                                          } else if (a ==
                                                              "Start_Up") {
                                                            setState(() =>
                                                                subDTList =
                                                                    DataDT()
                                                                        .start_up);
                                                          } else if (a ==
                                                              "Cleaning") {
                                                            setState(() =>
                                                                subDTList =
                                                                    DataDT()
                                                                        .cleaning);
                                                          } else if (a ==
                                                              "Change_Over") {
                                                            setState(() =>
                                                                subDTList = DataDT()
                                                                    .change_over);
                                                          } else if (a ==
                                                              "Maintenance") {
                                                            setState(() =>
                                                                subDTList = DataDT()
                                                                    .maintenance);
                                                          } else if (a ==
                                                              "Personal_Time") {
                                                            setState(() =>
                                                                subDTList = DataDT()
                                                                    .personal_time);
                                                          } else if (a ==
                                                              "Operational_Downtime") {
                                                            setState(() =>
                                                                subDTList = DataDT()
                                                                    .operational_downtime);
                                                          }
                                                        },
                                                        valueDT:
                                                            downtime[index],
                                                        dropdownItemSubDT:
                                                            subDTList!,
                                                        onChangeSubDT: (a) {
                                                          print(a);
                                                          setState(() {
                                                            subDT[index] = a;
                                                          });

                                                          if (a ==
                                                              "Set Up Mesin") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "30");
                                                          } else if (a ==
                                                              "Fogging Ruangan") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "10");
                                                          } else if (a ==
                                                              "Greasing/CIL") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "30");
                                                          } else if (a ==
                                                              "Preheating Machine") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "30");
                                                          } else if (a ==
                                                              "CIP Tengah Minggu") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "240");
                                                          } else if (a ==
                                                              "CIP CT") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "120");
                                                          } else if (a ==
                                                              "Cleaning & Sterilisasi Piston") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "60");
                                                          } else if (a ==
                                                              "Pembersihan sealer bar horisontal") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "35");
                                                          } else if (a ==
                                                              "CIP Daily") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "135");
                                                          } else if (a ==
                                                              "CIP Weekly") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "240");
                                                          } else if (a ==
                                                              "COP Weekly") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "240");
                                                          } else if (a ==
                                                              "Ganti Formula") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "15");
                                                          } else if (a ==
                                                              "Ganti Brand (Persiapan PM)") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "35");
                                                          } else if (a ==
                                                              "Ganti Crystalitation Tank") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "30");
                                                          } else if (a ==
                                                              "Ganti Kode") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "10");
                                                          } else if (a ==
                                                              "Ganti alumunium foil") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "30");
                                                          } else if (a ==
                                                              "Ganti brand") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "30");
                                                          } else if (a ==
                                                              "Ganti ribbon") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "12");
                                                          } else if (a ==
                                                              "Weekly Maintenance") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "480");
                                                          } else if (a ==
                                                              "Sholat Jumat") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "90");
                                                          } else if (a ==
                                                              "Aging") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "30");
                                                          } else if (a ==
                                                              "Cleaning dan line clearance") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "30");
                                                          } else if (a ==
                                                              "Swab & Sterilisasi") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "-");
                                                          } else if (a ==
                                                              "COP") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "-");
                                                          } else if (a ==
                                                              "CIP AT Daily") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "-");
                                                          } else if (a ==
                                                              "CIP COP Weekly") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "-");
                                                          } else if (a ==
                                                              "Bersihkan sealer") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "-");
                                                          } else if (a ==
                                                              "Bersihkan Sealer  dan stick N2") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "-");
                                                          } else if (a ==
                                                              "Initial Cleaning") {
                                                            setState(() =>
                                                                std[index] =
                                                                    "-");
                                                          }
                                                        },
                                                        valueSubDT: std[index],
                                                        valueSTD: std[index]);
                                                  }),
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      dLength++;
                                                    });
                                                  },
                                                  child: Icon(
                                                      Icons.add_circle_rounded,
                                                      color: active,
                                                      size: 45))
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
                                  Text("Idle Time",
                                      style: TextStyle(
                                          color: dark.withOpacity(0.8),
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  Container(
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
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 11,
                                              bottom: 11),
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: iLength,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return IdleTimeForm(
                                                        index: index,
                                                        onChange: (value) {
                                                          setState(() {
                                                            var aa = num.parse(
                                                                    value) /
                                                                60;
                                                            idleHourList[
                                                                    index] =
                                                                aa.toStringAsFixed(
                                                                    2);
                                                            var integer = idleHourList.fold(
                                                                0.00,
                                                                (a, b) =>
                                                                    double.parse(a
                                                                        .toString()) +
                                                                    double.parse(
                                                                        b.toString()));
                                                            idleHourTotal = integer
                                                                .toStringAsFixed(
                                                                    2);

                                                            var gros = num.parse(
                                                                    totalHours) -
                                                                num.parse(
                                                                    idleHourTotal!);
                                                            var net = gros -
                                                                num.parse(
                                                                    actHourTotal!);
                                                            netHour =
                                                                net.toString();
                                                            grossHour =
                                                                gros.toString();

                                                            var leV = num.parse(
                                                                    targetHour) /
                                                                num.parse(
                                                                    netHour);
                                                            var lpV = num.parse(
                                                                    targetHour) /
                                                                num.parse(
                                                                    grossHour);
                                                            var dtV = num.parse(
                                                                    actHourTotal!) /
                                                                num.parse(
                                                                    grossHour);
                                                            var bdV = num.parse(
                                                                    bdHourTotal!) /
                                                                num.parse(
                                                                    netHour);
                                                            bd = bdV
                                                                .toStringAsFixed(
                                                                    2);
                                                            dt = dtV
                                                                .toStringAsFixed(
                                                                    2);
                                                            le = leV
                                                                .toStringAsFixed(
                                                                    2);
                                                            lp = lpV
                                                                .toStringAsFixed(
                                                                    2);
                                                          });
                                                        },
                                                        idleHour: idleHourList[
                                                            index]!,
                                                        idleMin: idleMin[index],
                                                        valueIdleDesc:
                                                            idleDesc[index],
                                                        onChangeIdleDesc: (a) {
                                                          setState(() {
                                                            idleDesc[index] = a;
                                                          });
                                                        },
                                                        dropdownItemIdleDesc:
                                                            DataIdle().idle);
                                                  }),
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      iLength++;
                                                    });
                                                  },
                                                  child: Icon(
                                                      Icons.add_circle_rounded,
                                                      color: active,
                                                      size: 45))
                                            ],
                                          ))),
                                  SizedBox(height: 30),
                                ],
                              )),
                          Center(
                            child: InkWell(
                              onTap: () async {
                                var uuid = Uuid();
                                var id = uuid.v4();
                                DateTime now = DateTime.now();
                                int noww =
                                    DateTime.now().millisecondsSinceEpoch;

                                DateTime date =
                                    DateTime.fromMillisecondsSinceEpoch(noww);
                                String datetime = date.year.toString() +
                                    date.month.toString() +
                                    date.day.toString();
                                int dateFix = int.parse(datetime);

                                try {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  await FirebaseFirestore.instance
                                      .collection("product")
                                      .doc(id)
                                      .set({
                                    "uid": id,
                                    "laporan": namaLaporan,
                                    "shift": shift,
                                    "departement": departement,
                                    "product": product,
                                    "line": line,
                                    "planing_output": planningOutput.text,
                                    "actual_output": actualOutput.text,
                                    "nominal_speed": nominalSpeed.text,
                                    "total_hour": totalHour.text,
                                    "gross_hour": grossHour,
                                    "net_hour": netHour,
                                    "target_hour": targetHour,
                                    "le": (double.parse(le) * 100)
                                        .toStringAsFixed(3),
                                    "lp": (double.parse(lp) * 100)
                                        .toStringAsFixed(3),
                                    "dt": (double.parse(dt) * 100)
                                        .toStringAsFixed(3),
                                    "bd": (double.parse(bd) * 100)
                                        .toStringAsFixed(3),
                                    "week": int.parse(weekController.text),
                                    "bulan": DateFormat.MMMM().format(now),
                                    "tahun":
                                        int.parse(DateFormat.y().format(now)),
                                    "date": DateFormat('dd/MM/yy').format(now),
                                    "createdAt": dateFix
                                  });

                                  for (int i = 0; i < bLength; i++) {
                                    var uuid = Uuid();
                                    var idB = uuid.v4();
                                    if (mesin[i] != null ||
                                        reason[i] != null ||
                                        problem[i].text != "" ||
                                        freq[i].text != "" ||
                                        dbMin[i].text != "0") {
                                      FirebaseFirestore.instance
                                          .collection("breakdown")
                                          .doc(idB)
                                          .set({
                                        "uid": idB,
                                        "product_id": id,
                                        "date":
                                            DateFormat('dd/MM/yy').format(now),
                                        "shift": shift,
                                        "departement": departement,
                                        "product": product,
                                        "line": line,
                                        "mesin": mesin[i],
                                        "reason": reason[i],
                                        "freq": freq[i].text,
                                        "bdMin": dbMin[i].text,
                                        "bdHour": bdHourList[i],
                                        "problem": problem[i].text,
                                        "week": int.parse(weekController.text),
                                        "bulan": DateFormat.MMMM().format(now),
                                        "tahun": int.parse(
                                            DateFormat.y().format(now)),
                                        "createdAt": dateFix
                                      });
                                    } else {
                                      print("no data");
                                    }
                                  }

                                  for (int i = 0; i < dLength; i++) {
                                    var uuid = Uuid();
                                    var idd = uuid.v4();
                                    if (downtime[i] != null ||
                                        subDT[i] != null ||
                                        std[i] != "" ||
                                        actMin[i].text != "0") {
                                      FirebaseFirestore.instance
                                          .collection("downtime")
                                          .doc(idd)
                                          .set({
                                        "uid": idd,
                                        "product_id": id,
                                        "date":
                                            DateFormat('dd/MM/yy').format(now),
                                        "shift": shift,
                                        "departement": departement,
                                        "product": product,
                                        "line": line,
                                        "dt": downtime[i],
                                        "subDt": subDT[i],
                                        "std": std[i],
                                        "actMin": actMin[i].text,
                                        "actHour": actHourList[i],
                                        "week": int.parse(weekController.text),
                                        "bulan": DateFormat.MMMM().format(now),
                                        "tahun": int.parse(
                                            DateFormat.y().format(now)),
                                        "createdAt": dateFix
                                      });
                                    } else {
                                      print("no data");
                                    }
                                  }
                                  for (int i = 0; i < iLength; i++) {
                                    var uuid = Uuid();
                                    var idi = uuid.v4();
                                    if (idleDesc[i] != null ||
                                        idleMin[i].text != "0") {
                                      FirebaseFirestore.instance
                                          .collection("idle_time")
                                          .doc(idi)
                                          .set({
                                        "uid": idi,
                                        "product_id": id,
                                        "date":
                                            DateFormat('dd/MM/yy').format(now),
                                        "shift": shift,
                                        "departement": departement,
                                        "product": product,
                                        "line": line,
                                        "idleDesc": idleDesc[i],
                                        "idleMin": idleMin[i].text,
                                        "idleHour": idleHourList[i],
                                        "week": int.parse(weekController.text),
                                        "bulan": DateFormat.MMMM().format(now),
                                        "tahun": int.parse(
                                            DateFormat.y().format(now)),
                                        "createdAt": dateFix
                                      });
                                    } else {
                                      print("no data");
                                    }
                                  }

                                  setState(() {
                                    _isLoading = false;
                                  });
                                } catch (e) {
                                  print(e);
                                }

                                // for (int i = 0; i < bLength; i++) {
                                //   var uuid = Uuid();
                                //   var idB = uuid.v4();
                                //   var a = freq[i].text;
                                //   var b = dbMin[i].text;
                                //   var c = problem[i].text;
                                //   var d = mesin[i];
                                //   var e = reason[i];
                                //   // var n = bdHour[i];

                                //   FirebaseFirestore.instance
                                //       .collection("breakdown")
                                //       .doc(idB)
                                //       .set({
                                //     "uid": idB,
                                //     "product_id": id,
                                //     "date": DateFormat('dd/MM/yy').format(now),
                                //     "mesin": d,
                                //     "reason": e,
                                //     "freq": a,
                                //     "bdMin": b,
                                //     "problem": c
                                //   });

                                //   print(a);
                                //   print(b);
                                //   print(c);
                                //   print(d);
                                //   print(e);
                                //   // print(n);
                                // }
                              },
                              child: Container(
                                  margin: EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                      color: active,
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 120,
                                  child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: _isLoading
                                            ? CircularProgressIndicator(
                                                color: blue,
                                              )
                                            : Text("Submit",
                                                style: TextStyle(
                                                    color: light,
                                                    fontSize: 15))),
                                  )),
                            ),
                          )
                        ],
                      ))),
            ]),
          ],
        ),
      ),
    );
  }

  uploadBreakdown(idB, id, now, mesin, reason, freq, bdMin, bdHour, problem) {
    FirebaseFirestore.instance.collection("breakdown").doc(idB).set({
      "uid": idB,
      "product_id": id,
      "date": DateFormat('dd/MM/yy').format(now),
      "mesin": mesin,
      "reason": reason,
      "freq": freq,
      "bdMin": bdMin,
      "bdHour": bdHour,
      "problem": problem
    });
  }
}

class DataBD {
  //Process skm
  var process_SKM_Mesin = [
    "Dumper",
    "Slurry",
    "Mixer",
    "Pasteurizer",
    "Homogenizer",
    "Flash_Cooler",
    "CT",
    "Utility",
    "CIP_Kitchen"
  ];
  var filling_SKM_Can_Mesin = ["Filler_Closer", "Labeling", "Cermex_Cartoning"];

  var filling_SKM_Tall_Can = ["Filler_Closer", "Labeling", "Cermex_Cartoning"];
  var filling_SKM_Sachet = ["Piltz", "Folding", "Omori", "Samwoo"];
  var filling_SKM_Pouch = ["Bossar", "Cartoning", "Robotic_Palletizer_Pouch"];

  //reason
  var dumper_reason = [
    "Blower Overload",
    "Dosing Gula Blocking",
    "Dosing Gula Lambat",
    "Dosing Powder Lambat",
    "Ganti Filter Tipping Powder",
    "Gula Blocking/Membatu",
    "Gula Susah Turun",
    "Gula Susah Turun",
    "Jalur Blower Powder Lepas",
    "Powder Susah Turun",
    "Rantai STRV Tipping Sugar Putus/Lepas",
    "Rantai STRV Tipping Powder Putus/Lepas",
    "Screw Tipping Powder Overload",
    "Screw Tipping Sugar Overload",
    "Screw Weighing Overload",
    "Screw Weighing Powder Blocking",
    "Screw Weighing Powder Overload",
    "STRV Tipping Powder Overload",
    "STRV Tipping Sugar Overload",
    "Weighing Gula Lama",
    "Weighing Powder Lama",
    "Jalur Powder Blocking",
    "Jalur Maldex Blocking",
    "Screw Gula Macet",
    "Setting Timbangan",
  ];

  var mixer_reason = [
    " Agitator Patah",
    "Blocking",
    "Mass Flow",
    "Mixing Stop",
    "Mixing Tank Full",
    "Motor Mixing Overload",
    "Pompa Sirkulasi Overload",
    "Sliding Valve Macet",
    "Valve Automatic Eror",
    "Turbo Mixing Overload",
  ];

  var pasteurizer_reason = [
    "  Motor Pompa Overload",
    "Motor Pompa Terbakar",
    "PHE bocor",
    "Pipa Hot Water Bocor",
    "Pumping Lambat dan Flow kecil",
    "Valve Automatic Eror",
  ];
  var homogenizer_reason = [
    "Motor Terbakar",
    "Oli bocor",
    "Pressure Drop",
    "Homogenizer Trouble",
  ];

  var flash_cooler_reason = [
    "Buffer Tank Bocor",
    "Cooling Tower Trouble",
    "House Pump Bocor",
    "Mesin FC Mati/Stop",
    "Program Eror",
    "Roda Lactose Grinder Bocor",
    "Flash Cooler Trouble",
  ];

  var ct_reason = [
    "Adjustment Produk",
    "Kerusakan pada valve / gasket",
    "Pompa Transfer produk bocor/terbakar",
    "Agitator Cristalisation tank rusak"
  ];

  var utility_reason = ["PLN Mati", "Steam Drop", "AHU mati"];

  var slurry_reason = [
    "Menunggu Slurry Ready",
    "Motor Slurry Overload",
    "Valve Automatic Eror"
  ];

  var filler_closer_reason = [
    "Air Cylinder Lid Tidak Berfungsi",
    "Belt Elevator Geser",
    "Belt Spiral Putus",
    "Belt Vertikal Trouble",
    "Can Bocor-Gagal Seaming",
    "Can Penyok",
    "Can Sterilizer Trouble",
    "Can Tersangkut Di Can Sterilizer",
    "Can Tersangkut Di Stopper",
    "Can Tersangkut Di Track",
    "Can Track Patah",
    "Closer Nabrak",
    "Closer Tumpah-Can Penyok",
    "Closer Tumpah-Can Tidak Ada Tutup",
    "Closer Tumpah-Gagal Seaming",
    "Closer Tumpah-Lid Miring",
    "Closer Tumpah-Lid Terbalik",
    "Closer Tumpah-Tutup Tidak Sempurna",
    "Conveyor Depall Putus",
    "Conveyor Filling Putus",
    "Depall Supply Telat",
    "Lid Burner Mati",
    "Lid Tersangkut di Magazine",
    "Piston Filler Trouble",
    "Rantai Can Sterilizer Lepas",
    "Seaming Tidak Sempurna",
    "Temperatur filling room tdk stabil",
    "Temperature Tidak Stabil",
    "Supply OTC Telat",
    "Panel HMI Mati",
    "Closer Tumpah",
    "Can Track Seret",
    "Closer Can Jiplak",
    "Can Tersangkut/Jatuh",
    "OTC tersangkut di Magnet Frame",
  ];
  var labeling_reason = [
    " Can Tersangkut Di Belt Elevator",
    "Can Tersangkut Di Elevator",
    "Can Tersangkut Di Magnetic Belt",
    "Can Tersangkut Di Track",
    "Conveyor Input Putus",
    "Hidrolik Lepas",
    "Hot Melt Glue Tidak Berputar",
    "Hot Melt Glue Tidak Panas",
    "Hydrolic Label Macet",
    "Label Brudul-Label Melengkung",
    "Label Brudul-Label Sobek Dan Miring",
    "Label Brudul-Lebar Label Tidak Sama",
    "Label Brudul-Lem Putih Banjir",
    "Label Brudul-Lem Putih Mampet",
    "Label Brudul-Lem Putih Tidak Ada",
    "Label Melipat",
    "Label Miring",
    "Magnetic Elevator Lepas",
    "Main Belt Kendur",
    "Main Belt Lepas",
    "Main Belt Sobek",
    "Pully Maint Belt Lepas",
    "Main Belt Putus",
    "Label Brudul",
    "Oli Hydrolik bocor",
    "Tangki lem bocor",
  ];
  var cermex_cartoning_reason = [
    " Pressan Karton Tidak Sempurna",
    "Baut Dudukan Karet Vacum Kendor",
    "Baut Holding Plat Patah",
    "Baut Piston Karton Lepas",
    "Baut Plat Pendorong Lepas",
    "Baut Stoper Lepas",
    "Belt Elevator Slip",
    "Belt Input Sobek",
    "Belt Transfer Miring",
    "Blank Gripper Inverter Fault",
    "Can Jatuh Saat Di Vacuum",
    "Can Tersangkut Di Meja Stopper",
    "Can Tersangkut Di Stopper",
    "Can Tersangkut Di Track",
    "Carton Box Tersangkut Di Timbangan",
    "Cermex Alarm-Can Tersangkut",
    "Cermex Alarm-Can Tidak Vacuum",
    "Cermex Eror",
    "Cermex Ganti Nozzle",
    "Cermex Nabrak",
    "Cermex Nabrak-Can Lepas Dari Vacum",
    "Flap Karton Lepas",
    "Holding Plat Lepas",
    "Holding Plat Patah",
    'Lem Karton Box Tidak Keluar',
    "Lidah Karton Terbuka",
    "Meja Vacum Macet",
    "Nozzle Lem Mampet",
    "Plat Pendorong Kendur",
    "Plat Pendorong Lepas",
    "Rantai Cermex Lepas",
    "Timing Rantai Lepas",
    "Track Cermex Patah",
    "Vacum Sering Lepas",
    "Holding Plat Macet",
    "Sensor Lem Patah",
    "Setting sensor carton box",
    "Holding Plat Eror",
    "Selang angin lem lepas",
    "Plat pendorong patah",
    "Neaple angin rusak",
    "Setting meja pusher",
    "Setting Holding Plat",
    "Baut pressan patah",
  ];
  var robot_palletizer_can = [
    " Pallet Tersangkut Di Stopper Magazine",
    "Pallet Tersangkut Di Track",
    "Robotic Eror",
    "Robotic Nabrak-Pallet Tersangkut",
    "Sensor Pallet Error",
    "Sensor Clumper Error",
  ];
  var cip_kitchen = ["PHE bocor", "Pompa transfer chemical tidak berfungsi"];
  var piltz_reason = [
    "Alumunium Foil Acak",
    "Alumunium Foil Bergeser",
    "Alumunium Foil Keriput",
    "Alumunium Foil Licin",
    "Alumunium Foil Overlap",
    "Alumunium Foil Putus Di Cutter Pembelah",
    "Alumunium Foil Tersangkut",
    "Alumunium Foil Tersangkut Di Cutter Roll",
    "Alumunium Foil Tidak Stabil",
    "Baut Arm Patah",
    "Baut Hidrolik Kendur",
    "Baut Hidrolik Patah",
    "Baut Rack Gear Lepas",
    "Bearing Rack Gear Rusak",
    "Casset Ribbon Trouble",
    "Coding Kurang Jelas",
    "Cutter Horizontal Macet",
    "Cutter Lepas",
    "Cutter Macet",
    "Cutter Pembelah Tumpul",
    "Cutter Perforasi Macet",
    "Cutter Perforasi Patah",
    "Cutter Vertical Macet",
    "Cutter Vertical Tumpul",
    "Cutter Vertikal Bergeser",
    "Desain Produk Panjang Pendek",
    "Dosing Pump Fault Line 1",
    "Dosing Pump Fault Line 2",
    "Dosing Pump Fault Line 3",
    'Dosing Pump Fault Line 4',
    "Dosing Pump Fault Line 5",
    "Dosing Pump Fault Line 6",
    "Duplex Chain Putus",
    "Eye Mark Trouble",
    "Filling Rembes",
    "Filling System Fault",
    "Filling Tube Trouble",
    "Film Transport System Macet",
    "Heater Sealer Horizontal Konslet",
    "Heater Sealer Vertical Konslet",
    "Hidrolik Pressure Bocor",
    "Lampu UV Not Ok",
    "Main Drive Fault",
    "Oli Hidrolik Kurang",
    "Omori Trouble",
    "Overlap Bocor",
    "Pump House Trouble",
    "Ribbon Fault",
    "Rubber Roll Trouble",
    "Sambungan Alumunium Foil Bocor",
    "Sambungan Alumunium Foil Lewat",
    "Sealer Horizontal Bocor",
    "Sealer Horizontal Trouble",
    "Sealer Vertical Bocor",
    "Sealer Vertical Trouble",
    "Servo Auto Web Error",
    "Snap Ring Cutter Roll Patah",
    "Stick Filling Tube Bocor",
    "Temperature Drop",
    "Temperature Tidak Stabil",
    "Magnetic Clutch Macet",
    "Conveyor Output Mati",
    "Positive pump bocor",
    "Break Slip",
    "Servo panas",
    "Insert push position fault",
    "Alumunium Foil Melipat",
    "Baut Rack Gear Patah",
    "Bearing Arm Rontok",
    "Bearing Arm Kendor",
    "Setting Plat Sealer",
    "Dosing Line Lepas",
    "Cutter tidak memotong",
    "Baut Sealer Patah",
    "Bearing Arm Aus",
    "Setting Alumunium Foil",
    "Filling Tube Bocor",
    "Drain produk encer",
    "Error Hopper Minimum produk",
    "Produk under range hopper",
    "Heating sealer safety relay trip",
    "Perforasi Putus",
    "Setting ketebalan produk",
    "Heater Drop",
    "Produk bocor",
  ];
  var folding_reason = [
    "Folding Tersangkut Di Konveyor (Produk Terjepit)",
    "Folding/Pelipat Eror",
    "Folding/Pelipat Patah",
    "Folding/Pelipat Tidak Sinkron",
    "Slider Macet",
    "Sensor Eror",
    "Engkol Rack Gear Lepas",
    "Folding Lengket",
    "Conveyor Pelipat Eror",
    "Slider telat",
    "Produk sering berantakan",
    "Produk menumpuk",
    "Produk terjepit pelipat",
    "Folding/Pelipat Tersangkut",
    "Scoop eror",
    "Belt Input Trouble",
  ];
  var omori_reason = [
    "Belt Conveyor Miring",
    "Belt Omori Putus",
    "Belt Roller Center Sealer Putus",
    "Belt Tidak Berputar",
    "Finger Nabrak",
    "Omori Trouble",
    "Sachet Tersangkut",
    "Selenoid Tidak Stabil",
    "Plastik OPP Terbuka",
    "OPP tidak menempel",
    "Setting Center Sealer",
    "Servo Omori Trouble",
    "Baut handle penjepit aus",
    "Belt Output Macet",
    "Center Sealer Tidak Menempel",
    "Salah OPP",
    "Produk terjepit",
    "End Seal Jam",
    "Trouble Sensor Eror",
    "Belt Feeding Putus",
  ];

  var samwoo_reason = [
    " Angin Drop",
    "Belt Before Putus",
    "Belt Input Trouble",
    "Folding Tersangkut Di Konveyor (Produk Terjepit)",
    "Produk Terjepit Di Gripper",
    "Vacum Box Failed",
    "Sensor Pusher Eror",
    "Double Loop",
    "Packing Manual",
    "Silinder Flap Tidak Berfungsi",
    "Safety door eror",
    "Track Carton Box Tidak Sejajar",
    "Sensor box eror",
    "Produk terjepit di Insert Pusher",
    "Gate Samwoo tidak naik",
    "Samwoo trouble",
    "Gate Samwoo lepas",
  ];
  var bossar_reason = [
    " Air holder kurang/tidak terisi",
    "Alumunium Foil Overlap",
    "Alumunium Foil Underspec",
    "Conveyor out put mati/overload",
    "Cutter Vertical Tumpul",
    "Filling tube menetes",
    "Ganti alufo tidak bisa auto",
    "Heater vertical seal rusak/suhu drop",
    "Kode hilang/tidak jelas/terputus",
    "Low air pressure",
    "Mesin Kode error",
    "Nilai RO Tinggi, Setting Filling N2",
    "Pre blowing air holder trouble",
    "Produk tumpah",
    "Pulse light error",
    "Sambungan Alufo Putus",
    "Sensor eye mark eror",
    "Smiley Not OK",
    "Spout tersangkut",
    "Spout tidak pas",
    "Vertical Sealer Not OK",
    "Vision Camera 1 reject",
    "Vision camera 2 reject",
    "Lampu UV Mati",
    "Lampu UV Rusak",
    "Filler Kurang Lancar",
    "Filter produk bocor",
    "Alumunium foil putus",
    "Baut penjepit produk patah",
    "Sunction cup air holder lepas",
    "Air handle blocked",
    "Alarm Sealer Vertical Blocked",
    "Positive pump eror",
    "HMI Eror",
    "Upper Sealer Trouble",
    "Spout menempel di Sealer",
    "Join alumunium foil putus",
    "Heater blow up Fault",
    "Alumunium Foil Acak",
    "Baut Spout Lepas",
    "Setting sensitivitas camera",
    "Viscos Produk rendah",
    "Camera Fault",
    "Bag tidak membuka",
    "Perbaikan Bearing & Screw",
    "Sunction cup sobek",
    "Filling tube mampet",
    "Valve produk mampet",
    "Alumunium foil bergelombang",
    "Air handle fault",
    "Alumunium foil tersangkut",
  ];
  var cartoning_reason = ["Cartoning Eror"];
  var robotic_palletizer_pouch = [
    "Robotic Eror",
    "Sensor finger robotic putus",
  ];
  var carton_sealer = [
    " Carton box tersangkut",
    "Lakban tidak melekat",
    "Baut Sealer Lepas",
  ];
}

class DataDT {
  var dt = [
    "Set_Up",
    "Start_Up",
    "Cleaning",
    "Change_Over",
    "Maintenance",
    "Personal_Time",
    "Operational_Downtime"
  ];
  // sub dt
  var set_up = ["Set Up Mesin"];

  var start_up = ["Preheating Machine"];
  var cleaning = [
    "CIP Tengah Minggu",
    "CIP CT",
    "Cleaning & Sterilisasi Piston",
    "Pembersihan sealer bar horizontal",
    "CIP Daily",
    "CIP Weekly",
    "COP Weekly",
    "Cleaning dan line clearance",
    "Fogging Ruangan",
    "Swab & Sterilisasi",
    "COP",
    "CIP AT Daily",
    "CIP COP Weekly",
    "Bersihkan sealer",
    "Bersihkan Sealer  dan stick N2",
    "Initial Cleaning",
  ];
  var change_over = [
    "Ganti Formula",
    "Ganti Brand (Persiapan PM)",
    "Ganti Crystalitation Tank",
    "Ganti Kode",
    "Ganti alumunium foil",
    "Ganti brand",
    "Ganti ribbon",
  ];
  var maintenance = ["Weekly Maintenance"];
  var personal_time = ['Sholat Jumat'];
  var operational_downtime = ["Aging"];
}

class DataIdle {
  var idle = [
    "THP (Tunggu Hasil Produk)",
    "CT Full",
    "No Planning",
    "Stock Opname",
    "Overhoule",
    "Project",
    "Trial New Product"
  ];
}

class Line {
  var process = [
    DropdownMenuItem(
      child: Text("1"),
      value: "1",
    ),
    DropdownMenuItem(
      child: Text("2"),
      value: "2",
    ),
  ];

  var skm_can = [
    DropdownMenuItem(
      child: Text("A"),
      value: "A",
    ),
    DropdownMenuItem(
      child: Text("B"),
      value: "B",
    ),
  ];

  var skm_sachet = [
    DropdownMenuItem(
      child: Text("A"),
      value: "A",
    ),
    DropdownMenuItem(
      child: Text("B"),
      value: "B",
    ),
    DropdownMenuItem(
      child: Text("C"),
      value: "C",
    ),
    DropdownMenuItem(
      child: Text("D"),
      value: "D",
    ),
    DropdownMenuItem(
      child: Text("E"),
      value: "E",
    ),
    DropdownMenuItem(
      child: Text("F"),
      value: "F",
    ),
  ];

  var skm_pouch = [
    DropdownMenuItem(
      child: Text("A"),
      value: "A",
    ),
    DropdownMenuItem(
      child: Text("B"),
      value: "B",
    ),
  ];
}
