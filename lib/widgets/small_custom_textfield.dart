import 'package:flutter/material.dart';

import '../constants/style.dart';

class SmallTextfield extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final double width;
  final bool? readOnly;
  final dynamic value;
  final void Function(dynamic)? onChange;

  const SmallTextfield(
      {super.key,
      this.hint,
      this.controller,
      required this.width,
      this.readOnly,
      this.value,
      this.onChange});

  @override
  State<SmallTextfield> createState() => _SmallTextfieldState();
}

class _SmallTextfieldState extends State<SmallTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: 30,
        decoration: BoxDecoration(
          color: light,
          border: Border.all(width: 1, color: dark.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: TextFormField(
            onChanged: widget.onChange,
            initialValue: widget.value == null ? null : "${widget.value}",
            readOnly: widget.readOnly == null ? false : true,
            controller: widget.controller == null ? null : widget.controller,
            decoration: InputDecoration.collapsed(
                hintText: widget.hint ?? "",
                hintStyle:
                    TextStyle(fontSize: 13, color: dark.withOpacity(0.4))),
          ),
        ));
  }
}
