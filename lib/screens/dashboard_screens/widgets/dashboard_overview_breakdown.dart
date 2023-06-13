import 'package:flutter/material.dart';

import '../../../constants/style.dart';

class BreakdownItem extends StatefulWidget {
  const BreakdownItem({super.key});

  @override
  State<BreakdownItem> createState() => _BreakdownItemState();
}

class _BreakdownItemState extends State<BreakdownItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Utility'),
      subtitle: Text('Listrik Trip/Deep Sag'),
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
                  "140",
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
