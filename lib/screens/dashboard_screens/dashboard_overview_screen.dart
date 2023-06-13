import 'package:flutter/material.dart';
import 'package:indlkt_proj/constants/style.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_card.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_container.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_overview_breakdown.dart';

class DashboardOverview extends StatefulWidget {
  const DashboardOverview({super.key});

  @override
  State<DashboardOverview> createState() => _DashboardOverviewState();
}

class _DashboardOverviewState extends State<DashboardOverview> {
  int dropdownValue = 1;
  String timeText = "";
  String dateText = "";

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DashboardCard(
                color: active,
                Product: "SKM",
                LE: 9.2,
                LP: 9.2,
                ProdAcv: 9.2,
                DT: 9.2,
                BD: 9.2),
            SizedBox(width: width * 0.042),
            DashboardCard(
                color: Color(0xff2BB8C1),
                Product: "UHT",
                LE: 9.2,
                LP: 9.2,
                ProdAcv: 9.2,
                DT: 9.2,
                BD: 9.2),
            SizedBox(width: width * 0.042),
            DashboardCard(
                color: Color(0xff50E279),
                Product: "Factory",
                LE: 9.2,
                LP: 9.2,
                ProdAcv: 9.2,
                DT: 9.2,
                BD: 9.2)
          ],
        ),
        SizedBox(height: 15),
        Container(
          child: InkWell(
            onTap: () async {
              await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000));
            },
            child: Text(
                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardContainer(
                width: 700,
                height: 400,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Pencapaian dan Performa",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Shift"),
                                  Row(children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: light,
                                            border: Border.all(),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                topLeft: Radius.circular(10))),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: 8,
                                              left: 8,
                                              top: 1.5,
                                              bottom: 1.5),
                                          child: Text("1",
                                              style: TextStyle(color: dark)),
                                        )),
                                    Container(
                                        decoration: BoxDecoration(
                                          color: blue,
                                          border: Border.all(),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: 8,
                                              left: 8,
                                              top: 1.5,
                                              bottom: 1.5),
                                          child: Text("2",
                                              style: TextStyle(color: light)),
                                        )),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: blue,
                                            border: Border.all(),
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10),
                                                topRight: Radius.circular(10))),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: 8,
                                              left: 8,
                                              top: 1.5,
                                              bottom: 1.5),
                                          child: Text(
                                            "3",
                                            style: TextStyle(color: light),
                                          ),
                                        ))
                                  ]),
                                ],
                              ),
                              SizedBox(width: 10),
                              Container(
                                  decoration: BoxDecoration(
                                    color: blue,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 4,
                                          offset: Offset(0, 0),
                                          color: dark.withOpacity(0.4))
                                    ],
                                    border: Border.all(width: 1, color: dark),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2, bottom: 2, right: 4, left: 4),
                                    child: Text("all shift",
                                        style: TextStyle(color: light)),
                                  )),
                              SizedBox(width: 15),
                              Column(
                                children: [
                                  Text("Line"),
                                  Container(
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: light,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            offset: Offset(0, 0),
                                            color: dark.withOpacity(0.4))
                                      ],
                                      border: Border.all(width: 1, color: blue),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: DropdownButton(
                                          underline: Container(),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          value: dropdownValue,
                                          onChanged: (e) {
                                            setState(() {
                                              dropdownValue = e!;
                                            });
                                          },
                                          items: [
                                            DropdownMenuItem(
                                              child: Text("1"),
                                              value: 1,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("2"),
                                              value: 2,
                                            ),
                                            DropdownMenuItem(
                                              child: Text("3"),
                                              value: 3,
                                            )
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ],
                    ),
                    SizedBox(width: 310),
                    Image(
                      image: AssetImage("assets/images/gears.png"),
                      width: 100,
                    ),
                  ],
                )),
            SizedBox(width: 12),
            DashboardContainer(
                height: 400,
                width: 375,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "TOP 5 BREAKDOWN MESIN",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return BreakdownItem();
                        })
                  ],
                ))
          ],
        )
      ],
    );
  }
}
