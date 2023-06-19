import 'package:flutter/material.dart';
import 'package:indlkt_proj/screens/product_acv_screens/widgets/dropdown.dart';
import 'package:indlkt_proj/widgets/appbar.dart';

import '../../constants/style.dart';
import '../../widgets/custom_container.dart';

class FormInputData extends StatefulWidget {
  const FormInputData({super.key});

  @override
  State<FormInputData> createState() => _FormInputDataState();
}

class _FormInputDataState extends State<FormInputData> {
  String dropdownValue1 = "";
  int dropdownValue = 1;
  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(title: "Input Data"),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: mediaQueryHeight,
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text('Tambah Data Baru',
                          style: TextStyle(
                              color: blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                CustomContainer(
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
                          border: Border.all(width: 1, color: blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: DropdownButton(
                              underline: Container(),
                              borderRadius: BorderRadius.circular(10),
                              value: dropdownValue,
                              onChanged: (e) {
                                setState(() {
                                  dropdownValue = e!;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  child: Text("Filling_packing_SKM_couch"),
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
                    Row(
                      children: [
                        CustomDropdown(value: dropdownValue1!, dropdownItems: [
                          DropdownMenuItem(
                            child: Text("Filling_packing_SKM_couch"),
                            value: "Filling_packing_SKM_couch",
                          ),
                          DropdownMenuItem(
                            child: Text("2"),
                            value: "Filling_packing_SKM_couchdf",
                          ),
                          DropdownMenuItem(
                            child: Text("3"),
                            value: "Filling_packing_SKM_couchd",
                          )
                        ])
                      ],
                    ),
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
