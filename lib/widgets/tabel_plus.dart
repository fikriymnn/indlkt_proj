import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  //show alert

  // tabel plus
  var searchNameList = <dynamic>[];
  final bool isSearchEnabled = true;
  List<Widget> searchCtrl = <Widget>[];
  List<String> tableHeading = <String>[];

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
                Text(objData.tanggal.toString()),
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
                              child: detail_form()),
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

  @override
  void initState() {
    super.initState();
    searchNameList = names;
    tableHeading.clear();
    tableHeading.add("product");
    tableHeading.add("Departement");
    tableHeading.add("Shift");
    tableHeading.add("Line");
    tableHeading.add("Tanggal");
    tableHeading.add("action");

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
                int shift = names[i].shift;
                Name nameData = names[i];
                if (shift.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 3) {
                int line = names[i].line;
                Name nameData = names[i];
                if (line.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 4) {
                int tanggal = names[i].tanggal;
                Name nameData = names[i];
                if (tanggal.toString().contains(value)) {
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
          columnSpacing: MediaQuery.of(context).size.width * 0.07,
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

  var names = List.generate(
      20,
      (index) => Name(
          product: "jhbh",
          departement: "jnk",
          shift: 9,
          line: 7687,
          tanggal: 10));
}

class Name {
  String product;
  String departement;
  int shift;
  int line;
  int tanggal;

  Name(
      {required this.product,
      required this.departement,
      required this.shift,
      required this.line,
      required this.tanggal});
}
