import 'package:flutter/material.dart';

import '../constants/style.dart';

class CustomDropdown extends StatefulWidget {
  final List<DropdownMenuItem<dynamic>> dropdownItems;
  final dynamic value;
  final void Function(dynamic) onChange;
  final String hintText;

  const CustomDropdown({
    super.key,
    required this.dropdownItems,
    required this.value,
    required this.onChange,
    required this.hintText,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    double mediaQuery = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        width: mediaQuery * 0.227,
        height: 50,
        decoration: BoxDecoration(
          color: light,
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 2),
                color: dark.withOpacity(0.7))
          ],
          border: Border.all(width: 3, color: lightGrey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButton(
            isExpanded: true,
            hint: Text(widget.hintText),
            underline: Container(),
            borderRadius: BorderRadius.circular(10),
            value: widget.value,
            onChanged: widget.onChange,
            items: widget.dropdownItems,
          ),
        ),
      ),
    );
  }
}
