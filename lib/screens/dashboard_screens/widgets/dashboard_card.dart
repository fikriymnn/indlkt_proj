import 'package:flutter/material.dart';

import '../../../constants/style.dart';

class DashboardCard extends StatefulWidget {
  final String Product;
  final double LE;
  final double LP;
  final double ProdAcv;
  final double DT;
  final double BD;
  final Color color;

  const DashboardCard(
      {super.key,
      required this.Product,
      required this.LE,
      required this.LP,
      required this.ProdAcv,
      required this.DT,
      required this.BD,
      required this.color});

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 4,
              offset: Offset(4, 0),
              color: dark.withOpacity(0.25))
        ], color: light, borderRadius: BorderRadius.circular(10)),
        height: 185,
        width: 385,
        child: Row(
          children: [
            Container(
              width: 185,
              decoration: BoxDecoration(
                  color: widget.color, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                widget.Product,
                style: TextStyle(
                    color: light, fontWeight: FontWeight.bold, fontSize: 30),
              )),
            ),
            Flexible(
                child: Container(
              width: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 15),
                  Padding(
                      padding: EdgeInsets.only(
                          right: 10, left: 10, bottom: 10, top: 20),
                      child: Row(
                        children: [
                          span("LE ${widget.LE}%"),
                          SizedBox(width: 5),
                          span("LP ${widget.LP}%")
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [span("Prod Acv ${widget.ProdAcv}%")],
                      )),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          span("DT ${widget.DT}"),
                          SizedBox(width: 5),
                          span("DB ${widget.BD}")
                        ],
                      ))
                ],
              ),
            ))
          ],
        ));
  }

  span(textValue) {
    return Container(
      color: light,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 7,
                  offset: Offset(0, 0),
                  color: blue.withOpacity(0.6))
            ], color: blue, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
              child: Text(
                textValue,
                style: TextStyle(color: light),
              ),
            )),
      ),
    );
  }
}
