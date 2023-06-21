import 'package:flutter/material.dart';
import 'package:table_plus/table_plus.dart';

class tablePlus extends StatefulWidget {
  const tablePlus({Key? key}) : super(key: key);

  @override
  State<tablePlus> createState() => _tablePlusState();
}

class _tablePlusState extends State<tablePlus> {
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
                style: const TextStyle(color: Colors.black),
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
                Text(objData.firstName),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.lastName),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.age.toString()),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.mobileNumber.toString()),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(TextButton(onPressed: () {}, child: Text("data")))
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
    tableHeading.add("First Name");
    tableHeading.add("Second Name");
    tableHeading.add("Age");
    tableHeading.add("Mobile Number");
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
                    index == 0 ? names[i].firstName : names[i].lastName;
                Name nameData = names[i];
                if (data.toLowerCase().contains(value.toLowerCase())) {
                  searchList.add(nameData);
                }
              } else if (index == 2) {
                int age = names[i].age;
                Name nameData = names[i];
                if (age.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 3) {
                int mobileNumber = names[i].mobileNumber;
                Name nameData = names[i];
                if (mobileNumber.toString().contains(value)) {
                  searchList.add(nameData);
                }
              }
              // String data = index == 0 ? names[i].firstName : names[i].lastName;
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
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: TablePlus(
          exportFileName: "MyTableFile",
          tabelHeadingList: tableHeading,
          isExportCSVEnabled: true,
          columnSpacing: 60,
          sortColumnIndex: 1,
          isSearchEnabled: isSearchEnabled,
          rows: dataRowsValues(),
          columns: dataColumnValues(),
          dataValues: names,
          shareWidget: Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Export',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }

  var names = List.generate(
      4,
      (index) =>
          Name(firstName: "jhbh", lastName: "jnk", age: 9, mobileNumber: 7687));
}

class Name {
  String firstName;
  String lastName;
  int age;
  int mobileNumber;

  Name(
      {required this.firstName,
      required this.lastName,
      required this.age,
      required this.mobileNumber});
}
