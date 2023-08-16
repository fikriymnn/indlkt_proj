import 'package:flutter/material.dart';

import '../../../constants/style.dart';

class BreakdownItem extends StatefulWidget {
  final String title;
  final String desc;
  final int number;

  const BreakdownItem(
      {required this.title, required this.desc, required this.number});

  @override
  State<BreakdownItem> createState() => _BreakdownItemState();
}

class _BreakdownItemState extends State<BreakdownItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(widget.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      subtitle: Text(widget.desc,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      trailing: Container(
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
            color: blue,
          )),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  (widget.number).toString(),
                  style: TextStyle(
                    color: active,
                  ),
                ),
              ),
              Container(
                  color: blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Hours",
                        style: TextStyle(
                          color: light,
                        )),
                  )),
            ],
          )),
    );
  }
}
