import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:pluto_grid_export/pluto_grid_export.dart' as pluto_grid_export;
import 'package:file_saver/file_saver.dart';
import 'package:flutter/services.dart';

import '../constants/style.dart';
import 'custom_container.dart';

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
        // renderer: (rendererContext) {
        //   return InkWell(
        //     onTap: () {
        //       print('object');
        //     },
        //     child: Icon(Icons.abc),
        //   );
        // },
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
        title: 'Tanggal',
        field: 'tanggal',
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
        Expanded(
          child: PlutoGrid(
            columns: columns,
            rows: List.generate(
              200,
              (index) => PlutoRow(
                cells: {
                  'product': PlutoCell(value: 'cell 1${index + 1}'),
                  'departement': PlutoCell(value: 'cell 1-2'),
                  'shift': PlutoCell(value: 'cell 1-3'),
                  'line': PlutoCell(value: 'cell 1-3'),
                  'tanggal': PlutoCell(value: 'cell 1-3'),
                },
              ),
            ),
            onLoaded: (e) {
              stateManager = e.stateManager;
            },
            createFooter: (stateManager) {
              stateManager.setPageSize(100, notify: false); // default 40
              return PlutoPagination(stateManager);
            },
          ),
        ),
      ],
    );
  }
}
