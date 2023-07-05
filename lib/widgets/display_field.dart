import 'package:flutter/material.dart';

import '../constants/style.dart';

class DisplayField extends StatefulWidget {
  final dynamic value;
  const DisplayField({super.key,this.value});

  @override
  State<DisplayField> createState() => _DisplayFieldState();
}

class _DisplayFieldState extends State<DisplayField> {
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Container(
          width: 100,
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
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 11, bottom: 11),
            child: Text("${widget.value==null?'':widget.value}"),
          ),
        ),
      ),
    );
  }
}
