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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('hao'),
                              Text('hao'),
                              Text('hao'),
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
                    BreakdownItem(),
                    BreakdownItem(),
                    BreakdownItem(),
                    BreakdownItem(),
                    BreakdownItem(),
                  ],
                ))
          ],
        )
      ],
    );
  }
}
