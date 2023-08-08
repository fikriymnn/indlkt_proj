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
  List<DropdownMenuItem> bdMesinList = [];
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
  String? stds;

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
                                            } else if (namaLaporan ==
                                                "Filling_Packing_SKM_Can") {
                                              bdMesinList = DataBD()
                                                  .filling_SKM_Can_Mesin;
                                            } else if (namaLaporan ==
                                                "Filling_Packing_SKM_Tall_Can") {
                                              bdMesinList =
                                                  DataBD().filling_SKM_Tall_Can;
                                            } else if (namaLaporan ==
                                                "Filling_Packing_SKM_Sachet") {
                                              bdMesinList =
                                                  DataBD().filling_SKM_Sachet;
                                            } else if (namaLaporan ==
                                                "Filling_Packing_SKM_Pouch") {
                                              bdMesinList =
                                                  DataBD().filling_SKM_Pouch;
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
                                            )
                                          ]),
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
                                              const EdgeInsets.only(left: 30),
                                          child: Text("%LP",
                                              style: TextStyle(
                                                  color: dark.withOpacity(0.8),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold)),
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
                                            const EdgeInsets.only(left: 30),
                                        child: Text("%DT",
                                            style: TextStyle(
                                                color: dark.withOpacity(0.8),
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold)),
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
                                            const EdgeInsets.only(left: 30),
                                        child: Text("%BD",
                                            style: TextStyle(
                                                color: dark.withOpacity(0.8),
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold)),
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
                              )
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
                                                      index: bLength,
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
                                                          bdMesinList,
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
                                                        dropdownItemDT: [
                                                          DropdownMenuItem(
                                                            child:
                                                                Text("mesin 1"),
                                                            value: "mesin 1",
                                                          ),
                                                          DropdownMenuItem(
                                                            child:
                                                                Text("mesin 2"),
                                                            value: "mesin 2",
                                                          ),
                                                          DropdownMenuItem(
                                                            child:
                                                                Text("mesin 3"),
                                                            value: "mesin 3",
                                                          )
                                                        ],
                                                        onChangeDT: (a) {
                                                          setState(() {
                                                            downtime[index] = a;
                                                          });
                                                        },
                                                        valueDT:
                                                            downtime[index],
                                                        dropdownItemSubDT: [
                                                          DropdownMenuItem(
                                                            child:
                                                                Text("mesin 1"),
                                                            value: "mesin 1",
                                                          ),
                                                          DropdownMenuItem(
                                                            child:
                                                                Text("mesin 2"),
                                                            value: "mesin 2",
                                                          ),
                                                          DropdownMenuItem(
                                                            child:
                                                                Text("mesin 3"),
                                                            value: "mesin 3",
                                                          )
                                                        ],
                                                        onChangeSubDT: (a) {
                                                          setState(() {
                                                            subDT[index] = a;
                                                          });
                                                        },
                                                        valueSubDT:
                                                            subDT[index],
                                                        dropdownItemSTD: [
                                                          DropdownMenuItem(
                                                            child:
                                                                Text("mesin 1"),
                                                            value: "mesin 1",
                                                          ),
                                                          DropdownMenuItem(
                                                            child:
                                                                Text("mesin 2"),
                                                            value: "mesin 2",
                                                          ),
                                                          DropdownMenuItem(
                                                            child:
                                                                Text("mesin 3"),
                                                            value: "mesin 3",
                                                          )
                                                        ],
                                                        onChangeSTD: (a) {
                                                          setState(() {
                                                            std[index] = a;
                                                          });
                                                        },
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
                                                        dropdownItemIdleDesc: [
                                                          DropdownMenuItem(
                                                            child: Text(
                                                                "THP (Tunggu Hasil Produk)"),
                                                            value:
                                                                "THP (Tunggu Hasil Produk)",
                                                          ),
                                                          DropdownMenuItem(
                                                            child:
                                                                Text("CT Full"),
                                                            value: "CT Full",
                                                          ),
                                                          DropdownMenuItem(
                                                            child: Text(
                                                                "No Planning"),
                                                            value:
                                                                "No Planning",
                                                          ),
                                                          DropdownMenuItem(
                                                            child: Text(
                                                                "Stock Opname"),
                                                            value:
                                                                "Stock Opname",
                                                          ),
                                                          DropdownMenuItem(
                                                            child: Text(
                                                                "Overhoule"),
                                                            value: "Overhoule",
                                                          ),
                                                          DropdownMenuItem(
                                                            child:
                                                                Text("Project"),
                                                            value: "Project",
                                                          ),
                                                          DropdownMenuItem(
                                                            child: Text(
                                                                "Trial New Product"),
                                                            value:
                                                                "Trial New Product",
                                                          ),
                                                        ]);
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
                                    "le": le,
                                    "lp": lp,
                                    "dt": dt,
                                    "bd": bd,
                                    "date": DateFormat('dd/MM/yy').format(now)
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
                                        "mesin": mesin[i],
                                        "reason": reason[i],
                                        "freq": freq[i].text,
                                        "bdMin": dbMin[i].text,
                                        "bdHour": bdHourList[i],
                                        "problem": problem[i].text
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
                                        std[i] != null ||
                                        actMin[i].text != "0") {
                                      FirebaseFirestore.instance
                                          .collection("downtime")
                                          .doc(idd)
                                          .set({
                                        "uid": idd,
                                        "product_id": id,
                                        "date":
                                            DateFormat('dd/MM/yy').format(now),
                                        "dt": downtime[i],
                                        "subDt": subDT[i],
                                        "std": std[i],
                                        "actMin": actMin[i].text,
                                        "actHour": actHourList[i],
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
                                        "idleDesc": idleDesc[i],
                                        "idleMin": idleMin[i].text,
                                        "idleHour": idleHourList[i]
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
    DropdownMenuItem(
      child: Text("Dumper"),
      value: "Dumper",
    ),
    DropdownMenuItem(
      child: Text("Slurry"),
      value: "Slurry",
    ),
    DropdownMenuItem(
      child: Text("Mixer"),
      value: "Mixer",
    ),
    DropdownMenuItem(
      child: Text("Pasteurizer"),
      value: "Pasteurizer",
    ),
    DropdownMenuItem(
      child: Text("Homogenizer"),
      value: "Homogenizer",
    ),
    DropdownMenuItem(
      child: Text("Flash_Cooler"),
      value: "Flash_Cooler",
    ),
    DropdownMenuItem(
      child: Text("CT"),
      value: "CT",
    ),
    DropdownMenuItem(
      child: Text("Utility"),
      value: "Utility",
    ),
    DropdownMenuItem(
      child: Text("CIP_Kitchen"),
      value: "CIP_Kitchen",
    )
  ];
  var filling_SKM_Can_Mesin = [
    DropdownMenuItem(
      child: Text("Filler_Closer"),
      value: "Filler_Closer",
    ),
    DropdownMenuItem(
      child: Text("Labeling"),
      value: "Labeling",
    ),
    DropdownMenuItem(
      child: Text("Cermex_Cartoning"),
      value: "Cermex_Cartoning",
    ),
    DropdownMenuItem(
      child: Text("Robot_Palletizer_Can"),
      value: "Robot_Palletizer_Can",
    ),
    DropdownMenuItem(
      child: Text("Utility"),
      value: "Utility",
    ),
    DropdownMenuItem(
      child: Text("CIP_Kitchen"),
      value: "CIP_Kitchen",
    ),
    DropdownMenuItem(
      child: Text("CT"),
      value: "CT",
    ),
  ];

  var filling_SKM_Tall_Can = [
    DropdownMenuItem(
      child: Text("Filler_Closer"),
      value: "Filler_Closer",
    ),
    DropdownMenuItem(
      child: Text("Labeling"),
      value: "Labeling",
    ),
    DropdownMenuItem(
      child: Text("Cermex_Cartoning"),
      value: "Cermex_Cartoning",
    ),
    DropdownMenuItem(
      child: Text("Robot_Palletizer_Can"),
      value: "Robot_Palletizer_Can",
    ),
    DropdownMenuItem(
      child: Text("Utility"),
      value: "Utility",
    ),
    DropdownMenuItem(
      child: Text("CIP_Kitchen"),
      value: "CIP_Kitchen",
    ),
    DropdownMenuItem(
      child: Text("CT"),
      value: "CT",
    ),
  ];
  var filling_SKM_Sachet = [
    DropdownMenuItem(
      child: Text("Piltz"),
      value: "Piltz",
    ),
    DropdownMenuItem(
      child: Text("Folding"),
      value: "Folding",
    ),
    DropdownMenuItem(
      child: Text("Omori"),
      value: "Omori",
    ),
    DropdownMenuItem(
      child: Text("Samwoo"),
      value: "Samwoo",
    ),
    DropdownMenuItem(
      child: Text("Utility"),
      value: "Utility",
    ),
    DropdownMenuItem(
      child: Text("CIP_Kitchen"),
      value: "CIP_Kitchen",
    ),
    DropdownMenuItem(
      child: Text("CT"),
      value: "CT",
    ),
    DropdownMenuItem(
      child: Text("Carton_Sealer"),
      value: "Carton_Sealer",
    ),
  ];
  var filling_SKM_Pouch = [
    DropdownMenuItem(
      child: Text("Bossar"),
      value: "Bossar",
    ),
    DropdownMenuItem(
      child: Text("Cartoning"),
      value: "Cartoning",
    ),
    DropdownMenuItem(
      child: Text("Robotic_Palletizer_Pouch"),
      value: "Robotic_Palletizer_Pouch",
    ),
    DropdownMenuItem(
      child: Text("Utility"),
      value: "Utility",
    ),
    DropdownMenuItem(
      child: Text("CIP_Kitchen"),
      value: "CIP_Kitchen",
    ),
    DropdownMenuItem(
      child: Text("CT"),
      value: "CT",
    ),
  ];

  //reason
  var dumper_reason = [
    "Blower Overload",
    "Dosing Gula Blocking",
    "Dosing Gula Lambat"
  ];

  var mixer_reason = ["Agitator Patah", "Blocking"];

  var pasteurizer_reason = [
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Motor Pompa Terbakar"),
      value: "Motor Pompa Terbakar",
    ),
    DropdownMenuItem(
      child: Text("PHE bocor"),
      value: "PHE bocor",
    ),
    DropdownMenuItem(
      child: Text("Pipa Hot Water Bocor"),
      value: "Pipa Hot Water Bocor",
    ),
    DropdownMenuItem(
      child: Text("Pumping Lambat dan Flow kecil"),
      value: "Pumping Lambat dan Flow kecil",
    ),
    DropdownMenuItem(
      child: Text("Valve Automatic Eror"),
      value: "Valve Automatic Eror",
    ),
  ];
  var homogenizer_reason = [
    DropdownMenuItem(
      child: Text("Motor Terbakar"),
      value: "Motor Terbakar",
    ),
    DropdownMenuItem(
      child: Text("Oli bocor"),
      value: "Oli bocor",
    ),
    DropdownMenuItem(
      child: Text("Pressure Drop"),
      value: "Pressure Drop",
    ),
    DropdownMenuItem(
      child: Text("Homogenizer Trouble"),
      value: "Homogenizer Trouble",
    ),
  ];

  var flash_cooler_reason = [
    DropdownMenuItem(
      child: Text("Buffer Tank Bocor"),
      value: "Buffer Tank Bocor",
    ),
    DropdownMenuItem(
      child: Text("Cooling Tower Trouble"),
      value: "Cooling Tower Trouble",
    ),
    DropdownMenuItem(
      child: Text("House Pump Bocor"),
      value: "House Pump Bocor",
    ),
    DropdownMenuItem(
      child: Text("Mesin FC Mati/Stop"),
      value: "Mesin FC Mati/Stop",
    ),
    DropdownMenuItem(
      child: Text("Program Eror"),
      value: "Program Eror",
    ),
    DropdownMenuItem(
      child: Text("Roda Lactose Grinder Bocor"),
      value: "Roda Lactose Grinder Bocor",
    ),
    DropdownMenuItem(
      child: Text("Flash Cooler Trouble"),
      value: "Flash Cooler Trouble",
    ),
  ];

  var ct_reason = [
    DropdownMenuItem(
      child: Text("Adjustment Produk"),
      value: "Adjustment Produk",
    ),
    DropdownMenuItem(
      child: Text("Kerusakan pada valve / gasket"),
      value: "Kerusakan pada valve / gasket",
    ),
    DropdownMenuItem(
      child: Text("Pompa Transfer produk bocor/terbakar"),
      value: "Pompa Transfer produk bocor/terbakar",
    ),
    DropdownMenuItem(
      child: Text("Agitator Cristalisation tank rusak"),
      value: "Agitator Cristalisation tank rusak",
    ),
  ];

  var utility_reason = [
    DropdownMenuItem(
      child: Text("PLN Mati"),
      value: "PLN Mati",
    ),
    DropdownMenuItem(
      child: Text("Steam Drop"),
      value: "Steam Drop",
    ),
    DropdownMenuItem(
      child: Text("AHU mati"),
      value: "AHU mati",
    ),
  ];

  var slurry_reason = [
    DropdownMenuItem(
      child: Text("Menunggu Slurry Ready"),
      value: "Menunggu Slurry Ready",
    ),
    DropdownMenuItem(
      child: Text("Motor Slurry Overload"),
      value: "Motor Slurry Overload",
    ),
    DropdownMenuItem(
      child: Text("Valve Automatic Eror"),
      value: "Valve Automatic Eror",
    ),
  ];

  var filler_closer_reason = [
    DropdownMenuItem(
      child: Text("Air Cylinder Lid Tidak Berfungsi"),
      value: "Air Cylinder Lid Tidak Berfungsi",
    ),
    DropdownMenuItem(
      child: Text("Belt Elevator Geser"),
      value: "Belt Elevator Geser",
    ),
    DropdownMenuItem(
      child: Text("Belt Spiral Putus"),
      value: "Belt Spiral Putus",
    ),
    DropdownMenuItem(
      child: Text("Belt Vertikal Trouble"),
      value: "Belt Vertikal Trouble",
    ),
    DropdownMenuItem(
      child: Text("Can Bocor-Gagal Seaming"),
      value: "Can Bocor-Gagal Seaming",
    ),
    DropdownMenuItem(
      child: Text("Can Penyok"),
      value: "Can Penyok",
    ),
    DropdownMenuItem(
      child: Text("Can Sterilizer Trouble"),
      value: "Can Sterilizer Trouble",
    ),
    DropdownMenuItem(
      child: Text("Can Tersangkut Di Can Sterilizer"),
      value: "Can Tersangkut Di Can Sterilizer",
    ),
    DropdownMenuItem(
      child: Text("Can Tersangkut Di Stopper"),
      value: "Can Tersangkut Di Stopper",
    ),
    DropdownMenuItem(
      child: Text("Can Tersangkut Di Track"),
      value: "Can Tersangkut Di Track",
    ),
    DropdownMenuItem(
      child: Text("Can Track Patah"),
      value: "Can Track Patah",
    ),
    DropdownMenuItem(
      child: Text("Closer Nabrak"),
      value: "Closer Nabrak",
    ),
    DropdownMenuItem(
      child: Text("Closer Tumpah-Can Penyok"),
      value: "Closer Tumpah-Can Penyok",
    ),
    DropdownMenuItem(
      child: Text("Closer Tumpah-Can Tidak Ada Tutup"),
      value: "Closer Tumpah-Can Tidak Ada Tutup",
    ),
    DropdownMenuItem(
      child: Text("Closer Tumpah-Gagal Seaming"),
      value: "Closer Tumpah-Gagal Seaming",
    ),
    DropdownMenuItem(
      child: Text("Closer Tumpah-Lid Miring"),
      value: "Closer Tumpah-Lid Miring",
    ),
    DropdownMenuItem(
      child: Text("Closer Tumpah-Lid Terbalik"),
      value: "Closer Tumpah-Lid Terbalik",
    ),
    DropdownMenuItem(
      child: Text("Closer Tumpah-Tutup Tidak Sempurna"),
      value: "Closer Tumpah-Tutup Tidak Sempurna",
    ),
    DropdownMenuItem(
      child: Text("Conveyor Depall Putus"),
      value: "Conveyor Depall Putus",
    ),
    DropdownMenuItem(
      child: Text("Conveyor Filling Putus"),
      value: "Conveyor Filling Putus",
    ),
    DropdownMenuItem(
      child: Text("Depall Supply Telat"),
      value: "Depall Supply Telat",
    ),
    DropdownMenuItem(
      child: Text("Lid Burner Mati"),
      value: "Lid Burner Mati",
    ),
    DropdownMenuItem(
      child: Text("Lid Tersangkut di Magazine"),
      value: "Lid Tersangkut di Magazine",
    ),
    DropdownMenuItem(
      child: Text("Piston Filler Trouble"),
      value: "Piston Filler Trouble",
    ),
    DropdownMenuItem(
      child: Text("Rantai Can Sterilizer Lepas"),
      value: "Rantai Can Sterilizer Lepas",
    ),
    DropdownMenuItem(
      child: Text("Seaming Tidak Sempurna"),
      value: "Seaming Tidak Sempurna",
    ),
    DropdownMenuItem(
      child: Text("Temperatur filling room tdk stabil"),
      value: "Temperatur filling room tdk stabil",
    ),
    DropdownMenuItem(
      child: Text("Temperature Tidak Stabil"),
      value: "Temperature Tidak Stabil",
    ),
    DropdownMenuItem(
      child: Text("Supply OTC Telat"),
      value: "Supply OTC Telat",
    ),
    DropdownMenuItem(
      child: Text("Panel HMI Mati"),
      value: "Panel HMI Mati",
    ),
    DropdownMenuItem(
      child: Text("Closer Tumpah"),
      value: "Closer Tumpah",
    ),
    DropdownMenuItem(
      child: Text("Can Track Seret"),
      value: "Can Track Seret",
    ),
    DropdownMenuItem(
      child: Text("Closer Can Jiplak"),
      value: "Closer Can Jiplak",
    ),
    DropdownMenuItem(
      child: Text("Can Tersangkut/Jatuh"),
      value: "Can Tersangkut/Jatuh",
    ),
    DropdownMenuItem(
      child: Text("OTC tersangkut di Magnet Frame"),
      value: "OTC tersangkut di Magnet Frame",
    ),
  ];
  var labeling_reason = [
    DropdownMenuItem(
      child: Text("Can Tersangkut Di Belt Elevator"),
      value: "Can Tersangkut Di Belt Elevator",
    ),
    DropdownMenuItem(
      child: Text("Can Tersangkut Di Elevator"),
      value: "Can Tersangkut Di Elevator",
    ),
    DropdownMenuItem(
      child: Text("Can Tersangkut Di Magnetic Belt"),
      value: "Can Tersangkut Di Magnetic Belt",
    ),
    DropdownMenuItem(
      child: Text("Can Tersangkut Di Track"),
      value: "Can Tersangkut Di Track",
    ),
    DropdownMenuItem(
      child: Text("Conveyor Input Putus"),
      value: "Conveyor Input Putus",
    ),
    DropdownMenuItem(
      child: Text("Hidrolik Lepas"),
      value: "Hidrolik Lepas",
    ),
    DropdownMenuItem(
      child: Text("Hot Melt Glue Tidak Berputar"),
      value: "Hot Melt Glue Tidak Berputar",
    ),
    DropdownMenuItem(
      child: Text("Hot Melt Glue Tidak Panas"),
      value: "Hot Melt Glue Tidak Panas",
    ),
    DropdownMenuItem(
      child: Text("Hydrolic Label Macet"),
      value: "Hydrolic Label Macet",
    ),
    DropdownMenuItem(
      child: Text("Label Brudul-Label Melengkung"),
      value: "Label Brudul-Label Melengkung",
    ),
    DropdownMenuItem(
      child: Text("Label Brudul-Label Sobek Dan Miring"),
      value: "Label Brudul-Label Sobek Dan Miring",
    ),
    DropdownMenuItem(
      child: Text("Label Brudul-Lebar Label Tidak Sama"),
      value: "Label Brudul-Lebar Label Tidak Sama",
    ),
    DropdownMenuItem(
      child: Text("Label Brudul-Lem Putih Banjir"),
      value: "Label Brudul-Lem Putih Banjir",
    ),
    DropdownMenuItem(
      child: Text("Label Brudul-Lem Putih Mampet"),
      value: "Label Brudul-Lem Putih Mampet",
    ),
    DropdownMenuItem(
      child: Text("Label Brudul-Lem Putih Tidak Ada"),
      value: "Label Brudul-Lem Putih Tidak Ada",
    ),
    DropdownMenuItem(
      child: Text("Label Melipat"),
      value: "Label Melipat",
    ),
    DropdownMenuItem(
      child: Text("Label Miring"),
      value: "Label Miring",
    ),
    DropdownMenuItem(
      child: Text("Magnetic Elevator Lepas"),
      value: "Magnetic Elevator Lepas",
    ),
    DropdownMenuItem(
      child: Text("Main Belt Kendur"),
      value: "Main Belt Kendur",
    ),
    DropdownMenuItem(
      child: Text("Main Belt Lepas"),
      value: "Main Belt Lepas",
    ),
    DropdownMenuItem(
      child: Text("Main Belt Sobek"),
      value: "Main Belt Sobek",
    ),
    DropdownMenuItem(
      child: Text("Pully Maint Belt Lepas"),
      value: "Pully Maint Belt Lepas",
    ),
    DropdownMenuItem(
      child: Text("Main Belt Putus"),
      value: "Main Belt Putus",
    ),
    DropdownMenuItem(
      child: Text("Label Brudul"),
      value: "Label Brudul",
    ),
    DropdownMenuItem(
      child: Text("Oli Hydrolik bocor"),
      value: "Oli Hydrolik bocor",
    ),
    DropdownMenuItem(
      child: Text("Tangki lem bocor"),
      value: "Tangki lem bocor",
    ),
  ];

  var cermex_cartoning_reason = [
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
  ];
  var robot_palletizer_can = [
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
  ];
  var cip_kitchen = [
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
  ];
  var piltz_reason = [
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
  ];
  var folding_reason = [
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
  ];
  var omori_reason = [
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
  ];

  var samwoo_reason = [
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
  ];
  var bossar_reason = [
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
  ];
  var cartoning_reason = [
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
  ];
  var robotic_palletizer_pouch = [
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
  ];
  var carton_sealer = [
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
    DropdownMenuItem(
      child: Text("Turbo Mixing Overload"),
      value: "Turbo Mixing Overload",
    ),
  ];
}
