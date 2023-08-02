import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:pluto_grid_export/pluto_grid_export.dart' as pluto_grid_export;
import 'package:file_saver/file_saver.dart';
import 'package:flutter/services.dart';

import '../../../constants/style.dart';

class exportPage extends StatefulWidget {
  const exportPage({super.key});

  @override
  State<exportPage> createState() => _exportPageState();
}

class _exportPageState extends State<exportPage> {
  int selectedIndex = 0;
  late PlutoGridStateManager stateManager;
  String tes = "";

  final List<PlutoColumn> columns = [
    PlutoColumn(
        title: 'No',
        field: 'no',
        type: PlutoColumnType.text(),
        enableSorting: true,
        width: 60),
    PlutoColumn(
        title: 'Date',
        field: 'date',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
        title: 'Product',
        field: 'product',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
      title: 'Departement',
      field: 'departement',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
        title: 'Shift',
        field: 'shift',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
        title: 'Line',
        field: 'line',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
        title: 'Planing Output',
        field: 'planing',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
        title: 'Actual Output',
        field: 'actual',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
        title: 'Nominal Speed',
        field: 'nominal',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
        title: 'Total Hour',
        field: 'total',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
        title: 'Gross Hour',
        field: 'gross',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
        title: 'Net Hour',
        field: 'net',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
        title: 'Target Hour',
        field: 'target',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
        title: 'LE',
        field: 'le',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
        title: 'LP',
        field: 'lp',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
        title: 'DT',
        field: 'dt',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
        title: 'BD',
        field: 'bd',
        type: PlutoColumnType.text(),
        enableSorting: true),
  ];

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
  //       'column_3': PlutoCell(value: 'hehe'),
  //     },
  //   ),
  // ];

  void exportToCsv() async {
    String title = "pluto_grid_export";

    var exported = const Utf8Encoder()
        .convert(pluto_grid_export.PlutoGridExport.exportCSV(stateManager));

    // use file_saver from pub.dev
    await FileSaver.instance.saveFile("$title.csv", exported, ".csv");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: exportToCsv,
          child: Container(
              margin: EdgeInsets.only(right: 5, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: active,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4, offset: Offset(0, 0), color: active)
                  ],
                  border: Border.all(
                    color: red,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              width: 170,
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
                    "Download Data",
                    style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 15,
                        color: light),
                  ),
                ],
              ))),
        ),

        // Container(
        //   alignment: Alignment.topRight,
        //   child: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: const Icon(
        //       Icons.cancel_outlined,
        //       color: Colors.red,
        //       size: 48,
        //     ),

        //   ),

        // ),
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 10),
          child: Text(' select data from table',
              style: TextStyle(
                  color: dark, fontSize: 15, fontWeight: FontWeight.bold)),
        ),
        Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("product")
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return PlutoGrid(
                      columns: columns,
                      rows: List.generate(
                        snapshot.data.docs.length,
                        (index) => PlutoRow(
                          cells: {
                            'no': PlutoCell(value: index + 1),
                            'date': PlutoCell(
                                value: snapshot.data.docs[index]['date']),
                            'product': PlutoCell(
                                value: snapshot.data.docs[index]['product']),
                            'departement': PlutoCell(
                                value: snapshot.data.docs[index]
                                    ['departement']),
                            'shift': PlutoCell(
                                value: snapshot.data.docs[index]['shift']),
                            'line': PlutoCell(
                                value: snapshot.data.docs[index]['line']),
                            'planing': PlutoCell(
                                value: snapshot.data.docs[index]
                                    ['planing_output']),
                            'actual': PlutoCell(
                                value: snapshot.data.docs[index]
                                    ['actual_output']),
                            'nominal': PlutoCell(
                                value: snapshot.data.docs[index]
                                    ['nominal_speed']),
                            'total': PlutoCell(
                                value: snapshot.data.docs[index]['total_hour']),
                            'gross': PlutoCell(
                                value: snapshot.data.docs[index]['gross_hour']),
                            'net': PlutoCell(
                                value: snapshot.data.docs[index]['net_hour']),
                            'target': PlutoCell(
                                value: snapshot.data.docs[index]
                                    ['target_hour']),
                            'le': PlutoCell(
                                value: snapshot.data.docs[index]['le']),
                            'lp': PlutoCell(
                                value: snapshot.data.docs[index]['lp']),
                            'dt': PlutoCell(
                                value: snapshot.data.docs[index]['dt']),
                            'bd': PlutoCell(
                                value: snapshot.data.docs[index]['bd']),
                          },
                        ),
                      ),
                      onLoaded: (e) {
                        stateManager = e.stateManager;
                      },
                      createFooter: (stateManager) {
                        stateManager.setPageSize(100,
                            notify: false); // default 40
                        return PlutoPagination(stateManager);
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    ),
                  );
                })),
      ],
    );
  }
}
