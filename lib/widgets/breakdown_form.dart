import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/small_custom_dropdown.dart';
import 'package:indlkt_proj/widgets/small_custom_textfield.dart';

import '../constants/style.dart';

class BreakdownForm extends StatefulWidget {
  final int index;
  const BreakdownForm({super.key, required this.index});

  @override
  State<BreakdownForm> createState() => _BreakdownFormState();
}

class _BreakdownFormState extends State<BreakdownForm> {
  var form = Breakdown().form;
  var form2 = Breakdown().form2;
  var form3 = Breakdown().form3;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${widget.index}"),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text("Mesin", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              SmallDropdown()
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
              SmallDropdown()
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
                controller: form,
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
                controller: form2,
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
                controller: form3,
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
    ]);
  }
}

class Breakdown {
  TextEditingController form = TextEditingController();
  TextEditingController form2 = TextEditingController();
  TextEditingController form3 = TextEditingController();

  Map<String, dynamic> getValue() {
    return {
      'freq': form.value,
      'db_hour_min': form2.value,
      'db_hour': form3.value
    };
  }

  Widget breakdownForm(index) {
    return BreakdownForm(index: index + 1);
  }
}
