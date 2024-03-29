import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class RadialBar extends StatefulWidget {
  final List<ChartData> chartData;
  RadialBar({super.key, required this.chartData});

  @override
  State<RadialBar> createState() => _RadialBarState();
}

class _RadialBarState extends State<RadialBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 145,
      height: 145,
      child: SfCircularChart(series: <CircularSeries>[
        // Renders radial bar chart
        RadialBarSeries<ChartData, String>(
            pointColorMapper: (ChartData data, _) => data.color,
            radius: '100%',
            dataSource: widget.chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y)
      ]),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final dynamic x;
  final double y;
  final Color color;
}
