import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../../../constants/style.dart';

class Detail4 extends StatefulWidget {
  const Detail4({super.key, this.selectedShift, this.dropdownValue});
  final dynamic selectedShift, dropdownValue;

  @override
  State<Detail4> createState() => _Detail4State();
}

class _Detail4State extends State<Detail4> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.selectedShift == 0 && widget.dropdownValue == 0
            ? FirebaseFirestore.instance
                .collection('product')
                .where("product", isEqualTo: "Filling_Packing_SKM_Sachet")
                .snapshots()
            : widget.selectedShift != 0 && widget.dropdownValue == 0
                ? FirebaseFirestore.instance
                    .collection('product')
                    .where("product", isEqualTo: "Filling_Packing_SKM_Sachet")
                    .where("shift", isEqualTo: widget.selectedShift.toString())
                    .snapshots()
                : widget.selectedShift == 0 && widget.dropdownValue != 0
                    ? FirebaseFirestore.instance
                        .collection('product')
                        .where("product",
                            isEqualTo: "Filling_Packing_SKM_Sachet")
                        .where("line",
                            isEqualTo: widget.dropdownValue.toString())
                        .snapshots()
                    : widget.selectedShift != 0 && widget.dropdownValue != 0
                        ? FirebaseFirestore.instance
                            .collection('product')
                            .where("product",
                                isEqualTo: "Filling_Packing_SKM_Sachet")
                            .where("shift",
                                isEqualTo: widget.selectedShift.toString())
                            .where("line",
                                isEqualTo: widget.dropdownValue.toString())
                            .snapshots()
                        : null,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Text("no Data");
          }
          final doc = snapshot.data.docs;
          var leCuy = List.generate(doc.length, (index) {
            double x = double.parse(doc[index]['le']);
            String z = x.toStringAsFixed(0);
            int a = int.parse(z);

            return a;
          }).fold(0, (p, c) => p + c);
          var lpCuy = List.generate(doc.length, (index) {
            double x = double.parse(doc[index]['lp']);
            String z = x.toStringAsFixed(0);
            int a = int.parse(z);

            return a;
          }).fold(0, (p, c) => p + c);
          var bdCuy = List.generate(doc.length, (index) {
            double x = double.parse(doc[index]['bd']);
            String z = x.toStringAsFixed(0);
            int a = int.parse(z);

            return a;
          }).fold(0, (p, c) => p + c);
          var dtCuy = List.generate(doc.length, (index) {
            double x = double.parse(doc[index]['dt']);
            String z = x.toStringAsFixed(0);
            int a = int.parse(z);

            return a;
          }).fold(0, (p, c) => p + c);

          var actualO = List.generate(doc.length, (index) {
            double x = double.parse(doc[index]['actual_output']);
            String z = x.toStringAsFixed(0);
            int a = int.parse(z);

            return a;
          }).fold(0, (p, c) => p + c);
          var planingO = List.generate(doc.length, (index) {
            double x = double.parse(doc[index]['planing_output']);
            String z = x.toStringAsFixed(0);
            int a = int.parse(z);

            return a;
          }).fold(0, (p, c) => p + c);

          double LeFix = leCuy / doc.length;
          double LpFix = lpCuy / doc.length;
          double dtFix = dtCuy / doc.length;
          double bdFix = bdCuy / doc.length;
          double skm = actualO / planingO;
          double SkmFix = skm * 100;
          double rataRata = actualO / doc.length;
          final rataRataFix = rataRata.toStringAsFixed(3);
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
                            currentValue: SkmFix,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text("$rataRataFix/956")
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
                            progressGradient: LinearGradient(colors: [
                              blue,
                              Color.fromARGB(255, 129, 141, 182)
                            ]),
                            borderRadius: BorderRadius.circular(5),
                            currentValue: LeFix,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(LeFix.toStringAsFixed(3) + "%")
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
                            progressGradient: LinearGradient(colors: [
                              blue,
                              Color.fromARGB(255, 129, 141, 182)
                            ]),
                            borderRadius: BorderRadius.circular(5),
                            currentValue: LpFix,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(LpFix.toStringAsFixed(3) + "%")
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
                            progressGradient: LinearGradient(colors: [
                              blue,
                              Color.fromARGB(255, 129, 141, 182)
                            ]),
                            borderRadius: BorderRadius.circular(5),
                            currentValue: dtFix,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(dtFix.toStringAsFixed(3) + "%")
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
                            progressGradient: LinearGradient(colors: [
                              blue,
                              Color.fromARGB(255, 129, 141, 182)
                            ]),
                            borderRadius: BorderRadius.circular(5),
                            currentValue: bdFix,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(bdFix.toStringAsFixed(3) + "%")
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
                          color: blueLE,
                          borderRadius: BorderRadius.circular(20)),
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
                          color: greenLP,
                          borderRadius: BorderRadius.circular(20)),
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
                          color: redDT,
                          borderRadius: BorderRadius.circular(20)),
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
                          color: orangeBD,
                          borderRadius: BorderRadius.circular(20)),
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
        });
    ;
  }
}
