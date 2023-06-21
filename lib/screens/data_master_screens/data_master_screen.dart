import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:table_plus/table_plus.dart';

import '../../constants/style.dart';
import '../../widgets/appbar.dart';
import '../../widgets/custom_container.dart';
import '../dashboard_screens/dashboard_overview_screen.dart';
import '../dashboard_screens/dashboard_productivity_screen.dart';

class DataMasterScreen extends StatefulWidget {
  const DataMasterScreen({super.key});

  @override
  State<DataMasterScreen> createState() => _DataMasterScreenState();
}

class _DataMasterScreenState extends State<DataMasterScreen> {
  int selectedIndex = 0;
  final List screens = [
    DashboardOverview(),
    DashboardProductivity(),
  ];
  // TextEditingController search = TextEditingController();
  // late PlutoGridStateManager stateManager;

  // final List<PlutoColumn> columns = [
  //   PlutoColumn(
  //       title: 'Column1',
  //       field: 'column_1',
  //       type: PlutoColumnType.text(),
  //       enableSorting: true),
  //   PlutoColumn(
  //     title: 'Column2',
  //     field: 'column_2',
  //     type: PlutoColumnType.text(),
  //   ),
  //   PlutoColumn(
  //     title: 'Column3',
  //     field: 'column_3',
  //     type: PlutoColumnType.text(),
  //   ),
  // ];

  // final List<PlutoRow> rows = [
  //   PlutoRow(
  //     cells: {
  //       'column_1': PlutoCell(value: 'cell 1-1'),
  //       'column_2': PlutoCell(value: 'cell 1-2'),
  //       'column_3': PlutoCell(value: 'cell 1-3'),
  //     },
  //   ),
  //   PlutoRow(
  //     cells: {
  //       'column_1': PlutoCell(value: 'cell 2-1'),
  //       'column_2': PlutoCell(value: 'cell 2-2'),
  //       'column_3': PlutoCell(value: 'cell 2-3'),
  //     },
  //   ),
  //   PlutoRow(
  //     cells: {
  //       'column_1': PlutoCell(value: 'cell 3-1'),
  //       'column_2': PlutoCell(value: 'cell 3-2'),
  //       'column_3':
  //           PlutoCell(value: InkWell(onTap: () {}, child: Text('hoam'))),
  //     },
  //   ),
  // ];

//table plus
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
              isSearchEnabled
                  ? searchCtrl[i]
                  : Container(
                      height: 25,
                      width: 135,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 212, 212, 212),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 3, bottom: 3, right: 10),
                        child: TextField(
                            decoration: InputDecoration.collapsed(
                          hintText: "search",
                        )),
                      ),
                    ),
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
                  setState(() {});
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
                int line = names[i].line;
                Name nameData = names[i];
                if (line.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 3) {
                int shift = names[i].shift;
                Name nameData = names[i];
                if (shift.toString().contains(value)) {
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
    return Scaffold(
      appBar: CustomAppBar(
        title: "Data Master",
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Image(
                      width: 200,
                      image: AssetImage("assets/images/circle_bg.png"))),
              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  child: Image(
                      width: 200,
                      image: AssetImage("assets/images/circle_bg2.png"))),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 40, top: 20),
                //   child: Text('Data Master',
                //       style: TextStyle(
                //           color: blue,
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold)),
                // ),
                Padding(
                  padding: const EdgeInsets.only(right: 281, top: 35),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          child: Container(
                              margin: EdgeInsets.only(
                                  right: 5, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  color: active,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4,
                                        offset: Offset(0, 0),
                                        color: active)
                                  ],
                                  border: Border.all(
                                    color: red,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              width: 150,
                              height: 35,
                              padding: EdgeInsets.all(5),
                              child: Center(
                                  child: Row(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 9),
                                      child: Icon(
                                        Icons.download,
                                        color: light,
                                        size: 17,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Unduh Data",
                                    style: GoogleFonts.montserrat(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                        fontSize: 15,
                                        color: light),
                                  ),
                                ],
                              ))),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: CustomContainer(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(left: 0, top: 10),
                          child: Container(
                            margin: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.width * 0.028),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Container(
                                    child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = 0;
                                        });
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              right: 5, top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 4,
                                                    offset: Offset(0, 0),
                                                    color:
                                                        dark.withOpacity(0.65))
                                              ],
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 2, 57, 101),
                                              ),
                                              color: selectedIndex == 0
                                                  ? Color.fromARGB(
                                                      255, 195, 225, 250)
                                                  : blue,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: 79,
                                          height: 38,
                                          padding: EdgeInsets.all(5),
                                          child: Center(
                                              child: Text(
                                            "Data Shift",
                                            style: GoogleFonts.montserrat(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium,
                                                fontSize: 10,
                                                color: selectedIndex == 0
                                                    ? dark
                                                    : light),
                                          ))),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = 1;
                                        });
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              right: 5, top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 4,
                                                    offset: Offset(0, 0),
                                                    color:
                                                        dark.withOpacity(0.65))
                                              ],
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 2, 57, 101),
                                              ),
                                              color: selectedIndex == 1
                                                  ? Color.fromARGB(
                                                      255, 195, 225, 250)
                                                  : blue,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: 144,
                                          height: 38,
                                          padding: EdgeInsets.all(5),
                                          child: Center(
                                              child: Text(
                                            "Data Breakdown",
                                            style: GoogleFonts.montserrat(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium,
                                                fontSize: 10,
                                                color: selectedIndex == 1
                                                    ? dark
                                                    : light),
                                          ))),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = 2;
                                        });
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              right: 5, top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 4,
                                                    offset: Offset(0, 0),
                                                    color:
                                                        dark.withOpacity(0.65))
                                              ],
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 2, 57, 101),
                                              ),
                                              color: selectedIndex == 2
                                                  ? Color.fromARGB(
                                                      255, 195, 225, 250)
                                                  : blue,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: 144,
                                          height: 38,
                                          padding: EdgeInsets.all(5),
                                          child: Center(
                                              child: Text(
                                            "Data Down Time",
                                            style: GoogleFonts.montserrat(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium,
                                                fontSize: 10,
                                                color: selectedIndex == 2
                                                    ? dark
                                                    : light),
                                          ))),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = 3;
                                        });
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              right: 5, top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 4,
                                                    offset: Offset(0, 0),
                                                    color:
                                                        dark.withOpacity(0.65))
                                              ],
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 2, 57, 101),
                                              ),
                                              color: selectedIndex == 3
                                                  ? Color.fromARGB(
                                                      255, 195, 225, 250)
                                                  : blue,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: 100,
                                          height: 38,
                                          padding: EdgeInsets.all(5),
                                          child: Center(
                                              child: Text(
                                            "Data Idle Time",
                                            style: GoogleFonts.montserrat(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium,
                                                fontSize: 10,
                                                color: selectedIndex == 3
                                                    ? dark
                                                    : light),
                                          ))),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = 4;
                                        });
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              right: 5, top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 4,
                                                    offset: Offset(0, 0),
                                                    color:
                                                        dark.withOpacity(0.65))
                                              ],
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 2, 57, 101),
                                              ),
                                              color: selectedIndex == 4
                                                  ? Color.fromARGB(
                                                      255, 195, 225, 250)
                                                  : blue,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: 66,
                                          height: 38,
                                          padding: EdgeInsets.all(5),
                                          child: Center(
                                              child: Text(
                                            "All Data",
                                            style: GoogleFonts.montserrat(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium,
                                                fontSize: 10,
                                                color: selectedIndex == 4
                                                    ? dark
                                                    : light),
                                          ))),
                                    )
                                  ],
                                )),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Flexible(
                      //   child: PlutoGrid(
                      //     columns: columns,
                      //     rows: rows,
                      //   ),
                      // ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: TablePlus(
                            exportFileName: "MyTableFile",
                            tabelHeadingList: tableHeading,
                            isExportCSVEnabled: false,
                            columnSpacing: 100,
                            sortColumnIndex: 1,
                            isSearchEnabled: isSearchEnabled,
                            rows: dataRowsValues(),
                            columns: dataColumnValues(),
                            dataValues: names,
                            shareWidget: Container(),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  var names = List.generate(
      4,
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
