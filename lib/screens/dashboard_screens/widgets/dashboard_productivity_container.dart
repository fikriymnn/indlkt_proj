import 'package:flutter/material.dart';
import 'package:unique_simple_bar_chart/data_models.dart';
import 'package:unique_simple_bar_chart/simple_bar_chart.dart';

import '../../../constants/style.dart';

class ProductivityContainer extends StatefulWidget {
  const ProductivityContainer({super.key});

  @override
  State<ProductivityContainer> createState() => _ProductivityContainerState();
}

class _ProductivityContainerState extends State<ProductivityContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 500,
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
        Container(
            child: Row(
          children: [
            Container(
              width: 200,
              child: SimpleBarChart(
                makeItDouble: true,
                listOfHorizontalBarData: [
                  HorizontalDetailsModel(
                    name: 'Mon',
                    color: const Color(0xFFEB7735),
                    size: 10,
                  ),
                  HorizontalDetailsModel(
                    name: 'Tues',
                    color: const Color(0xFFEB7735),
                    size: 10,
                  ),
                  HorizontalDetailsModel(
                    name: 'Wed',
                    color: const Color(0xFFFBBC05),
                    size: 10,
                  ),
                  HorizontalDetailsModel(
                    name: 'Wed',
                    color: const Color(0xFFFBBC05),
                    size: 10,
                  ),
                  HorizontalDetailsModel(
                    name: 'Wed',
                    color: const Color(0xFFFBBC05),
                    size: 10,
                  ),
                  HorizontalDetailsModel(
                    name: 'Wed',
                    color: const Color(0xFFFBBC05),
                    size: 10,
                  ),
                  HorizontalDetailsModel(
                    name: 'Wed',
                    color: const Color(0xFFFBBC05),
                    size: 10,
                  ),
                ],
                verticalInterval: 25,
                fullBarChartHeight: 300,
                horizontalBarPadding: 10,
              ),
            ),
          ],
        ))
      ]),
    );
  }
}
