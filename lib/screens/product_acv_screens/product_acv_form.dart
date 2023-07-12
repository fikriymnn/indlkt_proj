import 'dart:async';
import 'dart:js_interop';

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
import '../../widgets/large_display_field.dart';
import '../../widgets/small_custom_dropdown.dart';
import '../../widgets/small_custom_textfield.dart';

class FormInputData extends StatefulWidget {
  const FormInputData({super.key});

  @override
  State<FormInputData> createState() => _FormInputDataState();
}

class _FormInputDataState extends State<FormInputData> {
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

  String? namaLaporan;
  String? shift;
  String? departement;
  String? product;
  String? line;

  TextEditingController actualOutput = TextEditingController();

  TextEditingController nominalSpeed = TextEditingController();
  TextEditingController totalHour = TextEditingController();

  TextEditingController planningOutput = TextEditingController();

  // dynamic Function() le = () {
  //   return "le";
  // };
  // dynamic Function() lp = () {
  //   return "lp";
  // };
  // dynamic Function() dt = () {
  //   return "dt";
  // };
  // dynamic Function() bd = () {
  //   return "bd";
  // };

  //Breakdown
  int bLength = 1;

  String? mesins;
  String? reasons;
  String? bdHours = '0';

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
  String? actHour = "0";

  List<String?> downtime = [];
  List<String?> subDT = [];
  List<String?> std = [];
  List<TextEditingController> actMin = [];

  //IdleTime
  int iLength = 1;

  String? idleDescs;
  String? idleHour = "0";

  List<String?> idleDesc = [];
  List<TextEditingController> idleMin = [];

  toHour(index, min) {
    var miin = int.parse(min);
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        var result = miin / 60;
        bdHour[index] = result.toString();
      });
      print(actMin[0].text);
    });
    return bdHour[index];
  }

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
    for (int i = 0; i < bLength; i++) bdHour.add(bdHours);

    //downtime
    for (int i = 0; i < dLength; i++)
      actMin.add(TextEditingController(text: "0"));
    for (int i = 0; i < dLength; i++) subDT.add(subDTs);
    for (int i = 0; i < dLength; i++) downtime.add(downtimes);
    for (int i = 0; i < dLength; i++) std.add(stds);

    //idle time
    for (int i = 0; i < iLength; i++)
      idleMin.add(TextEditingController(text: "0"));
    for (int i = 0; i < iLength; i++) idleDesc.add(idleDescs);

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
                                          });
                                        },
                                        items: [
                                          DropdownMenuItem(
                                            child: Text(
                                                "Filling_packing_SKM_couch"),
                                            value: "Filling_packing_SKM_couch",
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                                "Filling_packing_SKM_couch"),
                                            value: "Filling_packing_SKM_couchh",
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                                "Filling_packing_SKM_couch"),
                                            value: "Filling_packing_SKM_couchl",
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
                                                child: Text(
                                                    "Filling_packing_SKM_couch"),
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
                                                var target = int.parse(value) /
                                                    int.parse(nominalSpeeds);

                                                targetHour = target.toString();

                                                actualOutputs =
                                                    value.toString();
                                                var leV =
                                                    int.parse(targetHour) /
                                                        int.parse(netHour);
                                                var lpV =
                                                    int.parse(targetHour) /
                                                        int.parse(grossHour);
                                                le = leV.toString();
                                                lp = lpV.toString();
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
                                                child: Text(
                                                    "Filling_packing_SKM_couch"),
                                                value:
                                                    "Filling_packing_SKM_couch",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("2"),
                                                value:
                                                    "Filling_packing_SKM_couchdf",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("3"),
                                                value:
                                                    "Filling_packing_SKM_couchd",
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
                                                  int.parse(actualOutputs) /
                                                      int.parse(value);
                                              var speed = int.parse(value);
                                              nominalSpeeds = speed.toString();
                                              targetHour = target.toString();
                                              var leV = int.parse(targetHour) /
                                                  int.parse(netHour);
                                              var lpV = int.parse(targetHour) /
                                                  int.parse(grossHour);
                                              le = leV.toString();
                                              lp = lpV.toString();
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
                                                    "Filling_packing_SKM_couch"),
                                                value:
                                                    "Filling_packing_SKM_couch",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("2"),
                                                value:
                                                    "Filling_packing_SKM_couchdf",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("3"),
                                                value:
                                                    "Filling_packing_SKM_couchd",
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
                                              var gress = int.parse(value) -
                                                  int.parse(idleHour!);

                                              var net =
                                                  gress - int.parse(actHour!);
                                              grossHour = gress.toString();
                                              netHour = net.toString();
                                              var leV = int.parse(targetHour) /
                                                  int.parse(netHour);
                                              var lpV = int.parse(targetHour) /
                                                  int.parse(grossHour);
                                              totalHours = value.toString();
                                              le = leV.toString();
                                              lp = lpV.toString();
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
                                              child: Text("3"),
                                              value: "3",
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
                                                          var aa =
                                                              int.parse(value) /
                                                                  60;

                                                          bdHours =
                                                              aa.toString();
                                                        });
                                                      },
                                                      bdHour: bdHours!,
                                                      dropdownItemMesin: [
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
                                                      valueMesin: mesin[index],
                                                      onChangeMesin: (a) {
                                                        setState(() {
                                                          mesin[index] = a;
                                                        });
                                                      },
                                                      dropdownItemReason: [
                                                        DropdownMenuItem(
                                                          child:
                                                              Text("reason 1"),
                                                          value: "reason 1",
                                                        ),
                                                        DropdownMenuItem(
                                                          child:
                                                              Text("reason 2"),
                                                          value: "reason 2",
                                                        ),
                                                        DropdownMenuItem(
                                                          child:
                                                              Text("reason 3"),
                                                          value: "reason 3",
                                                        )
                                                      ],
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
                                                            var aa = int.parse(
                                                                    value) /
                                                                60;

                                                            var net = int.parse(
                                                                    grossHour) -
                                                                aa;
                                                            var groos = int.parse(
                                                                    totalHours) -
                                                                int.parse(
                                                                    idleHour!);
                                                            grossHour = groos
                                                                .toString();

                                                            netHour =
                                                                net.toString();

                                                            actHour =
                                                                aa.toString();
                                                          });
                                                        },
                                                        actHour: actHour!,
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
                                                            var aa = int.parse(
                                                                    value) /
                                                                60;

                                                            var gros = int.parse(
                                                                    totalHours) -
                                                                aa;
                                                            var net = gros -
                                                                int.parse(
                                                                    actHour!);
                                                            netHour =
                                                                net.toString();
                                                            grossHour =
                                                                gros.toString();

                                                            idleHour =
                                                                aa.toString();
                                                          });
                                                        },
                                                        idleHour: idleHour!,
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
                                                            child:
                                                                Text("mesin 1"),
                                                            value: "mesin 1",
                                                          ),
                                                          DropdownMenuItem(
                                                            child:
                                                                Text("mesin 1"),
                                                            value: "mesin 1",
                                                          ),
                                                          DropdownMenuItem(
                                                            child:
                                                                Text("mesin 1"),
                                                            value: "mesin 1",
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
                              onTap: () {
                                for (int i = 0; i < bLength; i++) {
                                  var a = freq[i].text;
                                  var b = dbMin[i].text;
                                  var c = problem[i].text;
                                  var d = mesin[i];
                                  var e = reason[i];
                                  var n = dbMin[i].text;

                                  print(a);
                                  print(b);
                                  print(c);
                                  print(d);
                                  print(e);
                                  print(n);
                                  print(toHour(i, n));
                                }
                                freq.add(TextEditingController());
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
                                      child: Text("Submit",
                                          style: TextStyle(
                                              color: light, fontSize: 15)),
                                    ),
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
}
