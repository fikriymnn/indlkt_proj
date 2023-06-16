import 'package:flutter/material.dart';

import '../../../constants/style.dart';

class DashboardContainer extends StatefulWidget {
  final double width;
  final Widget child;
  final double? height;
  const DashboardContainer(
      {super.key, required this.width, required this.child, this.height});

  @override
  State<DashboardContainer> createState() => _DashboardContainerState();
}

class _DashboardContainerState extends State<DashboardContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        // width: 700,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 7,
                offset: Offset(0, 0),
                color: blue.withOpacity(0.6))
          ],
          color: light,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            width: 1,
            color: blue,
          ),
        ),
        child: widget.child);
  }
}
