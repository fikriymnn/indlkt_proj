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
    double mediaQuery = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
      child: Container(
          margin: EdgeInsets.only(left: mediaQuery * 0.028),
          width: mediaQuery * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 0),
                color: dark.withOpacity(0.4))
          ], color: light, borderRadius: BorderRadius.circular(20)),
          child: widget.child),
    );
  }
}
