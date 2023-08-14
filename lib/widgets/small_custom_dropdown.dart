import 'package:flutter/material.dart';
import '../constants/style.dart';

class SmallDropdown extends StatefulWidget {
  final double? width;
  final List<DropdownMenuItem> dropdownItem;
  final void Function(dynamic) onChange;
  final dynamic value;
  final String hint;
  const SmallDropdown(
      {super.key,
      this.width,
      required this.dropdownItem,
      required this.onChange,
      required this.value,
      required this.hint});

  @override
  State<SmallDropdown> createState() => _SmallDropdownState();
}

class _SmallDropdownState extends State<SmallDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width ?? 150,
        height: 35,
        decoration: BoxDecoration(
          color: light,
          border: Border.all(width: 1, color: dark.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: DropdownButton(
              hint: Text(
                widget.hint,
                style: TextStyle(
                    fontSize: 13,
                    color: dark.withOpacity(0.4),
                    overflow: TextOverflow.ellipsis),
              ),
              underline: Container(),
              isExpanded: true,
              value: widget.value,
              items: widget.dropdownItem,
              onChanged: widget.onChange),
        ));
  }
}
