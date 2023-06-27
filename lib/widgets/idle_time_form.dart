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
  var form = IdleTime().form;
  var form2 = IdleTime().form2;
  var form3 = IdleTime().form3;

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
              Text("DT", style: TextStyle(fontWeight: FontWeight.bold)),
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
              Text("Sub DT", style: TextStyle(fontWeight: FontWeight.bold)),
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
              Text("STD", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              SmallDropdown(width: 80)
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
                readOnly: true,
                width: 150,
                controller: form2,
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
    ]);
  }
}

class IdleTime {
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

  Widget idletimeForm(index) {
    return IdleTimeForm(index: index + 1);
  }
}
