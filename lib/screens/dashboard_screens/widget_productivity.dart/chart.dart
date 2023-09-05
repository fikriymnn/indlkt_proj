import 'dart:math';

import 'package:chart_components/bar_chart_component.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../dashboard_productivity_screen.dart';
import '../widgets/dashboard_productivity_container.dart';

class ChartProductivity extends StatefulWidget {
  const ChartProductivity({
    super.key,
    this.tahunThen,
    this.tahunNow,
    this.labelTahunThen,
    this.labelTahunNow,
    this.moon2,
    this.moon1,
    this.labelMoon1,
    this.labelMoon2,
    this.week1,
    this.week2,
    this.week3,
    this.week4,
    this.labelWeek1,
    this.labelWeek2,
    this.labelWeek3,
    this.labelWeek4,
    this.title,
  });
  final dynamic title,
      tahunThen,
      tahunNow,
      labelTahunThen,
      labelTahunNow,
      moon2,
      moon1,
      labelMoon1,
      labelMoon2,
      week1,
      week2,
      week3,
      week4,
      labelWeek1,
      labelWeek2,
      labelWeek3,
      labelWeek4;

  @override
  State<ChartProductivity> createState() => _ChartProductivityState();
}

class _ChartProductivityState extends State<ChartProductivity> {
  @override
  Widget build(BuildContext context) {
    return ProductivityContainer(
      proTitle: widget.title,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
          child: Container(
            width: 120,
            height: MediaQuery.of(context).size.height * 0.32,
            child: BarChart(
              data: [widget.tahunThen, widget.tahunNow],
              labels: [widget.labelTahunThen, widget.labelTahunNow],
              labelStyle: TextStyle(fontSize: 18),
              valueStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              displayValue: true,
              reverse: true,
              getColor: Data.getColor,
              getIcon: Data.getIcon,
              barWidth: 45,
              barSeparation: 20,
              animationDuration: Duration(milliseconds: 1000),
              animationCurve: Curves.easeInOutSine,
              itemRadius: 10,
              iconHeight: 24,
              footerHeight: 24,
              headerValueHeight: 16,
              roundValuesOnText: false,
              lineGridColor: light,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 120,
          height: MediaQuery.of(context).size.height * 0.32,
          child: BarChart(
            data: [widget.moon2, widget.moon1],
            labels: [widget.labelMoon2, widget.labelMoon1],
            labelStyle: TextStyle(fontSize: 18),
            valueStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            displayValue: true,
            reverse: true,
            getColor: Data.getColor2,
            getIcon: Data.getIcon,
            barWidth: 45,
            barSeparation: 20,
            animationDuration: Duration(milliseconds: 1000),
            animationCurve: Curves.easeInOutSine,
            itemRadius: 10,
            iconHeight: 24,
            footerHeight: 24,
            headerValueHeight: 16,
            roundValuesOnText: true,
            lineGridColor: light,
          ),
        ),
        const SizedBox(
          width: 80,
        ),
        Container(
          width: 250,
          height: MediaQuery.of(context).size.height * 0.32,
          child: BarChart(
            data: [
              widget.week4,
              widget.week3,
              widget.week2,
              widget.week1,
            ],
            labels: [
              widget.labelWeek4,
              widget.labelWeek3,
              widget.labelWeek2,
              widget.labelWeek1,
            ],
            labelStyle: TextStyle(fontSize: 18),
            valueStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            displayValue: true,
            reverse: true,
            getColor: Data.getColor1,
            getIcon: Data.getIcon,
            barWidth: 45,
            barSeparation: 20,
            animationDuration: Duration(milliseconds: 1000),
            animationCurve: Curves.easeInOutSine,
            itemRadius: 10,
            iconHeight: 24,
            footerHeight: 24,
            headerValueHeight: 16,
            roundValuesOnText: false,
            lineGridColor: light,
          ),
        ),
      ],
    );
  }
}
