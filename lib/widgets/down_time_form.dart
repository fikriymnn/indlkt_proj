import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/breakdown_form.dart';
import 'package:indlkt_proj/widgets/small_custom_dropdown.dart';
import 'package:indlkt_proj/widgets/small_custom_textfield.dart';

import '../constants/style.dart';

class DownTimeForm extends StatefulWidget {
  final int index;
  final TextEditingController actMin;
  final String actHour;
  final List<DropdownMenuItem> dropdownItemDT;
  final void Function(dynamic) onChangeDT;
  final dynamic valueDT;
  final List<DropdownMenuItem> dropdownItemSubDT;
  final void Function(dynamic) onChangeSubDT;
  final dynamic valueSubDT;
  final List<DropdownMenuItem> dropdownItemSTD;
  final void Function(dynamic) onChangeSTD;
  final dynamic valueSTD;

  const DownTimeForm(
      {super.key,
      required this.index,
      required this.actMin,
      required this.actHour,
      required this.dropdownItemDT,
      required this.onChangeDT,
      required this.valueDT,
      required this.dropdownItemSubDT,
      required this.onChangeSubDT,
      required this.valueSubDT,
      required this.dropdownItemSTD,
      required this.onChangeSTD,
      required this.valueSTD});

  @override
  State<DownTimeForm> createState() => _DownTimeFormState();
}

class _DownTimeFormState extends State<DownTimeForm> {
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
                  "${widget.index+1}",
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
                  hint: 'pilih dt...',
                  value: widget.valueDT,
                  onChange: widget.onChangeDT,
                  dropdownItem: widget.dropdownItemDT,
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
                  hint: 'pilih sub dt...',
                  value: widget.valueSubDT,
                  onChange: widget.onChangeSubDT,
                  dropdownItem: widget.dropdownItemSubDT,
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
                  hint: 'pilih std...',
                  value: widget.valueSTD,
                  onChange: widget.onChangeSTD,
                  width: 80,
                  dropdownItem: widget.dropdownItemSTD,
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
                  hint: "masukan Act(Min)...",
                  width: 150,
                  controller: widget.actMin,
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
                  value: widget.actHour,
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
