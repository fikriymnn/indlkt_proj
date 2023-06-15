import 'package:flutter/material.dart';

import '../constants/style.dart';

class CustomContainer extends StatefulWidget {
  final Widget child;
  const CustomContainer({super.key, required this.child});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 4, offset: Offset(4, 0), color: dark.withOpacity(0.4))
      ], color: light, borderRadius: BorderRadius.circular(10)),
      child: widget.child,
    );
  }
}
