import 'package:flutter/material.dart';

import '../../../constants/style.dart';

class CustomDropdown extends StatefulWidget {
  final List<DropdownMenuItem<String>> dropdownItems;
  final String? value;

  const CustomDropdown(
      {super.key, required this.dropdownItems, required this.value});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: light,
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 0),
                color: dark.withOpacity(0.4))
          ],
          border: Border.all(width: 3, color: lightGrey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: DropdownButton(
              underline: Container(),
              borderRadius: BorderRadius.circular(10),
              value: widget.value,
              onChanged: (e) {
                setState(() {
                  dropdownValue = e!;
                });
              },
              items: widget.dropdownItems),
        ),
      ),
    );
  }
}
