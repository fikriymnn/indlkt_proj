import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/style.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _fromSelectedDate;
  DateTime? _toSelectedDate;

  String selectedDateText(select) {
    return DateFormat("dd/MMMM/yyyy").format(select);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From'),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 0),
                        color: dark.withOpacity(0.4))
                  ],
                  color: Color.fromARGB(255, 229, 228, 228),
                  border: Border.all(color: blue),
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                  onTap: () async {
                    DateTime? pickDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000));

                    if (pickDate != null) {
                      setState(() {
                        _fromSelectedDate = pickDate;
                        print(_fromSelectedDate);
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 2, bottom: 2),
                    child: Text(
                        "${_fromSelectedDate != null ? selectedDateText(_fromSelectedDate) : DateFormat("dd/MMMM/yyyy").format(DateTime.now())}"),
                  )),
            ),
          ],
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
          child: Container(width: 80, color: blue, height: 3),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('To'),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 0),
                        color: dark.withOpacity(0.4))
                  ],
                  color: Color.fromARGB(255, 229, 228, 228),
                  border: Border.all(color: blue),
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                  onTap: () async {
                    DateTime? pickDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000));

                    if (pickDate != null) {
                      setState(() {
                        _toSelectedDate = pickDate;
                        print(_toSelectedDate);
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 2, bottom: 2),
                    child: Text(
                        "${_toSelectedDate != null ? selectedDateText(_toSelectedDate) : DateFormat("dd/MMMM/yyyy").format(DateTime.now())}"),
                  )),
            ),
          ],
        )
      ]),
    );
  }
}
