import 'package:animated_floating_buttons/widgets/animated_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:indlkt_proj/screens/product_acv_screens/product_acv_form.dart';
import 'package:indlkt_proj/widgets/custom_container.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../constants/style.dart';
import '../../widgets/appbar.dart';

class ProductAcvScreen extends StatefulWidget {
  const ProductAcvScreen({super.key});

  @override
  State<ProductAcvScreen> createState() => _ProductAcvScreenState();
}

class _ProductAcvScreenState extends State<ProductAcvScreen> {
  TextEditingController search = TextEditingController();
  late PlutoGridStateManager stateManager;

  final List<PlutoColumn> columns = [
    PlutoColumn(
        title: 'Column1',
        field: 'column_1',
        type: PlutoColumnType.text(),
        enableSorting: true),
    PlutoColumn(
      title: 'Column2',
      field: 'column_2',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
        renderer: (rendererContext) {
          return InkWell(
            onTap: () {
              print('object');
            },
            child: Icon(Icons.abc),
          );
        },
        title: 'Column3',
        field: 'column_3',
        type: PlutoColumnType.text()),
  ];

  final List<PlutoRow> rows = [
    PlutoRow(
      cells: {
        'column_1': PlutoCell(value: 'cell 1-1'),
        'column_2': PlutoCell(value: 'cell 1-2'),
        'column_3': PlutoCell(value: 'cell 1-3'),
      },
    ),
    PlutoRow(
      cells: {
        'column_1': PlutoCell(value: 'cell 2-1'),
        'column_2': PlutoCell(value: 'cell 2-2'),
        'column_3': PlutoCell(value: 'cell 2-3'),
      },
    ),
    PlutoRow(
      cells: {
        'column_1': PlutoCell(value: 'cell 3-1'),
        'column_2': PlutoCell(value: 'cell 3-2'),
        'column_3': PlutoCell(value: 'hehe'),
      },
    ),
  ];

  // void exportToPdf() async {
  //   final themeData = pluto_grid_export.ThemeData.withFont(
  //     base: pluto_grid_export.Font.ttf(
  //       await rootBundle.load('fonts/open_sans/OpenSans-Regular.ttf'),
  //     ),
  //     bold: pluto_grid_export.Font.ttf(
  //       await rootBundle.load('fonts/open_sans/OpenSans-Bold.ttf'),
  //     ),
  //   );

  //   var plutoGridPdfExport = pluto_grid_export.PlutoGridDefaultPdfExport(
  //     title: "Pluto Grid Sample pdf print",
  //     creator: "Pluto Grid Rocks!",
  //     format: pluto_grid_export.PdfPageFormat.a4.landscape,
  //     themeData: themeData,
  //   );

  //   var pluto_grid_export;
  //   await pluto_grid_export.Printing.sharePdf(
  //     bytes: await plutoGridPdfExport.export(stateManager),
  //     filename: plutoGridPdfExport.getFilename(),
  //   );
  // }

  // void exportToCsv() async {
  //   String title = "pluto_grid_export";

  //   var exported = const Utf8Encoder()
  //       .convert(pluto_grid_export.PlutoGridExport.exportCSV(stateManager));

  //   // use file_saver from pub.dev
  //   await FileSaver.instance.saveFile("$title.csv", exported, ".csv");
  // }

  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(title: "Product Acv"),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: mediaQueryHeight,
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
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 20),
                  child: Text('Laporan Acv',
                      style: TextStyle(
                          color: blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                CustomContainer(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text("Data Per Shift",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 25,
                          width: 135,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 212, 212, 212),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 3, bottom: 3, right: 10),
                            child: TextField(
                                controller: search,
                                decoration: InputDecoration.collapsed(
                                  hintText: "search",
                                )),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: PlutoGrid(
                        columns: columns,
                        rows: rows,
                      ),
                    ),
                  ],
                )),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
