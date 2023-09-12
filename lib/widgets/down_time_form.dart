import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/breakdown_form.dart';
import 'package:indlkt_proj/widgets/small_custom_dropdown.dart';
import 'package:indlkt_proj/widgets/small_custom_textfield.dart';

import '../constants/style.dart';

class DownTimeForm extends StatefulWidget {
  final int index;
  final TextEditingController actMin;
  final String actHour;
  final List<String> dropdownItemDT;
  final void Function(dynamic) onChangeDT;
  final dynamic valueDT;
  final List<String> dropdownItemSubDT;
  final void Function(dynamic) onChangeSubDT;
  final dynamic valueSubDT;

  final dynamic valueSTD;
  final void Function(dynamic)? onChange;

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
      required this.valueSTD,
      this.onChange});

  @override
  State<DownTimeForm> createState() => _DownTimeFormState();
}

class _DownTimeFormState extends State<DownTimeForm> {
  String? hour = "0";
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
                Text("DT", style: TextStyle(fontWeight: FontWeight.bold)),
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
                        items: widget.dropdownItemDT,
                        label: widget.valueDT,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1, color: dark.withOpacity(0.5))),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Icon(Icons.search),
                        ),
                        dropDownMenuItems: widget.dropdownItemDT,
                        onChanged: widget.onChangeDT,
                      ),
                    ))
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
                Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: light,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomSearchableDropDown(
                        enabled: widget.valueDT == null ? false : true,
                        items: widget.dropdownItemSubDT,
                        label: widget.valueSubDT,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1, color: dark.withOpacity(0.5))),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Icon(Icons.search),
                        ),
                        dropDownMenuItems: widget.dropdownItemSubDT,
                        onChanged: widget.onChangeSubDT,
                      ),
                    ))
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
                Text("${widget.valueSTD}")
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
                    onChange: widget.onChange)
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
                Text("${widget.actHour}")
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
