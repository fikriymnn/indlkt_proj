import 'package:flutter/material.dart';

import '../../../constants/style.dart';

class DataItem {
  final double value;
  final String label;
  final Color color;
  DataItem(this.value, this.label, this.color);
}

class DonutWidget extends StatelessWidget {
  final List<DataItem> dataset = [
    DataItem(0.25, "filling_packing_skm", active),
    DataItem(0.25, "filling_packing_skm", blue),
    DataItem(0.25, "filling_packing_skm", active),
    DataItem(0.25, "filling_packing_skm", blue)
  ];

  @override
  Widget build(BuildContext context) {
    return DonutButton(dataset);
  }
}

class DonutButton extends StatefulWidget {
  final List<DataItem> dataset;
  DonutButton(this.dataset);

  @override
  State<DonutButton> createState() => _DonutButtonState();
}

class _DonutButtonState extends State<DonutButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        child: Container(),
        painter: DonutChartPainter(widget.dataset),
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  final List<DataItem> dataset;
  DonutChartPainter(this.dataset);
  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2.0, size.height / 2.0);

    var startAngle = 0.0;
    // dataset.forEach((di) {
    //   canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
    // });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
