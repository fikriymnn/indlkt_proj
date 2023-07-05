import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/style.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor = blue;
  CustomAppBar({super.key, required String this.title});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(85);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String timeText = "";
  String dateText = "";

  String formatCurrentLiveTime(DateTime time) {
    return DateFormat.Hms().format(time);
  }

  String formatCurrentDate(DateTime date) {
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  getCurrentLiveTime() {
    final DateTime timeNow = DateTime.now();
    final String liveTime = formatCurrentLiveTime(timeNow);
    final String liveDate = formatCurrentDate(timeNow);

    if (this.mounted) {
      setState(() {
        timeText = liveTime;
        dateText = liveDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    timeText = formatCurrentLiveTime(DateTime.now());
    dateText = formatCurrentDate(DateTime.now());

    Timer.periodic(Duration(seconds: 1), (timer) {
      getCurrentLiveTime();
    });
  }

  Widget build(BuildContext context) {
    double mediaQuery = MediaQuery.of(context).size.width;
    return AppBar(
        backgroundColor: widget.backgroundColor,
        titleTextStyle: TextStyle(color: Colors.white),
        toolbarHeight: 85,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: light,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        Text(
                          "${dateText}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("${timeText} WIB",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black))
                      ],
                    ),
                  )),
            ],
          ),
          SizedBox(width: 80)
        ],
        title: Row(children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'INVENTORY MANAGEMENT PT.INDOLAKTO',
                  style: TextStyle(
                      fontSize: mediaQuery * 0.02, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: mediaQuery * 0.02),
                )
              ],
            ),
          ),
        ]));
  }
}
