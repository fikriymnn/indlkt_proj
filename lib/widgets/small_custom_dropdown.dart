import 'package:flutter/material.dart';

class SmallDropdown extends StatefulWidget {
  const SmallDropdown({super.key});

  @override
  State<SmallDropdown> createState() => _SmallDropdownState();
}

class _SmallDropdownState extends State<SmallDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: DropdownButton(
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
    );
  }
}
