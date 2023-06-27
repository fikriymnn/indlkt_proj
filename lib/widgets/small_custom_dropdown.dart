import 'package:flutter/material.dart';

import '../constants/style.dart';

class SmallDropdown extends StatefulWidget {
  final double? width;
  const SmallDropdown({super.key, this.width});

  @override
  State<SmallDropdown> createState() => _SmallDropdownState();
}

class _SmallDropdownState extends State<SmallDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width ?? 150,
        height: 30,
        decoration: BoxDecoration(
          color: light,
          border: Border.all(width: 1, color: dark.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: DropdownButton(
              hint: Text(
                'input',
                style: TextStyle(fontSize: 13, color: dark.withOpacity(0.3)),
              ),
              underline: Container(),
              isExpanded: true,
              items: [
                DropdownMenuItem(
                  child: Text("Filling_packing_SKM_couch"),
                  value: "Filling_packing_SKM_couch",
                ),
                DropdownMenuItem(
                  child: Text("2"),
                  value: "Filling_packing_SKM_couchdf",
                ),
                DropdownMenuItem(
                  child: Text("3"),
                  value: "Filling_packing_SKM_couchd",
                )
              ],
              onChanged: (e) {}),
        ));
  }
}
