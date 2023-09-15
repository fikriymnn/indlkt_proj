import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indlkt_proj/screens/user_screens/widgets/edit_user.dart';
import 'package:table_plus/table_plus.dart';

import '../../../constants/style.dart';
import '../../../models/user_model.dart';

class UserTable extends StatefulWidget {
  const UserTable({super.key});

  @override
  State<UserTable> createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
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
                Text(objData.userName),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.email),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.nik),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.noTelepon),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Text(objData.role),
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
                                  child: EditUser(
                                    email: objData.email,
                                    id: objData.id,
                                    namaLengkap: objData.userName,
                                    noTelp: objData.noTelepon,
                                    role: objData.role,
                                    Nik: objData.nik,
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
                                  blurRadius: 1,
                                  offset: Offset(0, 0),
                                  color: edit)
                            ],
                            border: Border.all(
                              color: edit,
                            ),
                            color: selectedIndex == 4
                                ? Color.fromARGB(255, 195, 225, 250)
                                : edit,
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
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      CoolAlert.show(
                          width: 500,
                          context: context,
                          type: CoolAlertType.confirm,
                          text:
                              "Jika di hapus maka akun tidak dapat di pakai kembali",
                          title: "Yakin Untuk Menghapus Akun",
                          onCancelBtnTap: () {},
                          onConfirmBtnTap: () {
                            try {
                              FirebaseFirestore.instance
                                  .collection("akun")
                                  .doc(objData.id)
                                  .delete();

                              getData();
                            } on FirebaseException catch (e) {
                              CoolAlert.show(
                                width: 500,
                                context: context,
                                type: CoolAlertType.error,
                                text: e.message,
                              );
                            } catch (e) {
                              CoolAlert.show(
                                width: 500,
                                context: context,
                                type: CoolAlertType.error,
                                text: e.toString(),
                              );
                            }
                          });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(0, 0),
                                  color: active)
                            ],
                            border: Border.all(
                              color: active,
                            ),
                            color: selectedIndex == 4
                                ? Color.fromARGB(255, 195, 225, 250)
                                : active,
                            borderRadius: BorderRadius.circular(5)),
                        width: 78,
                        height: 36,
                        child: Center(
                            child: Text(
                          "Delete",
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: selectedIndex == 4 ? dark : light),
                        ))),
                  )
                ],
              )),
            ],
          ),
        )
        .toList();
  }

  getData() async {
    QuerySnapshot querySnapshot = await db
        .collection("akun")
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
            email: dataProduct[index]["email"] == null
                ? "-"
                : dataProduct[index]["email"],
            nik: dataProduct[index]["nik"] == null
                ? "-"
                : dataProduct[index]["nik"],
            noTelepon: dataProduct[index]["noTelepon"] == null
                ? "-"
                : dataProduct[index]["noTelepon"],
            role: dataProduct[index]["role"] == null
                ? "-"
                : dataProduct[index]["role"],
            userName: dataProduct[index]["userName"] == null
                ? "-"
                : dataProduct[index]["userName"],
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
    tableHeading.add("Nama Lengkap");
    tableHeading.add("Email");
    tableHeading.add("No.Kepegawaian");
    tableHeading.add("No.Telepon");
    tableHeading.add("Role");
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
                String data = index == 0 ? names[i].userName : names[i].email;
                Name nameData = names[i];
                if (data.toLowerCase().contains(value.toLowerCase())) {
                  searchList.add(nameData);
                }
              } else if (index == 2) {
                String shift = names[i].nik;
                Name nameData = names[i];
                if (shift.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 3) {
                String line = names[i].noTelepon;
                Name nameData = names[i];
                if (line.toString().contains(value)) {
                  searchList.add(nameData);
                }
              } else if (index == 4) {
                String date = names[i].role;
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
    return Column(
      children: [
        Expanded(
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
        ),
      ],
    );
  }
}

class Name {
  String email, nik, noTelepon, role, id, userName;

  Name({
    required this.nik,
    required this.id,
    required this.userName,
    required this.noTelepon,
    required this.email,
    required this.role,
  });
}
