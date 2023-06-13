import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class CircularMarquee extends StatelessWidget implements Text {
  const CircularMarquee({super.key});

  @override
  Widget build(BuildContext context) {
    return Marquee(
      text: 'Some sample text that takes some space.',
      style: TextStyle(fontWeight: FontWeight.bold),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 20.0,
      velocity: 100.0,
      pauseAfterRound: Duration(seconds: 1),
      startPadding: 10.0,
      accelerationDuration: Duration(seconds: 1),
      accelerationCurve: Curves.linear,
      decelerationDuration: Duration(milliseconds: 500),
      decelerationCurve: Curves.easeOut,
    );
  }

  @override
  // TODO: implement data
  String? get data => throw UnimplementedError();

  @override
  // TODO: implement locale
  Locale? get locale => throw UnimplementedError();

  @override
  // TODO: implement maxLines
  int? get maxLines => throw UnimplementedError();

  @override
  // TODO: implement overflow
  TextOverflow? get overflow => throw UnimplementedError();

  @override
  // TODO: implement selectionColor
  Color? get selectionColor => throw UnimplementedError();

  @override
  // TODO: implement semanticsLabel
  String? get semanticsLabel => throw UnimplementedError();

  @override
  // TODO: implement softWrap
  bool? get softWrap => throw UnimplementedError();

  @override
  // TODO: implement strutStyle
  StrutStyle? get strutStyle => throw UnimplementedError();

  @override
  // TODO: implement style
  TextStyle? get style => throw UnimplementedError();

  @override
  // TODO: implement textAlign
  TextAlign? get textAlign => throw UnimplementedError();

  @override
  // TODO: implement textDirection
  TextDirection? get textDirection => throw UnimplementedError();

  @override
  // TODO: implement textHeightBehavior
  TextHeightBehavior? get textHeightBehavior => throw UnimplementedError();

  @override
  // TODO: implement textScaleFactor
  double? get textScaleFactor => throw UnimplementedError();

  @override
  // TODO: implement textSpan
  InlineSpan? get textSpan => throw UnimplementedError();

  @override
  // TODO: implement textWidthBasis
  TextWidthBasis? get textWidthBasis => throw UnimplementedError();
}
