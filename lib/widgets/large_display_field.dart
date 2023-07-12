import 'package:flutter/material.dart';

import '../constants/style.dart';

class largeDisplayField extends StatefulWidget {
  final dynamic value;
  final dynamic rumus1;
  final dynamic rumus2;
  const largeDisplayField({super.key, this.value, this.rumus1, this.rumus2});

  @override
  State<largeDisplayField> createState() => _largeDisplayFieldState();
}

class _largeDisplayFieldState extends State<largeDisplayField> {
  @override
  Widget build(BuildContext context) {
    double mediaQuery = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 23, right: 23),
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
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 11, bottom: 11),
            child: Text("${widget.value == null ? '' : widget.value}"),
          ),
        ),
      ),
    );
  }
}
