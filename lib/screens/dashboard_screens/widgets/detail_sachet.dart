import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../../../constants/style.dart';

class DetailSacet extends StatefulWidget {
  const DetailSacet({
    super.key,
    required this.Skm,
    required this.Lp,
    required this.Le,
    required this.Dt,
    required this.Bd,
    required this.Ratarata,
  });
  final double Skm, Lp, Le, Dt, Bd, Ratarata;

  @override
  State<DetailSacet> createState() => _DetailSacetState();
}

class _DetailSacetState extends State<DetailSacet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text("Filling Packing SKM Sachet"),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    width: 220,
                    height: 9,
                    child: FAProgressBar(
                      progressGradient: LinearGradient(colors: [
                        Colors.green,
                        Color.fromARGB(255, 164, 219, 166)
                      ]),
                      borderRadius: BorderRadius.circular(5),
                      currentValue: widget.Skm.isNaN ? 0 : widget.Skm * 100,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                      "${widget.Ratarata.isNaN ? "-" : widget.Ratarata.toStringAsFixed(0)}/956")
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("LE"),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    width: 220,
                    height: 9,
                    child: FAProgressBar(
                      progressGradient: LinearGradient(
                          colors: [blue, Color.fromARGB(255, 129, 141, 182)]),
                      borderRadius: BorderRadius.circular(5),
                      currentValue: widget.Le.isNaN ? 0 : widget.Le,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(widget.Le.isNaN
                      ? "-"
                      : widget.Le.toStringAsFixed(3) + "%")
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("LP"),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    width: 220,
                    height: 9,
                    child: FAProgressBar(
                      progressGradient: LinearGradient(
                          colors: [blue, Color.fromARGB(255, 129, 141, 182)]),
                      borderRadius: BorderRadius.circular(5),
                      currentValue: widget.Lp.isNaN ? 0 : widget.Lp,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(widget.Lp.isNaN
                      ? "-"
                      : widget.Lp.toStringAsFixed(3) + "%")
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("DT"),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    width: 220,
                    height: 9,
                    child: FAProgressBar(
                      progressGradient: LinearGradient(
                          colors: [blue, Color.fromARGB(255, 129, 141, 182)]),
                      borderRadius: BorderRadius.circular(5),
                      currentValue: widget.Dt.isNaN ? 0 : widget.Dt,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(widget.Dt.isNaN
                      ? "-"
                      : widget.Dt.toStringAsFixed(3) + "%")
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("BD"),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    width: 220,
                    height: 9,
                    child: FAProgressBar(
                      progressGradient: LinearGradient(
                          colors: [blue, Color.fromARGB(255, 129, 141, 182)]),
                      borderRadius: BorderRadius.circular(5),
                      currentValue: widget.Bd.isNaN ? 0 : widget.Bd,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(widget.Bd.isNaN
                      ? "-"
                      : widget.Bd.toStringAsFixed(3) + "%")
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: blueLE, borderRadius: BorderRadius.circular(20)),
              ),
              Text("LE", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                width: 15,
              ),
              Container(
                margin: EdgeInsets.only(right: 5),
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: greenLP, borderRadius: BorderRadius.circular(20)),
              ),
              Text("LP", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                width: 15,
              ),
              Container(
                margin: EdgeInsets.only(right: 5),
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: redDT, borderRadius: BorderRadius.circular(20)),
              ),
              Text("DT", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                width: 15,
              ),
              Container(
                margin: EdgeInsets.only(right: 5),
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: orangeBD, borderRadius: BorderRadius.circular(20)),
              ),
              Text(
                "BD",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          )
        ],
      ),
    );
  }
}
