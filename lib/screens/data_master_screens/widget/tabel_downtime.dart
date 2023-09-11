import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indlkt_proj/widgets/content_downtime_detail.dart';
import 'package:table_plus/table_plus.dart';

import '../../../constants/style.dart';
import '../../../widgets/content_detail_form.dart';

class tabel_downtime extends StatefulWidget {
  const tabel_downtime({super.key});

  @override
  State<tabel_downtime> createState() => _tabel_downtimeState();
}

class _tabel_downtimeState extends State<tabel_downtime> {
  int selectedIndex = 0;

  //show alert
  List dataDowntime = [];
  // tabel plus
  var searchNameList = <dynamic>[];
  final bool isSearchEnabled = true;
  List<Widget> searchCtrl = <Widget>[];
  List<String> tableHeading = <String>[];
  var names = [];

  List<DataColumn> dataColumnValues() {
    List<DataColumn> values = <DataColumn>[];
    for (var i = 0; i < tableHeading.length; i++) {
      values.add(DataColumn(
        label: Container(
          margin: isSearchEnabled
              ? const EdgeInsets.only(top: 25.0, bottom: 20.0)
              : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                tableHeading[i],
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              isSearchEnabled ? searchCtrl[i] : Container(),
            ],
          ),
        ),
        numeric: false,
      ));
    }
    return values;
  }

  List<DataRow> dataRowsValues() {
    return searchNameList
        .map(
          (objData) => DataRow(
            cells: [
              DataCell(
                Text(objData.dt),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.subDt),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.STD.toString()),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.actMin.toString()),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.actHour.toString()),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        content: Padding(
                          padding: const EdgeInsets.only(
                              top: 85, right: 55, left: 38),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: downtimeDetail(
                                  shift: objData.shift,
                                  departement: objData.departement,
                                  product: objData.product,
                                  line: objData.line,
                                  date: objData.date,
                                  actMin: objData.actMin,
                                  actHour: objData.actHour,
                                  std: objData.STD,
                                  subDt: objData.subDt,
                                  dt: objData.dt)),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1, offset: Offset(0, 0), color: blue)
                        ],
                        border: Border.all(
                          color: blue,
                        ),
                        color: selectedIndex == 4
                            ? Color.fromARGB(255, 195, 225, 250)
                            : blue,
                        borderRadius: BorderRadius.circular(5)),
                    width: 78,
                    height: 36,
                    child: Center(
                        child: Text(
                      "Detail",
                      style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.displayMedium,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: selectedIndex == 4 ? dark : light),
                    ))),
              ))
            ],
          ),
        )
        .toList();
  }

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("downtime")
        .orderBy("createdAt", descending: true)
        .get();
    setState(() {
      dataDowntime = querySnapshot.docs.map((doc) => doc.data()).toList();
    });

    getData2();
  }

  getData2() {
    names = List.generate(
        dataDowntime.length,
        (index) => Name(
            date: dataDowntime[index]["date"] == null
                ? "-"
                : dataDowntime[index]["date"],
            product: dataDowntime[index]["product"] == null
                ? "-"
                : dataDowntime[index]["product"],
            departement: dataDowntime[index]["departement"] == null
                ? "-"
                : dataDowntime[index]["departement"],
            shift: dataDowntime[index]["shift"] == null
                ? "-"
                : dataDowntime[index]["shift"],
            line: dataDowntime[index]["line"] == null
                ? "-"
                : dataDowntime[index]["line"],
            dt: dataDowntime[index]["dt"] == null
                ? "-"
                : dataDowntime[index]["dt"],
            subDt: dataDowntime[index]["subDt"] == null
                ? "-"
                : dataDowntime[index]["subDt"],
            STD: dataDowntime[index]["std"] == null
                ? "-"
                : dataDowntime[index]["std"],
            actMin: dataDowntime[index]["actMin"] == null
                ? "-"
                : dataDowntime[index]["actMin"],
            actHour: dataDowntime[index]["actHour"] == null
                ? "-"
                : dataDowntime[index]["actHour"]));

    setState(() {
      searchNameList = names;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    tableHeading.clear();
    tableHeading.add("Dt");
    tableHeading.add("Reason Breakdown");
    tableHeading.add("STD");
    tableHeading.add("Act (Min)");
    tableHeading.add("actHour");

    tableHeading.add("Action");

    for (var index = 0; index < tableHeading.length; index++) {
      searchCtrl.add(CustomSearchTextFieldWidget(
        onChangedFunctions:
            (String value, TextEditingController controller, int position) {
          List<dynamic> searchList = <dynamic>[];

          if (value.isNotEmpty) {
            searchList.clear();
            for (int i = 0; i < names.length; i++) {
              if (index == 0 || index == 1) {
                String data = index == 0 ? names[i].dt : names[i].subDt;
                Name nameData = names[i];
                if (data.toLowerCase().contains(value.toLowerCase())) {
                  searchList.add(nameData);
                }
              } else if (index == 2) {
                String STD = names[i].STD;
                Name nameData = names[i];
                if (STD.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 3) {
                String actMin = names[i].actMin;
                Name nameData = names[i];
                if (actMin.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 4) {
                String actHour = names[i].actHour;
                Name nameData = names[i];
                if (actHour.toString().contains(value)) {
                  searchList.add(nameData);
                }
              }
              // String data = index == 0 ? names[i].dt : names[i].subDt;
              // Name nameData = names[i];
              // if (data.toLowerCase().contains(value.toLowerCase())) {
              //   searchList.add(nameData);
              // }
            }
            setState(() {
              searchNameList = searchList;
            });
          } else {
            setState(() {
              searchNameList = names;
            });
          }
        },
        index: index,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: TablePlus(
          exportFileName: "MyTableFile",
          tabelHeadingList: tableHeading,
          isExportCSVEnabled: false,
          columnSpacing: MediaQuery.of(context).size.width * 0.08,
          sortColumnIndex: 1,
          isSearchEnabled: isSearchEnabled,
          rows: dataRowsValues(),
          columns: dataColumnValues(),
          dataValues: names,
          shareWidget: Container(),
        ),
      ),
    );
  }
}

class Name {
  String date, product, departement, shift, line;
  String dt;
  String subDt;
  String STD;
  String actMin;
  String actHour;

  Name({
    required this.date,
    required this.product,
    required this.departement,
    required this.shift,
    required this.line,
    required this.dt,
    required this.subDt,
    required this.STD,
    required this.actMin,
    required this.actHour,
  });
}
