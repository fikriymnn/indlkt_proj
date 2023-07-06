import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/small_custom_dropdown.dart';
import 'package:indlkt_proj/widgets/small_custom_textfield.dart';

import '../constants/style.dart';

class IdleTimeForm extends StatefulWidget {
  final int index;
  final String idleHour;
  final TextEditingController idleMin;
  final dynamic valueIdleDesc;
  final void Function(dynamic) onChangeIdleDesc;
  final List<DropdownMenuItem> dropdownItemIdleDesc;

  const IdleTimeForm(
      {super.key,
      required this.index,
      required this.idleHour,
      required this.idleMin,
      required this.valueIdleDesc,
      required this.onChangeIdleDesc,
      required this.dropdownItemIdleDesc});

  @override
  State<IdleTimeForm> createState() => _IdleTimeFormState();
}

class _IdleTimeFormState extends State<IdleTimeForm> {
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
                  "${widget.index + 1}",
                  style: TextStyle(color: light),
                ))),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("Idle Desc",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallDropdown(
                    hint: 'pilih idle desc..',
                    value: widget.valueIdleDesc,
                    onChange: widget.onChangeIdleDesc,
                    dropdownItem: widget.dropdownItemIdleDesc)
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
                  hint: 'masukan idle(min)...',
                  width: 150,
                  controller: widget.idleMin,
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("Idle(Hour)",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                SmallTextfield(
                  width: 150,
                  readOnly: true,
                  value: widget.idleHour,
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
