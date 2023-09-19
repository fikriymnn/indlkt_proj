import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
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
  final List<String> dropdownItemIdleDesc;
  final void Function(dynamic)? onChange;

  const IdleTimeForm(
      {super.key,
      required this.index,
      required this.idleHour,
      required this.idleMin,
      required this.valueIdleDesc,
      required this.onChangeIdleDesc,
      required this.dropdownItemIdleDesc,
      this.onChange});

  @override
  State<IdleTimeForm> createState() => _IdleTimeFormState();
}

class _IdleTimeFormState extends State<IdleTimeForm> {
  String hour = "0";
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
                Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: light,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomSearchableDropDown(
                        enabled: true,
                        items: widget.dropdownItemIdleDesc,
                        label: widget.valueIdleDesc,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1, color: dark.withOpacity(0.5))),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Icon(Icons.search),
                        ),
                        dropDownMenuItems: widget.dropdownItemIdleDesc,
                        onChanged: widget.onChangeIdleDesc,
                      ),
                    ))
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
                    onChange: widget.onChange)
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
                Text("${widget.idleHour}")
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
