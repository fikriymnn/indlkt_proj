import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../constants/style.dart';

class DataItem {
  final double value;
  final RichText label;
  final Color color;
  DataItem(this.value, this.label, this.color);
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
        child: Center(
            child: Container(
                width: 80,
                height: 80,
                child: Center(
                    child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Tap here.',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => print('Tap Here onTap'),
                    )
                  ]),
                )))),
        painter: DonutChartPainter(widget.dataset),
      ),
    );
  }
}

final linePaint = Paint()
  ..color = Colors.white
  ..strokeWidth = 3.0
  ..style = PaintingStyle.stroke;
final midPaint = Paint()
  ..color = Colors.white
  ..style = PaintingStyle.fill;
const labelStyle = TextStyle(color: Colors.black, fontSize: 12.0);

class DonutChartPainter extends CustomPainter {
  final List<DataItem> dataset;
  DonutChartPainter(this.dataset);
  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2.0, size.height / 2.0);
    final radius = size.width * 0.8;
    final rect = Rect.fromCenter(center: c, width: radius, height: radius);
    var startAngle = 0.0;
    dataset.forEach((di) {
      double sweepAngle = drawSector(di, canvas, rect, startAngle);
      //draw lines
      drawLine(radius, startAngle, c, canvas);
      startAngle += sweepAngle;
    });
    startAngle = 0.0;
    dataset.forEach((di) {
      double sweepAngle = drawSector(di, canvas, rect, startAngle);
      //draw lines
      drawLine(radius, startAngle, c, canvas);
      startAngle += sweepAngle;
    });
    startAngle = 0.0;
    dataset.forEach((di) {
      double sweepAngle = drawSector(di, canvas, rect, startAngle);
      //draw lines
      drawLabels(radius, startAngle, c, canvas, sweepAngle, di.label);
      startAngle += sweepAngle;
    });
    //draw the middle
    canvas.drawCircle(c, radius * 0.3, midPaint);
  }

  void drawLabels(double radius, double startAngle, Offset c, Canvas canvas,
      double sweepAngle, RichText label) {
    final r = radius * 0.4;
    final dx = r * cos(startAngle + sweepAngle / 2.0);
    final dy = r * sin(startAngle + sweepAngle / 2.0);
    final position = c + Offset(dx, dy);
    drawTextCentered(canvas, position, label, labelStyle, 50.0);
  }

  TextPainter measureText(
      RichText s, TextStyle style, double maxWidth, TextAlign align) {
    final span = TextSpan(text: "test", style: style);
    final tp = TextPainter(
        text: span, textAlign: align, textDirection: TextDirection.ltr);
    tp.layout(minWidth: 0, maxWidth: maxWidth);
    return tp;
  }

  Size drawTextCentered(Canvas canvas, Offset position, RichText text,
      TextStyle style, double maxWidth) {
    final tp = measureText(text, style, maxWidth, TextAlign.center);
    final pos = position + Offset(-tp.width / 2.0, -tp.height / 2.0);

    tp.paint(canvas, pos);
    return tp.size;
  }

  void drawLine(double radius, double startAngle, Offset c, Canvas canvas) {
    final dx = radius / 2.0 * cos(startAngle);
    final dy = radius / 2.0 * sin(startAngle);
    final p2 = c + Offset(dx, dy);
    canvas.drawLine(c, p2, linePaint);
  }

  double drawSector(DataItem di, Canvas canvas, Rect rect, double startAngle) {
    final sweepAngle = di.value * 360.0 * pi / 180.0;
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = di.color;
    canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
    return sweepAngle;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
