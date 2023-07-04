import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/small_custom_dropdown.dart';
import 'package:indlkt_proj/widgets/small_custom_textfield.dart';

import '../constants/style.dart';

class BreakdownForm extends StatefulWidget {
  final int index;
  const BreakdownForm({super.key, required this.index,});


  @override
  State<BreakdownForm> createState() => BreakdownFormState();
}

class BreakdownFormState extends State<BreakdownForm> {
  var vau = "ajsjds";
  TextEditingController freq = TextEditingController();
  TextEditingController dbMin = Breakdown().dbMin;
  TextEditingController problem = Breakdown().problem;

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
              height:25,
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(100)
              ),
              child: Center(child: Text("${widget.index}",style: TextStyle(color: light),))),
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
                  value: Breakdown().getMesin,
                  onChange: (a) {
                
                      Breakdown().setMesin = a;
                    
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
                Text("Reason Breakdown",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallDropdown(
                  value: Breakdown().reasonBreakdown,
                  onChange: (a) {
                    setState(() {
                      Breakdown().setReasonBreakdown = a;
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
                Text("Freq", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallTextfield(
                  width: 80,
                  controller: freq,
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
                  controller: dbMin,
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
                  value: Breakdown().dbHour(),
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
                    controller: TextEditingController(),
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

class Breakdown {
  TextEditingController freq = TextEditingController();
  TextEditingController dbMin = TextEditingController();
  TextEditingController problem = TextEditingController();

  dynamic mesin;
  dynamic reasonBreakdown;

  dynamic get getMesin{
    return mesin;
  } 

  dynamic get getReasonBreakdown{
    return reasonBreakdown;
  } 


  set setMesin(dynamic mesin){
     mesin = mesin;
  }

  set setReasonBreakdown(dynamic reasonBreakdown){
     reasonBreakdown = reasonBreakdown;
  }

  dynamic dbHour(){
    return "db hour";
  }

  Map<String, dynamic> getValue() {
    return {
      'mesin':mesin,
      'reason_breakdown': reasonBreakdown,
      'freq': freq.text,
      'db_hour_min': dbMin.text,
      'problem': problem.text,
      'db_hour':dbHour()
    };
  }

  Widget breakdownForm(index) {
    return BreakdownForm(index: index + 1);
  }
}
