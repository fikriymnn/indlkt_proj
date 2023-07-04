import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/small_custom_dropdown.dart';
import 'package:indlkt_proj/widgets/small_custom_textfield.dart';

import '../constants/style.dart';

class BreakdownForm extends StatefulWidget {
  final int index;
  final TextEditingController freq;
  final TextEditingController bdMin;
  final TextEditingController problem;
  final String mesin;
  final String reason;
  final String bdHour;
  final List<DropdownMenuItem> dropdownItemMesin;
  final void Function(dynamic) onChangeMesin;
  final dynamic valueMesin;
  final List<DropdownMenuItem> dropdownItemReason;
  final void Function(dynamic) onChangeReason;
  final dynamic valueReason;
  const BreakdownForm(
      {super.key,
      required this.index,
      required this.bdMin,
      required this.freq,
      required this.problem,
      required this.mesin,
      required this.reason,
      required this.bdHour,
      required this.dropdownItemMesin,
      required this.onChangeMesin,
      required this.valueMesin,
      required this.dropdownItemReason,
      required this.onChangeReason,
      required this.valueReason});

  @override
  State<BreakdownForm> createState() => BreakdownFormState();
}

class BreakdownFormState extends State<BreakdownForm> {
  var vau = "ajsjds";

  String? mesin;
  String? reason;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
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
                Text("Mesin", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallDropdown(
                    value: widget.valueMesin,
                    onChange: widget.onChangeMesin,
                    dropdownItem: widget.dropdownItemMesin)
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("Reason Breakdown",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallDropdown(
                    value: widget.valueReason,
                    onChange: widget.onChangeReason,
                    dropdownItem: widget.dropdownItemReason)
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("Freq", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallTextfield(
                  width: 80,
                  controller: widget.freq,
                  hint: 'input',
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("BD Hour(Min)",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallTextfield(
                  width: 150,
                  controller: widget.bdMin,
                  hint: 'input2',
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("BD Hour", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallTextfield(
                  width: 150,
                  value: widget.bdHour,
                  readOnly: true,
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
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: EdgeInsets.only(left: 70),
                child: Text("Problem",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.only(left: 25),
                width: 400,
                height: 90,
                decoration: BoxDecoration(
                  color: light,
                  border: Border.all(width: 1, color: dark.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: TextField(
                    maxLines: 4,
                    controller: widget.problem,
                    decoration: InputDecoration.collapsed(
                        hintText: "input",
                        hintStyle: TextStyle(
                            fontSize: 13, color: dark.withOpacity(0.3))),
                  ),
                ))
          ]),
        ])
      ]),
    );
  }
}

// class Breakdown {
//   TextEditingController freq = TextEditingController();
//   TextEditingController dbMin = TextEditingController();
//   TextEditingController problem = TextEditingController();

//   dynamic mesin;
//   dynamic reasonBreakdown;

//   dynamic get Mesin => mesin;

//   dynamic get ReasonBreakdown => reasonBreakdown;

//   set Mesin(dynamic mesin) {
//     mesin = mesin;
//   }

//   set ReasonBreakdown(dynamic reasonBreakdown) {
//     reasonBreakdown = reasonBreakdown;
//   }

//   dynamic dbHour() {
//     return "db hour";
//   }

//   Map<String, dynamic> getValue() {
//     return {
//       'mesin': mesin,
//       'reason_breakdown': reasonBreakdown,
//       'freq': freq.text,
//       'db_hour_min': dbMin.text,
//       'problem': problem.text,
//       'db_hour': dbHour()
//     };
//   }

//   Widget breakdownForm(index) {
//     return BreakdownForm(index: index + 1);
//   }
// }
