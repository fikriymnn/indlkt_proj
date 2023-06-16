import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverviewChart extends StatefulWidget {
  const OverviewChart({super.key});

  @override
  State<OverviewChart> createState() => _OverviewChartState();
}

class _OverviewChartState extends State<OverviewChart> {
  late List<GDPdata> _chartData;
  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        series: <CircularSeries>[
          PieSeries<GDPdata, String>(
              dataSource: _chartData,
              xValueMapper: (GDPdata data, _) => data.continient,
              yValueMapper: (GDPdata data, _) => data.gdp,
              dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  showCumulativeValues: true,
                  overflowMode: OverflowMode.shift))
        ],
        title: ChartTitle(text: 'Sales by sales person'),
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap));
  }

  List<GDPdata> getChartData() {
    final List<GDPdata> chartData = [
      GDPdata("LE", 90000),
      GDPdata("LP", 43220),
      GDPdata("LD", 32210),
      GDPdata("LA", 98300),
      GDPdata("LG", 12390),
    ];

    return chartData;
  }
}

class GDPdata {
  GDPdata(this.continient, this.gdp);
  final String continient;
  final double gdp;
}
