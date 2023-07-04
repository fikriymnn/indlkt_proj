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

class FormInputData extends StatefulWidget {
  const FormInputData({super.key});

  @override
  State<FormInputData> createState() => _FormInputDataState();
}

class _FormInputDataState extends State<FormInputData> {
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

  dynamic Function() le = (){
    return "le";
  };
  dynamic Function() lp = (){
    return "lp";
  };
  dynamic Function() dt = (){
    return "dt";
  };
  dynamic Function() bd = (){
    return "bd";
  };
  

  List<Breakdown> breakdown = [Breakdown()];
  List<DownTime> downTime = [DownTime()];
  List<IdleTime> idleTime = [IdleTime()];

  

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(title: "Input Data"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
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
                                        border:
                                            Border.all(width: 1, color: blue),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: DropdownButton(
                                            hint: Text("Pilih Nama Laporan"),
                                            underline: Container(),
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                child: Text("Filling_packing_SKM_couch"),
                                                value: "Filling_packing_SKM_couchh",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("Filling_packing_SKM_couch"),
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
                                            CustomDropdown(
                                                hintText: "Pilih Shift...",
                                                onChange: (e) {
                                                  setState(() {
                                                    shift= e;
                                                  });
                                                },
                                                value: shift,
                                                dropdownItems: [
                                                  DropdownMenuItem(
                                                    child: Text(
                                                        "Filling_packing_SKM_couch"),
                                                    value:"1",
                                                  ),
                                                  DropdownMenuItem(
                                                    child: Text("2"),
                                                    value:"2",
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
                                              hint: "Masukan Actual Output...",
                                              controller: actualOutput,
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
                                              hint: "Masukan Gross Hour...",
                                              controller: grossHour,
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
                                              hint: "Masukan Nominal Speed...",
                                              controller: nominalSpeed,
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
                                              hint: "Masukan Keterangan",
                                              controller: netHour,
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
                                              hint: "Masukan Total Hour",
                                              controller: totalHour,
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
                                              hint: "Masukan Target Hour...",
                                              controller: targetHour,
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
                                                  child: Text(
                                                      "1"),
                                                  value:
                                                      "1",
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("2"),
                                                  value:
                                                      "2",
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("3"),
                                                  value:
                                                      "3",
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
                                            DisplayField(value: le(),),
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
                                                ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: breakdown.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return breakdown[index]
                                                          .breakdownForm(index);
                                                    }),
                                                InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        breakdown
                                                            .add(Breakdown());
                                                      
                                                      });
                                                    },
                                                    child: Icon(
                                                        Icons
                                                            .add_circle_rounded,
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
                                                ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: downTime.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return downTime[index]
                                                          .downtimeForm(index);
                                                    }),
                                                InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        downTime
                                                            .add(DownTime());
                                                      });
                                                    },
                                                    child: Icon(
                                                        Icons
                                                            .add_circle_rounded,
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
                                                ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: idleTime.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return idleTime[index]
                                                          .idletimeForm(index);
                                                    }),
                                                InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        idleTime
                                                            .add(IdleTime());
                                                      });
                                                    },
                                                    child: Icon(
                                                        Icons
                                                            .add_circle_rounded,
                                                        color: active,
                                                        size: 45))
                                              ],
                                            ))),
                                    SizedBox(height: 30),
                                  ],
                                )),
                            Center(
                              child: InkWell(
                                child: Container(
                                    margin: EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                        color: active,
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
      ),
    );
  }
}
