import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/small_custom_dropdown.dart';
import 'package:indlkt_proj/widgets/small_custom_textfield.dart';

import '../constants/style.dart';

class IdleTimeForm extends StatefulWidget {
  final int index;
  const IdleTimeForm({super.key, required this.index});

  @override
  State<IdleTimeForm> createState() => _IdleTimeFormState();
}

class _IdleTimeFormState extends State<IdleTimeForm> {
  TextEditingController idleMin = IdleTime().idleMin;

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
                Text("Idle Desc", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallDropdown(
                  value: IdleTime().getIdleDesc,
                  onChange: (a) {
                    setState(() {
                      IdleTime().setIdleDesc=a;
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
                Text("Idle(Min)",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallTextfield(
                  readOnly: true,
                  width: 150,
                  controller: idleMin,
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("Idle(Hour)", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallTextfield(
                  width: 150,
                  readOnly: true,
                  value: IdleTime().idleHour(),
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

class IdleTime {
  dynamic idleDesc;
  TextEditingController idleMin = TextEditingController();

  dynamic get getIdleDesc{
    return idleDesc;
  }

  set setIdleDesc(dynamic idleDesc){
    idleDesc = idleDesc;
  }

  dynamic idleHour(){
     return "idle hour";
  }


  Map<String, dynamic> getValue() {
    return {
      'idle_desc':idleDesc ,
      'idle_min': idleMin,
      'idle_hour': idleHour()
    };
  }

  Widget idletimeForm(index) {
    return IdleTimeForm(index: index + 1);
  }
}
