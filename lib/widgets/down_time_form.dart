import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/small_custom_dropdown.dart';
import 'package:indlkt_proj/widgets/small_custom_textfield.dart';

import '../constants/style.dart';

class DownTimeForm extends StatefulWidget {
  final int index;
  const DownTimeForm({super.key, required this.index});

  @override
  State<DownTimeForm> createState() => _DownTimeFormState();
}

class _DownTimeFormState extends State<DownTimeForm> {
  var form = DownTime().form;
  var form2 = DownTime().form2;
  var form3 = DownTime().form3;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 35),
      child: Column(children: [
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
      ]),
    );
  }
}

class DownTime {
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

  Widget downtimeForm(index) {
    return DownTimeForm(index: index + 1);
  }
}
