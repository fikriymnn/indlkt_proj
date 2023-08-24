import 'package:flutter/material.dart';
import 'package:unique_simple_bar_chart/data_models.dart';
import 'package:unique_simple_bar_chart/simple_bar_chart.dart';
import 'package:chart_components/bar_chart_component.dart';
import '../../../constants/style.dart';

class ProductivityContainer extends StatefulWidget {
  final dynamic children;
  const ProductivityContainer({required this.children});

  @override
  State<ProductivityContainer> createState() => _ProductivityContainerState();
}

class _ProductivityContainerState extends State<ProductivityContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 640,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: blue),
      ),
      child: Column(children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: blue),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 45, right: 45, top: 10, bottom: 10),
              child: Text(
                "Product Achievments",
                style: TextStyle(
                    color: light, fontWeight: FontWeight.bold, fontSize: 15),
              ),
            )),
        Container(child: Row(children: widget.children))
      ]),
    );
  }
}
