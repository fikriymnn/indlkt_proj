import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/custom_dropdown.dart';
import 'package:indlkt_proj/widgets/appbar.dart';

import '../../constants/style.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_textfield.dart';

class detail_form extends StatefulWidget {
  const detail_form({super.key});

  @override
  State<detail_form> createState() => _detail_formState();
}

class _detail_formState extends State<detail_form> {
  int dropdownValue = 1;
  String? dropdownValue1;
  int? dropDownValue2;
  int? dropDownValue3;
  TextEditingController namaProduct = TextEditingController();
  TextEditingController namaProduct2 = TextEditingController();
  TextEditingController namaProduct3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: mediaQueryHeight,
          child: Stack(children: [
            CustomContainer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    alignment: Alignment.topRight,
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
                          hint: Text("Pilih Nama Laporan"),
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
                SizedBox(height: 15),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text("Shift",
                                style: TextStyle(
                                    color: dark,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
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
                              ]),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text("Shift",
                                style: TextStyle(
                                    color: dark,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text("Shift",
                                style: TextStyle(
                                    color: dark,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
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
                SizedBox(height: 15),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text("Shift",
                                style: TextStyle(
                                    color: dark,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
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
                              ]),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text("Shift",
                                style: TextStyle(
                                    color: dark,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text("Shift",
                                style: TextStyle(
                                    color: dark,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
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
                SizedBox(height: 15),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Shift",
                              style: TextStyle(
                                  color: dark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
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
                              ]),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text("Shift",
                                style: TextStyle(
                                    color: dark,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text("Shift",
                                style: TextStyle(
                                    color: dark,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
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
              ],
            )),
          ]),
        ),
      ),
    );
  }
}
