import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/small_custom_dropdown.dart';

import '../constants/style.dart';

class BreakdownForm extends StatefulWidget {
  const BreakdownForm({super.key});

  @override
  State<BreakdownForm> createState() => _BreakdownFormState();
}

class _BreakdownFormState extends State<BreakdownForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 750,
      decoration: BoxDecoration(
        color: light,
        boxShadow: [
          BoxShadow(
              blurRadius: 4, offset: Offset(0, 2), color: dark.withOpacity(0.7))
        ],
        border: Border.all(width: 3, color: lightGrey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 11, bottom: 11),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(child: Text("1")),
              Column(
                children: [Text("Mesin"), SmallDropdown()],
              ),
              Column(
                children: [Text("Mesin"), SmallDropdown()],
              ),
              Column(
                children: [Text("Mesin"), SmallDropdown()],
              ),
              Column(
                children: [Text("Mesin"), SmallDropdown()],
              ),
              Column(
                children: [Text("Mesin"), SmallDropdown()],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
