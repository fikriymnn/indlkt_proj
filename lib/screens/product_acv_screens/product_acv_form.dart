import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/custom_dropdown.dart';
import 'package:indlkt_proj/widgets/appbar.dart';

import '../../constants/style.dart';
import '../../widgets/breakdown_form.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/display_field.dart';
import '../../widgets/idle_time_form.dart';

class FormInputData extends StatefulWidget {
  const FormInputData({super.key});

  @override
  State<FormInputData> createState() => _FormInputDataState();
}

class _FormInputDataState extends State<FormInputData> {
  int dropdownValue = 1;
  String? dropdownValue1;
  int? dropDownValue2;
  int? dropDownValue3;
  int? dropDownValue4;

  TextEditingController namaProduct = TextEditingController();
  TextEditingController namaProduct2 = TextEditingController();
  TextEditingController namaProduct3 = TextEditingController();
  List<Breakdown> breakdown = [Breakdown()];
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
                                            value: dropdownValue,
                                            onChanged: (e) {
                                              setState(() {
                                                dropdownValue = e!;
                                              });
                                            },
                                            items: [
                                              DropdownMenuItem(
                                                child: Text(
                                                    "Filling_packing_SKM_couch"),
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
                                                      color: dark,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomDropdown(
                                                hintText: "Pilih Shift...",
                                                onChange: (e) {
                                                  setState(() {
                                                    dropdownValue1 = e;
                                                  });
                                                },
                                                value: dropdownValue1,
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
                                              child: Text("Shift",
                                                  style: TextStyle(
                                                      color: dark,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              hint: "Masukan Keterangan",
                                              controller: namaProduct,
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
                                              child: Text("Shift",
                                                  style: TextStyle(
                                                      color: dark,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              hint: "Masukan Keterangan",
                                              controller: namaProduct2,
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
                                              child: Text("Shift",
                                                  style: TextStyle(
                                                      color: dark,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomDropdown(
                                                hintText: "Pilih Shift...",
                                                onChange: (e) {
                                                  setState(() {
                                                    dropDownValue2 = e;
                                                  });
                                                },
                                                value: dropDownValue2,
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
                                              child: Text("Shift",
                                                  style: TextStyle(
                                                      color: dark,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              hint: "Masukan Keterangan",
                                              controller: namaProduct,
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
                                              child: Text("Shift",
                                                  style: TextStyle(
                                                      color: dark,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              hint: "Masukan Keterangan",
                                              controller: namaProduct2,
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
                                              child: Text("Shift",
                                                  style: TextStyle(
                                                      color: dark,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomDropdown(
                                                hintText: "Pilih Shift...",
                                                onChange: (e) {
                                                  setState(() {
                                                    dropDownValue3 = e;
                                                  });
                                                },
                                                value: dropDownValue3,
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
                                              child: Text("Shift",
                                                  style: TextStyle(
                                                      color: dark,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              hint: "Masukan Keterangan",
                                              controller: namaProduct,
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
                                              child: Text("Shift",
                                                  style: TextStyle(
                                                      color: dark,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              hint: "Masukan Keterangan",
                                              controller: namaProduct2,
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
                                            child: Text("Shift",
                                                style: TextStyle(
                                                    color: dark,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          CustomDropdown(
                                              hintText: "Pilih Shift...",
                                              onChange: (e) {
                                                setState(() {
                                                  dropDownValue4 = e;
                                                });
                                              },
                                              value: dropDownValue4,
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
                                              child: Text("Shift",
                                                  style: TextStyle(
                                                      color: dark,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            DisplayField(),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text("Shift",
                                                  style: TextStyle(
                                                      color: dark,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            DisplayField(),
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
                                            child: Text("Shift",
                                                style: TextStyle(
                                                    color: dark,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          DisplayField(),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            child: Text("Shift",
                                                style: TextStyle(
                                                    color: dark,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          DisplayField(),
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
                                              child: Text("Shift",
                                                  style: TextStyle(
                                                      color: dark,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            CustomTextField(
                                              hint: "Masukan Keterangan",
                                              controller: namaProduct2,
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
                                    Text("Shift",
                                        style: TextStyle(
                                            color: dark,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                        width: 900,
                                        decoration: BoxDecoration(
                                          color: light,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 4,
                                                offset: Offset(0, 2),
                                                color: dark.withOpacity(0.7))
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
                                                      return Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 30),
                                                          child: breakdown[
                                                                  index]
                                                              .breakdownForm(
                                                                  index));
                                                    }),
                                                SizedBox(height: 10),
                                                InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        breakdown
                                                            .add(Breakdown());
                                                        print(breakdown);
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
                                    Text("Shift",
                                        style: TextStyle(
                                            color: dark,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                        width: 900,
                                        decoration: BoxDecoration(
                                          color: light,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 4,
                                                offset: Offset(0, 2),
                                                color: dark.withOpacity(0.7))
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
                                                      return Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 30),
                                                          child: idleTime[index]
                                                              .idletimeForm(
                                                                  index));
                                                    }),
                                                SizedBox(height: 10),
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
                                            )))
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
