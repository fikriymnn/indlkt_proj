import 'package:flutter/material.dart';

import '../constants/style.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final String? displayValue;
  final bool? readOnly;

  const CustomTextField(
      {super.key,
      required this.hint,
      required this.controller,
      this.displayValue,
      this.readOnly});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 310,
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
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: TextFormField(
            initialValue: widget.displayValue,
            readOnly: widget.readOnly == null ? false : true,
            controller: widget.controller,
            decoration: InputDecoration.collapsed(hintText: widget.hint),
          ),
        ),
      ),
    );
  }
}
