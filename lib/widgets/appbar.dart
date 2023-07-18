import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/style.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor = blue;
  // final double? height;
  CustomAppBar({
    super.key,
    required String this.title,
    // this.height,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize 85
  Size get preferredSize => Size.fromHeight(90);
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
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    print(mediaQueryWidth);
    return AppBar(
        backgroundColor: widget.backgroundColor,
        titleTextStyle: TextStyle(color: Colors.white),
        toolbarHeight: mediaQueryWidth * 0.056,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: mediaQueryWidth * 0.0461,
                  decoration: BoxDecoration(
                    color: light,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(mediaQueryWidth * 0.0132),
                        bottomRight: Radius.circular(mediaQueryWidth * 0.0132)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: mediaQueryWidth * 0.007,
                        left: mediaQueryWidth * 0.007),
                    child: Column(
                      children: [
                        SizedBox(height: mediaQueryWidth * 0.008),
                        Text(
                          "${dateText}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: mediaQueryWidth * 0.0132,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: mediaQueryWidth * 0.0033,
                        ),
                        Text("${timeText} WIB",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: mediaQueryWidth * 0.01,
                                color: Colors.black))
                      ],
                    ),
                  )),
            ],
          ),
          SizedBox(width: mediaQueryWidth * 0.053)
        ],
        title: Row(children: [
          Padding(
            padding: EdgeInsets.all(mediaQueryWidth * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'INVENTORY MANAGEMENT PT.INDOLAKTO',
                  style: TextStyle(
                      fontSize: mediaQuery * 0.02, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: mediaQueryWidth * 0.0033,
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
