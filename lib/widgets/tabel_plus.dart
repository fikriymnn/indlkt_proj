import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indlkt_proj/screens/product_acv_screens/product_acv_form_edit.dart';
import 'package:table_plus/table_plus.dart';

import '../constants/style.dart';
import 'content_detail_form.dart';
import '../screens/product_acv_screens/product_acv_form.dart';

class tabel_plus extends StatefulWidget {
  const tabel_plus({super.key});

  @override
  State<tabel_plus> createState() => _tabel_plusState();
}

class _tabel_plusState extends State<tabel_plus> {
  int selectedIndex = 0;
  final db = FirebaseFirestore.instance;

  //show alert

  // tabel plus
  var searchNameList = <dynamic>[];
  // var dataaa = <dynamic>[];

  List dataProduct = [];

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
                Text(objData.product),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.departement),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.shift.toString()),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.line.toString()),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.date.toString()),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(Row(
                children: [
                  InkWell(
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
                                  child: detail_form(
                                    shift: objData.shift,
                                    departement: objData.departement,
                                    product: objData.product,
                                    line: objData.line,
                                    planingOutput: objData.planingOutput,
                                    actualOutput: objData.actualOutput,
                                    nominalSpeed: objData.nominalSpeed,
                                    totalHour: objData.totalHour,
                                    grossHour: objData.grossHour,
                                    netHour: objData.netHour,
                                    targetHout: objData.targetHour,
                                    le: objData.Le,
                                    lp: objData.Lp,
                                    bd: objData.Bd,
                                    dt: objData.Dt,
                                    date: objData.date,
                                    id: objData.id,
                                  )),
                            ),
                          );
                          ;
                        },
                      );
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(0, 0),
                                  color: blue)
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
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: selectedIndex == 4 ? dark : light),
                        ))),
                  ),
                  InkWell(
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
                                  child: FormEditData(
                                    shift: objData.shift,
                                    departement: objData.departement,
                                    product: objData.product,
                                    line: objData.line,
                                    planingOutput: objData.planingOutput,
                                    actualOutput: objData.actualOutput,
                                    nominalSpeed: objData.nominalSpeed,
                                    totalHour: objData.totalHour,
                                    grossHour: objData.grossHour,
                                    netHour: objData.netHour,
                                    targetHout: objData.targetHour,
                                    le: objData.Le,
                                    lp: objData.Lp,
                                    bd: objData.Bd,
                                    dt: objData.Dt,
                                    date: objData.date,
                                    id: objData.id,
                                  )),
                            ),
                          );
                          ;
                        },
                      );
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(0, 0),
                                  color: blue)
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
                          "Edit",
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: selectedIndex == 4 ? dark : light),
                        ))),
                  ),
                ],
              ))
            ],
          ),
        )
        .toList();
  }

  getData() async {
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .orderBy("createdAt", descending: true)
        .get();
    setState(() {
      dataProduct = querySnapshot.docs.map((doc) => doc.data()).toList();
    });

    getData2();
  }

  getData2() {
    names = List.generate(
        dataProduct.length,
        (index) => Name(
            product: dataProduct[index]["product"] == null
                ? "-"
                : dataProduct[index]["product"],
            departement: dataProduct[index]["departement"] == null
                ? "-"
                : dataProduct[index]["departement"],
            shift: dataProduct[index]["shift"] == null
                ? "-"
                : dataProduct[index]["shift"],
            line: dataProduct[index]["line"] == null
                ? "-"
                : dataProduct[index]["line"],
            date: dataProduct[index]["date"] == null
                ? "-"
                : dataProduct[index]["date"],
            Bd: dataProduct[index]["bd"] == null
                ? "-"
                : dataProduct[index]["bd"],
            Dt: dataProduct[index]["dt"] == null
                ? "-"
                : dataProduct[index]["dt"],
            Le: dataProduct[index]["le"] == null
                ? "-"
                : dataProduct[index]["le"],
            Lp: dataProduct[index]["lp"] == null
                ? "-"
                : dataProduct[index]["lp"],
            actualOutput: dataProduct[index]["actual_output"] == null
                ? "-"
                : dataProduct[index]["actual_output"],
            grossHour: dataProduct[index]["gross_hour"] == null
                ? "-"
                : dataProduct[index]["gross_hour"],
            netHour: dataProduct[index]["net_hour"] == null
                ? "-"
                : dataProduct[index]["net_hour"],
            nominalSpeed: dataProduct[index]["nominal_speed"] == null
                ? "-"
                : dataProduct[index]["nominal_speed"],
            planingOutput: dataProduct[index]["planing_output"] == null
                ? "-"
                : dataProduct[index]["planing_output"],
            targetHour: dataProduct[index]["target_hour"] == null
                ? "-"
                : dataProduct[index]["target_hour"],
            totalHour: dataProduct[index]["total_hour"] == null
                ? "-"
                : dataProduct[index]["total_hour"],
            id: dataProduct[index]["uid"] == null
                ? "-"
                : dataProduct[index]["uid"]));

    setState(() {
      searchNameList = names;
    });
  }

  @override
  void initState() {
    getData();

    super.initState();

    tableHeading.clear();
    tableHeading.add("product");
    tableHeading.add("Departement");
    tableHeading.add("Shift");
    tableHeading.add("Line");
    tableHeading.add("Date");
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
                String data =
                    index == 0 ? names[i].product : names[i].departement;
                Name nameData = names[i];
                if (data.toLowerCase().contains(value.toLowerCase())) {
                  searchList.add(nameData);
                }
              } else if (index == 2) {
                String shift = names[i].shift;
                Name nameData = names[i];
                if (shift.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 3) {
                String line = names[i].line;
                Name nameData = names[i];
                if (line.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 4) {
                String date = names[i].date;
                Name nameData = names[i];
                if (date.toString().contains(value)) {
                  searchList.add(nameData);
                }
              }
              // String data = index == 0 ? names[i].product : names[i].departement;
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
  String product;
  String departement;
  String shift;
  String line;
  String date;
  String planingOutput,
      actualOutput,
      nominalSpeed,
      totalHour,
      grossHour,
      netHour,
      targetHour,
      Le,
      Lp,
      Dt,
      Bd,
      id;

  Name(
      {required this.product,
      required this.departement,
      required this.shift,
      required this.line,
      required this.date,
      required this.Bd,
      required this.Dt,
      required this.Le,
      required this.Lp,
      required this.actualOutput,
      required this.grossHour,
      required this.netHour,
      required this.nominalSpeed,
      required this.planingOutput,
      required this.targetHour,
      required this.totalHour,
      required this.id});
}
