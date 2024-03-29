import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indlkt_proj/widgets/content_idle_time_detail.dart';
import 'package:table_plus/table_plus.dart';

import '../../../constants/style.dart';
import '../../../widgets/content_detail_form.dart';

class tabel_idletime extends StatefulWidget {
  const tabel_idletime({super.key});

  @override
  State<tabel_idletime> createState() => _tabel_idletimeState();
}

class _tabel_idletimeState extends State<tabel_idletime> {
  int selectedIndex = 0;
  final db = FirebaseFirestore.instance;

  //show alert

  // tabel plus
  var searchNameList = <dynamic>[];
  List dataIdle = [];
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
                Text(objData.idleDesc),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.idleMin),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.idleHour.toString()),
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
                              child: idletime_detail(
                                date: objData.date,
                                departement: objData.departement,
                                idleDesc: objData.idleDesc,
                                idleHour: objData.idleHour,
                                idleMin: objData.idleMin,
                                line: objData.line,
                                product: objData.product,
                                name: objData.name,
                                nik: objData.nik,
                                shift: objData.shift,
                              )),
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
    QuerySnapshot querySnapshot = await db
        .collection("idle_time")
        .orderBy("createdAt", descending: true)
        .get();
    setState(() {
      dataIdle = querySnapshot.docs.map((doc) => doc.data()).toList();
    });

    getData2();
  }

  getData2() {
    names = List.generate(
        dataIdle.length,
        (index) => Name(
            date:
                dataIdle[index]["date"] == null ? "-" : dataIdle[index]["date"],
            product: dataIdle[index]["product"] == null
                ? "-"
                : dataIdle[index]["product"],
            departement: dataIdle[index]["departement"] == null
                ? "-"
                : dataIdle[index]["departement"],
            shift: dataIdle[index]["shift"] == null
                ? "-"
                : dataIdle[index]["shift"],
            line:
                dataIdle[index]["line"] == null ? "-" : dataIdle[index]["line"],
            idleDesc: dataIdle[index]["idleDesc"] == null
                ? "-"
                : dataIdle[index]["idleDesc"],
            idleMin: dataIdle[index]["idleMin"] == null
                ? "-"
                : dataIdle[index]["idleMin"],
            idleHour: dataIdle[index]["idleHour"] == null
                ? "-"
                : dataIdle[index]["idleHour"],
            name:
                dataIdle[index]["name"] == null ? "-" : dataIdle[index]["name"],
            nik:
                dataIdle[index]["nik"] == null ? "-" : dataIdle[index]["nik"]));

    setState(() {
      searchNameList = names;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    tableHeading.clear();
    tableHeading.add("Idle Desc");
    tableHeading.add("Idle(Min)");
    tableHeading.add("idleHour");

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
                String data = index == 0 ? names[i].idleDesc : names[i].idleMin;
                Name nameData = names[i];
                if (data.toLowerCase().contains(value.toLowerCase())) {
                  searchList.add(nameData);
                }
              } else if (index == 2) {
                String idleDesc = names[i].idleDesc;
                Name nameData = names[i];
                if (idleDesc.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 2) {
                String idleMin = names[i].idleMin;
                Name nameData = names[i];
                if (idleMin.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 2) {
                String idleHour = names[i].idleHour;
                Name nameData = names[i];
                if (idleHour.toString().contains(value)) {
                  searchList.add(nameData);
                }
              }
              // String data = index == 0 ? names[i].dt : names[i].idleMin;
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
          columnSpacing: MediaQuery.of(context).size.width * 0.16,
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
  String idleDesc;
  String idleMin;
  String idleHour;
  dynamic name, nik;

  Name({
    required this.date,
    required this.product,
    required this.departement,
    required this.shift,
    required this.line,
    required this.idleDesc,
    required this.idleMin,
    required this.nik,
    required this.name,
    required this.idleHour,
  });
}
