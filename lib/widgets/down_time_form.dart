import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/breakdown_form.dart';
import 'package:indlkt_proj/widgets/small_custom_dropdown.dart';
import 'package:indlkt_proj/widgets/small_custom_textfield.dart';

import '../constants/style.dart';

class DownTimeForm extends StatefulWidget {
  final int index;
  const DownTimeForm({
    super.key,
    required this.index,
  });

  @override
  State<DownTimeForm> createState() => _DownTimeFormState();
}

class _DownTimeFormState extends State<DownTimeForm> {
  TextEditingController actMin = DownTime().actMin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 35),
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: blue, borderRadius: BorderRadius.circular(100)),
                child: Center(
                    child: Text(
                  "${widget.index}",
                  style: TextStyle(color: light),
                ))),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("DT", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallDropdown(
                  value: DownTime().getDT,
                  onChange: (a) {
                    setState(() {
                      DownTime().setDT = a;
                    });
                  },
                  dropdownItem: [
                    DropdownMenuItem(
                      child: Text("Filling_packing_SKM_couch"),
                      value: "Filling_packing_SKM_couch",
                    ),
                    DropdownMenuItem(
                      child: Text("Filling_packing_SKM_couch"),
                      value: "Filling_packing_SKM_couch",
                    ),
                    DropdownMenuItem(
                      child: Text("Filling_packing_SKM_couch"),
                      value: "Filling_packing_SKM_couch",
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("Sub DT", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallDropdown(
                  value: DownTime().getDT,
                  onChange: (a) {
                    setState(() {
                      DownTime().setDT = a;
                    });
                  },
                  dropdownItem: [
                    DropdownMenuItem(
                      child: Text("Filling_packing_SKM_couch"),
                      value: "Filling_packing_SKM_couch",
                    ),
                    DropdownMenuItem(
                      child: Text("Filling_packing_SKM_couch"),
                      value: "Filling_packing_SKM_couch",
                    ),
                    DropdownMenuItem(
                      child: Text("Filling_packing_SKM_couch"),
                      value: "Filling_packing_SKM_couch",
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("STD", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallDropdown(
                  value: DownTime().getSTD,
                  onChange: (a) {
                    setState(() {
                      DownTime().setSTD = a;
                    });
                  },
                  width: 80,
                  dropdownItem: [
                    DropdownMenuItem(
                      child: Text("Filling_packing_SKM_couch"),
                      value: "Filling_packing_SKM_couch",
                    ),
                    DropdownMenuItem(
                      child: Text("Filling_packing_SKM_couch"),
                      value: "Filling_packing_SKM_couch",
                    ),
                    DropdownMenuItem(
                      child: Text("Filling_packing_SKM_couch"),
                      value: "Filling_packing_SKM_couch",
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("Act(Min)", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallTextfield(
                  hint: "input",
                  readOnly: true,
                  width: 150,
                  controller: actMin,
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("Act(Hour)",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallTextfield(
                  readOnly: true,
                  width: 150,
                  value: DownTime().actHour(),
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
  }
}

class DownTime {
  dynamic dt;
  dynamic subDT;
  dynamic std;
  TextEditingController actMin = TextEditingController();

  dynamic get getDT {
    return dt;
  }

  dynamic get getSubDT {
    return subDT;
  }

  dynamic get getSTD {
    return std;
  }

  set setDT(dynamic dt) {
    dt = dt;
  }

  set setSubDT(dynamic subDT) {
    subDT = subDT;
  }

  set setSTD(dynamic std) {
    std = std;
  }

  dynamic actHour() {
    return "act hour";
  }

  Map<String, dynamic> getValue() {
    return {
      'dt': dt,
      'sub_dt': subDT,
      'std': std,
      'act_min': actMin,
      'act_hour': actHour()
    };
  }

  Widget downtimeForm(index) {
    return DownTimeForm(index: index + 1);
  }
}
