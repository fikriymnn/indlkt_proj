import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_plus/table_plus.dart';

import '../../../constants/style.dart';
import '../../../widgets/content_detail_form.dart';

class tabel_breakdown extends StatefulWidget {
  const tabel_breakdown({super.key});

  @override
  State<tabel_breakdown> createState() => _tabel_breakdownState();
}

class _tabel_breakdownState extends State<tabel_breakdown> {
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
                Text(objData.mesin),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.reasonBreakdown),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.freq.toString()),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.bdHourMin.toString()),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.bdHour.toString()),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.problem),
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
    tableHeading.add("Mesin");
    tableHeading.add("Reason Breakdown");
    tableHeading.add("Freq");
    tableHeading.add("bdHour (Min)");
    tableHeading.add("BdHour");
    tableHeading.add("Problem");
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
                    index == 0 ? names[i].mesin : names[i].reasonBreakdown;
                Name nameData = names[i];
                if (data.toLowerCase().contains(value.toLowerCase())) {
                  searchList.add(nameData);
                }
              } else if (index == 2) {
                int freq = names[i].freq;
                Name nameData = names[i];
                if (freq.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 3) {
                int bdHourMin = names[i].bdHourMin;
                Name nameData = names[i];
                if (bdHourMin.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 4) {
                int bdHour = names[i].bdHour;
                Name nameData = names[i];
                if (bdHour.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 2) {
                String problem = names[i].problem;
                Name nameData = names[i];
                if (problem.toString().contains(value)) {
                  searchList.add(nameData);
                }
              }
              // String data = index == 0 ? names[i].mesin : names[i].reasonBreakdown;
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
          columnSpacing: MediaQuery.of(context).size.width * 0.06,
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
          mesin: "jhbh",
          reasonBreakdown: "jnk",
          freq: 9,
          bdHourMin: 7687,
          bdHour: 1,
          problem: "jsfbjfjfbjsjfbs"));
}

class Name {
  String mesin;
  String reasonBreakdown;
  int freq;
  int bdHourMin;
  int bdHour;
  String problem;

  Name(
      {required this.mesin,
      required this.reasonBreakdown,
      required this.freq,
      required this.bdHourMin,
      required this.bdHour,
      required this.problem});
}
