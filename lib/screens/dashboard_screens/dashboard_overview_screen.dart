import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indlkt_proj/constants/style.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/detail_pouch.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/detail_proses.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_card.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_container.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_donut_button.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_overview_breakdown.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_overview_chart.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_overview_datepicker.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_overview_radial.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/detail_sachet.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/detail_tall_can.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../widgets/custom_dropdown.dart';

class DashboardOverview extends StatefulWidget {
  const DashboardOverview({super.key});

  @override
  State<DashboardOverview> createState() => _DashboardOverviewState();
}

class _DashboardOverviewState extends State<DashboardOverview> {
  List dataaa = [];

  List dataProses = [];

  int selectedShift = 0;
  dynamic dropdownValue = 0;
  int showProgress = 0;
  DateTime? _fromSelectedDate = null;
  DateTime? _toSelectedDate = null;

  int? FromFix;
  int? ToFix;

  List dataFilterSkm = [];
  dynamic RatarataSkm = [];
  dynamic RatarataSkmProses = [];
  dynamic RatarataSkmFillpack = [];
  List dataSkm = [];
  double ProdActSkm = 0;
  double LeSkm = 0;
  double LpSkm = 0;
  double BdSkm = 0;
  double DtSkm = 0;

  //breakdown
  List dataFilterBreakdownProses = [];
  List dataFilterBreakdownPouch = [];
  List dataFilterBreakdownTallCan = [];
  List dataFilterBreakdownSacet = [];

//data Chart
  List dataFilterProses = [];
  List dataFilterPouch = [];
  List dataFilterSacet = [];
  List dataFilterTallCan = [];

  dynamic RatarataProses = 0;
  dynamic RatarataPouch = 0;
  dynamic RatarataSacet = 0;
  dynamic RatarataTallCan = 0;

  dynamic SkmAllFix = 0;
  dynamic SkmFixProses = 0;
  dynamic SkmFixPouch = 0;
  dynamic SkmFixSacet = 0;
  dynamic SkmFixTallCan = 0;

  dynamic SkmFixProsesDetail = 0;
  dynamic SkmFixPouchDetail = 0;
  dynamic SkmFixSacetDetail = 0;
  dynamic SkmFixTallCanDetail = 0;

  dynamic LeFixProses = 0;
  dynamic LeFixPouch = 0;
  dynamic LeFixSacet = 0;
  dynamic LeFixTallCan = 0;

  dynamic LpFixProses = 0;
  dynamic LpFixPouch = 0;
  dynamic LpFixSacet = 0;
  dynamic LpFixTallCan = 0;

  dynamic DtFixProses = 0;
  dynamic DtFixPouch = 0;
  dynamic DtFixSacet = 0;
  dynamic DtFixTallCan = 0;

  dynamic BdFixProses = 0;
  dynamic BdFixPouch = 0;
  dynamic BdFixSacet = 0;
  dynamic BdFixTallCan = 0;

  Function? onClik;

  String selectedDateText(select) {
    return DateFormat("dd/MMMM/yyyy").format(select);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topBreakdownProses();
    topBreakdownPouch();
    topBreakdownTallCan();
    topBreakdownSacet();
    DataSkm();
    DataProduct();
  }

  List dataBreakdownProses = [];
  final mapProses = <String, int>{};
  List<String> outputProses = [];
  List dataBreakdownPouch = [];
  final mapPouch = <String, int>{};
  List<String> outputPouch = [];
  List dataBreakdownTallCan = [];
  final mapTallCan = <String, int>{};
  List<String> outputTallCan = [];
  List dataBreakdownSacet = [];
  final mapSacet = <String, int>{};
  List<String> outputSacet = [];

  void topBreakdownProses() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("breakdown")
        .where("createdAt", isGreaterThanOrEqualTo: FromFix)
        .where("createdAt", isLessThanOrEqualTo: ToFix)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      dataBreakdownProses =
          querySnapshot.docs.map((doc) => doc.data()).toList();

      if (selectedShift == 0 && dropdownValue == 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownProses.length; i++) {
          if (dataBreakdownProses[i]["product"] == "Process_SKM") {
            data.add(dataBreakdownProses[i]);
          }
        }
        setState(() {
          dataFilterBreakdownProses = data;
        });
      } else if (selectedShift != 0 && dropdownValue == 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownProses.length; i++) {
          if (dataBreakdownProses[i]["shift"] == selectedShift.toString() &&
              dataBreakdownProses[i]["product"] == "Process_SKM") {
            data.add(dataBreakdownProses[i]);
          }
        }
        setState(() {
          dataFilterBreakdownProses = data;
        });
      } else if (selectedShift == 0 && dropdownValue != 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownProses.length; i++) {
          if (dataBreakdownProses[i]["line"] == dropdownValue.toString() &&
              dataBreakdownProses[i]["product"] == "Process_SKM") {
            data.add(dataBreakdownProses[i]);
          }
        }
        setState(() {
          dataFilterBreakdownProses = data;
        });
      } else if (selectedShift != 0 && dropdownValue != 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownProses.length; i++) {
          if (dataBreakdownProses[i]["line"] == dropdownValue.toString() &&
              dataBreakdownProses[i]["shift"] == selectedShift.toString() &&
              dataBreakdownProses[i]["product"] == "Process_SKM") {
            data.add(dataBreakdownProses[i]);
          }
        }
        setState(() {
          dataFilterBreakdownProses = data;
        });
      }

      var myList2 = List.generate(dataFilterBreakdownProses.length,
          (index) => dataFilterBreakdownProses[index]["top"]);
      mapProses.clear();

      for (final m in myList2) {
        final letter = m;
        mapProses[letter] =
            mapProses.containsKey(letter) ? mapProses[letter]! + 1 : 1;
      }

      setState(() {
        outputProses = mapProses.keys.toList(growable: false);
        outputProses
            .sort((k1, k2) => mapProses[k2]!.compareTo(mapProses[k1] as num));
      });
    } else {
      setState(() {
        outputProses = [];
      });
    }
  }

  void topBreakdownPouch() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("breakdown")
        .where("createdAt", isGreaterThanOrEqualTo: FromFix)
        .where("createdAt", isLessThanOrEqualTo: ToFix)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      dataBreakdownPouch = querySnapshot.docs.map((doc) => doc.data()).toList();

      if (selectedShift == 0 && dropdownValue == 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownPouch.length; i++) {
          if (dataBreakdownPouch[i]["product"] == "Filling_Packing_SKM_Pouch") {
            data.add(dataBreakdownPouch[i]);
          }
        }
        setState(() {
          dataFilterBreakdownPouch = data;
        });
      } else if (selectedShift != 0 && dropdownValue == 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownPouch.length; i++) {
          if (dataBreakdownPouch[i]["shift"] == selectedShift.toString() &&
              dataBreakdownPouch[i]["product"] == "Filling_Packing_SKM_Pouch") {
            data.add(dataBreakdownPouch[i]);
          }
        }
        setState(() {
          dataFilterBreakdownPouch = data;
        });
      } else if (selectedShift == 0 && dropdownValue != 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownPouch.length; i++) {
          if (dataBreakdownPouch[i]["line"] == dropdownValue.toString() &&
              dataBreakdownPouch[i]["product"] == "Filling_Packing_SKM_Pouch") {
            data.add(dataBreakdownPouch[i]);
          }
        }
        setState(() {
          dataFilterBreakdownPouch = data;
        });
      } else if (selectedShift != 0 && dropdownValue != 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownPouch.length; i++) {
          if (dataBreakdownPouch[i]["line"] == dropdownValue.toString() &&
              dataBreakdownPouch[i]["shift"] == selectedShift.toString() &&
              dataBreakdownPouch[i]["product"] == "Filling_Packing_SKM_Pouch") {
            data.add(dataBreakdownPouch[i]);
          }
        }
        setState(() {
          dataFilterBreakdownPouch = data;
        });
      }

      var myList2 = List.generate(dataFilterBreakdownPouch.length,
          (index) => dataFilterBreakdownPouch[index]["top"]);
      mapPouch.clear();

      for (final m in myList2) {
        final letter = m;
        mapPouch[letter] =
            mapPouch.containsKey(letter) ? mapPouch[letter]! + 1 : 1;
      }

      setState(() {
        outputPouch = mapPouch.keys.toList(growable: false);
        outputPouch
            .sort((k1, k2) => mapPouch[k2]!.compareTo(mapPouch[k1] as num));
      });
    } else {
      setState(() {
        outputPouch = [];
      });
    }
  }

  void topBreakdownTallCan() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("breakdown")
        .where("createdAt", isGreaterThanOrEqualTo: FromFix)
        .where("createdAt", isLessThanOrEqualTo: ToFix)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      dataBreakdownTallCan =
          querySnapshot.docs.map((doc) => doc.data()).toList();

      if (selectedShift == 0 && dropdownValue == 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownTallCan.length; i++) {
          if (dataBreakdownTallCan[i]["product"] ==
              "Filling_Packing_SKM_Tall_Can") {
            data.add(dataBreakdownTallCan[i]);
          }
        }
        setState(() {
          dataFilterBreakdownTallCan = data;
        });
      } else if (selectedShift != 0 && dropdownValue == 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownTallCan.length; i++) {
          if (dataBreakdownTallCan[i]["shift"] == selectedShift.toString() &&
              dataBreakdownTallCan[i]["product"] ==
                  "Filling_Packing_SKM_Tall_Can") {
            data.add(dataBreakdownTallCan[i]);
          }
        }
        setState(() {
          dataFilterBreakdownTallCan = data;
        });
      } else if (selectedShift == 0 && dropdownValue != 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownTallCan.length; i++) {
          if (dataBreakdownTallCan[i]["line"] == dropdownValue.toString() &&
              dataBreakdownTallCan[i]["product"] ==
                  "Filling_Packing_SKM_Tall_Can") {
            data.add(dataBreakdownTallCan[i]);
          }
        }
        setState(() {
          dataFilterBreakdownTallCan = data;
        });
      } else if (selectedShift != 0 && dropdownValue != 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownTallCan.length; i++) {
          if (dataBreakdownTallCan[i]["line"] == dropdownValue.toString() &&
              dataBreakdownTallCan[i]["shift"] == selectedShift.toString() &&
              dataBreakdownTallCan[i]["product"] ==
                  "Filling_Packing_SKM_Tall_Can") {
            data.add(dataBreakdownTallCan[i]);
          }
        }
        setState(() {
          dataFilterBreakdownTallCan = data;
        });
      }

      var myList2 = List.generate(dataFilterBreakdownTallCan.length,
          (index) => dataFilterBreakdownTallCan[index]["top"]);
      mapTallCan.clear();

      for (final m in myList2) {
        final letter = m;
        mapTallCan[letter] =
            mapTallCan.containsKey(letter) ? mapTallCan[letter]! + 1 : 1;
      }

      setState(() {
        outputTallCan = mapTallCan.keys.toList(growable: false);
        outputTallCan
            .sort((k1, k2) => mapTallCan[k2]!.compareTo(mapTallCan[k1] as num));
      });
    } else {
      setState(() {
        outputTallCan = [];
      });
    }
  }

  void topBreakdownSacet() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("breakdown")
        .where("createdAt", isGreaterThanOrEqualTo: FromFix)
        .where("createdAt", isLessThanOrEqualTo: ToFix)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      dataBreakdownSacet = querySnapshot.docs.map((doc) => doc.data()).toList();

      if (selectedShift == 0 && dropdownValue == 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownSacet.length; i++) {
          if (dataBreakdownSacet[i]["product"] ==
              "Filling_Packing_SKM_Sachet") {
            data.add(dataBreakdownSacet[i]);
          }
        }
        setState(() {
          dataFilterBreakdownSacet = data;
        });
      } else if (selectedShift != 0 && dropdownValue == 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownSacet.length; i++) {
          if (dataBreakdownSacet[i]["shift"] == selectedShift.toString() &&
              dataBreakdownSacet[i]["product"] ==
                  "Filling_Packing_SKM_Sachet") {
            data.add(dataBreakdownSacet[i]);
          }
        }
        setState(() {
          dataFilterBreakdownSacet = data;
        });
      } else if (selectedShift == 0 && dropdownValue != 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownSacet.length; i++) {
          if (dataBreakdownSacet[i]["line"] == dropdownValue.toString() &&
              dataBreakdownSacet[i]["product"] ==
                  "Filling_Packing_SKM_Sachet") {
            data.add(dataBreakdownSacet[i]);
          }
        }
        setState(() {
          dataFilterBreakdownSacet = data;
        });
      } else if (selectedShift != 0 && dropdownValue != 0) {
        var data = [];
        for (var i = 0; i < dataBreakdownSacet.length; i++) {
          if (dataBreakdownSacet[i]["line"] == dropdownValue.toString() &&
              dataBreakdownSacet[i]["shift"] == selectedShift.toString() &&
              dataBreakdownSacet[i]["product"] ==
                  "Filling_Packing_SKM_Sachet") {
            data.add(dataBreakdownSacet[i]);
          }
        }
        setState(() {
          dataFilterBreakdownSacet = data;
        });
      }

      var myList2 = List.generate(dataFilterBreakdownSacet.length,
          (index) => dataFilterBreakdownSacet[index]["top"]);
      mapSacet.clear();

      for (final m in myList2) {
        final letter = m;
        mapSacet[letter] =
            mapSacet.containsKey(letter) ? mapSacet[letter]! + 1 : 1;
      }

      setState(() {
        outputSacet = mapSacet.keys.toList(growable: false);
        outputSacet
            .sort((k1, k2) => mapSacet[k2]!.compareTo(mapSacet[k1] as num));
      });
    } else {
      setState(() {
        outputSacet = [];
      });
    }
  }

  void DataProduct() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("product")
        .where("createdAt", isGreaterThanOrEqualTo: FromFix)
        .where("createdAt", isLessThanOrEqualTo: ToFix)
        .get();
    setState(() {
      dataProses = querySnapshot.docs.map((doc) => doc.data()).toList();
      var actualO = List.generate(dataProses.length, (index) {
        double x = double.parse(dataProses[index]['actual_output']);
        String z = x.toStringAsFixed(0);
        int a = int.parse(z);

        return a;
      }).fold(0, (p, c) => p + c);
      var planingO = List.generate(dataProses.length, (index) {
        double x = double.parse(dataProses[index]['planing_output']);
        String z = x.toStringAsFixed(0);
        int a = int.parse(z);

        return a;
      }).fold(0, (p, c) => p + c);

      SkmAllFix = actualO / planingO;

      dataProsesFilter();
      dataPouchFilter();
      dataSacetFilter();
      dataTallCanFilter();
    });
  }

  void dataProsesFilter() {
    if (selectedShift == 0 && dropdownValue == 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["product"] == "Process_SKM") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterProses = data;
      });
    } else if (selectedShift != 0 && dropdownValue == 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["shift"] == selectedShift.toString() &&
            dataProses[i]["product"] == "Process_SKM") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterProses = data;
      });
    } else if (selectedShift == 0 && dropdownValue != 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["line"] == dropdownValue.toString() &&
            dataProses[i]["product"] == "Process_SKM") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterProses = data;
      });
    } else if (selectedShift != 0 && dropdownValue != 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["line"] == dropdownValue.toString() &&
            dataProses[i]["shift"] == selectedShift.toString() &&
            dataProses[i]["product"] == "Process_SKM") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterProses = data;
      });
      print(dropdownValue.toString());
      print(selectedShift.toString());
    }

    // print(dataFilterProses);
    DataProsesFix(dataFilterProses);
  }

  void DataProsesFix(doc) {
    var leCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['le']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var lpCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['lp']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var bdCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['bd']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var dtCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['dt']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);

    var actualO = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['actual_output']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var planingO = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['planing_output']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);

    LeFixProses = leCuy / doc.length;
    LpFixProses = lpCuy / doc.length;
    DtFixProses = dtCuy / doc.length;
    BdFixProses = bdCuy / doc.length;
    SkmFixProsesDetail = actualO / planingO;
    var SkmFixProsess = actualO / planingO;
    if (SkmFixProsess > 1.00) {
      SkmFixProses = 1.00;
    } else {
      SkmFixProses = SkmFixProsess;
    }
    RatarataProses = actualO / doc.length;
  }

  void dataPouchFilter() {
    if (selectedShift == 0 && dropdownValue == 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["product"] == "Filling_Packing_SKM_Pouch") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterPouch = data;
      });
    } else if (selectedShift != 0 && dropdownValue == 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["shift"] == selectedShift.toString() &&
            dataProses[i]["product"] == "Filling_Packing_SKM_Pouch") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterPouch = data;
      });
    } else if (selectedShift == 0 && dropdownValue != 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["line"] == dropdownValue.toString() &&
            dataProses[i]["product"] == "Filling_Packing_SKM_Pouch") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterPouch = data;
      });
    } else if (selectedShift != 0 && dropdownValue != 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["line"] == dropdownValue.toString() &&
            dataProses[i]["shift"] == selectedShift.toString() &&
            dataProses[i]["product"] == "Filling_Packing_SKM_Pouch") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterPouch = data;
      });
    }

    // print(dataFilterProses);
    DataPouchFix(dataFilterPouch);
  }

  void DataPouchFix(doc) {
    var leCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['le']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var lpCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['lp']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var bdCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['bd']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var dtCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['dt']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);

    var actualO = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['actual_output']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var planingO = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['planing_output']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);

    LeFixPouch = leCuy / doc.length;
    LpFixPouch = lpCuy / doc.length;
    DtFixPouch = dtCuy / doc.length;
    BdFixPouch = bdCuy / doc.length;
    SkmFixPouchDetail = actualO / planingO;
    var SkmFixPouchs = actualO / planingO;
    if (SkmFixPouchs > 1.00) {
      SkmFixPouch = 1.00;
    } else {
      SkmFixPouch = SkmFixPouchs;
    }
    RatarataPouch = actualO / doc.length;
  }

  void dataSacetFilter() {
    if (selectedShift == 0 && dropdownValue == 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["product"] == "Filling_Packing_SKM_Sachet") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterSacet = data;
      });
    } else if (selectedShift != 0 && dropdownValue == 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["shift"] == selectedShift.toString() &&
            dataProses[i]["product"] == "Filling_Packing_SKM_Sachet") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterSacet = data;
      });
    } else if (selectedShift == 0 && dropdownValue != 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["line"] == dropdownValue.toString() &&
            dataProses[i]["product"] == "Filling_Packing_SKM_Sachet") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterSacet = data;
      });
    } else if (selectedShift != 0 && dropdownValue != 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["line"] == dropdownValue.toString() &&
            dataProses[i]["shift"] == selectedShift.toString() &&
            dataProses[i]["product"] == "Filling_Packing_SKM_Sachet") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterSacet = data;
      });
    }

    // print(dataFilterProses);
    DataSacetFix(dataFilterSacet);
  }

  void DataSacetFix(doc) {
    var leCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['le']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var lpCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['lp']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var bdCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['bd']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var dtCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['dt']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);

    var actualO = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['actual_output']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var planingO = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['planing_output']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);

    LeFixSacet = leCuy / doc.length;
    LpFixSacet = lpCuy / doc.length;
    DtFixSacet = dtCuy / doc.length;
    BdFixSacet = bdCuy / doc.length;
    SkmFixSacetDetail = actualO / planingO;
    var SkmFixSacets = actualO / planingO;
    if (SkmFixSacets > 1.00) {
      SkmFixSacet = 1.00;
    } else {
      SkmFixSacet = SkmFixSacets;
    }
    RatarataSacet = actualO / doc.length;
  }

  void dataTallCanFilter() {
    if (selectedShift == 0 && dropdownValue == 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["product"] == "Filling_Packing_SKM_Tall_Can") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterTallCan = data;
      });
    } else if (selectedShift != 0 && dropdownValue == 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["shift"] == selectedShift.toString() &&
            dataProses[i]["product"] == "Filling_Packing_SKM_Tall_Can") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterTallCan = data;
      });
    } else if (selectedShift == 0 && dropdownValue != 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["line"] == dropdownValue.toString() &&
            dataProses[i]["product"] == "Filling_Packing_SKM_Tall_Can") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterTallCan = data;
      });
    } else if (selectedShift != 0 && dropdownValue != 0) {
      var data = [];
      for (var i = 0; i < dataProses.length; i++) {
        if (dataProses[i]["line"] == dropdownValue.toString() &&
            dataProses[i]["shift"] == selectedShift.toString() &&
            dataProses[i]["product"] == "Filling_Packing_SKM_Tall_Can") {
          data.add(dataProses[i]);
        }
      }
      setState(() {
        dataFilterTallCan = data;
      });
    }

    // print(dataFilterProses);
    DataTallCanFix(dataFilterTallCan);
  }

  void DataTallCanFix(doc) {
    var leCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['le']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var lpCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['lp']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var bdCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['bd']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var dtCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['dt']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);

    var actualO = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['actual_output']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var planingO = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['planing_output']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);

    LeFixTallCan = leCuy / doc.length;
    LpFixTallCan = lpCuy / doc.length;
    DtFixTallCan = dtCuy / doc.length;
    BdFixTallCan = bdCuy / doc.length;
    SkmFixTallCanDetail = actualO / planingO;
    var SkmFixTallCans = actualO / planingO;
    if (SkmFixTallCans > 1.00) {
      SkmFixTallCan = 1.00;
    } else {
      SkmFixTallCan = SkmFixTallCans;
    }
    RatarataTallCan = actualO / doc.length;
  }

  int SkmFill = 1;

  void DataSkm() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("product")
        .where("createdAt", isGreaterThanOrEqualTo: FromFix)
        .where("createdAt", isLessThanOrEqualTo: ToFix)
        .get();
    setState(() {
      dataSkm = querySnapshot.docs.map((doc) => doc.data()).toList();
      dataSkmFilter();
    });
  }

  void dataSkmFilter() {
    if (SkmFill == 1) {
      var data = [];
      for (var i = 0; i < dataSkm.length; i++) {
        data.add(dataSkm[i]);
      }
      setState(() {
        dataFilterSkm = data;
      });
    } else if (SkmFill == 2) {
      var data = [];
      for (var i = 0; i < dataSkm.length; i++) {
        if (dataSkm[i]["type"] == "process") {
          data.add(dataSkm[i]);
        }
      }
      setState(() {
        dataFilterSkm = data;
      });
    } else if (SkmFill == 3) {
      var data = [];
      for (var i = 0; i < dataSkm.length; i++) {
        if (dataSkm[i]["type"] == "fillpack") {
          data.add(dataSkm[i]);
        }
      }
      setState(() {
        dataFilterSkm = data;
      });
    }

    // print(dataFilterProses);
    DataSkmFix(dataFilterSkm);
  }

  void DataSkmFix(doc) {
    var leCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['le']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var lpCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['lp']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var bdCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['bd']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var dtCuy = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['dt']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);

    var ActOutput = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['actual_output']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);
    var PlaningOutput = List.generate(doc.length, (index) {
      double x = double.parse(doc[index]['planing_output']);
      String z = x.toStringAsFixed(0);
      int a = int.parse(z);

      return a;
    }).fold(0, (p, c) => p + c);

    if (leCuy == 0) {
      LeSkm = 0;
    } else {
      LeSkm = leCuy / doc.length;
    }

    if (lpCuy == 0) {
      LpSkm = 0;
    } else {
      LpSkm = lpCuy / doc.length;
    }

    if (dtCuy == 0) {
      DtSkm = 0;
    } else {
      DtSkm = dtCuy / doc.length;
    }
    if (bdCuy == 0) {
      BdSkm = 0;
    } else {
      BdSkm = bdCuy / doc.length;
    }
    if (ActOutput == 0 && PlaningOutput == 0) {
      ProdActSkm = 0;
    } else {
      var Skm = ActOutput / PlaningOutput;
      ProdActSkm = Skm * 100;
    }
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Widget detail(v) {
      if (v == 1) {
        return DetailProses(
          Bd: BdFixProses,
          Dt: DtFixProses,
          Le: LeFixProses,
          Lp: LpFixProses,
          Skm: SkmFixProsesDetail,
          Ratarata: RatarataProses,
        );
      } else if (v == 2) {
        return DetailPouch(
          Bd: BdFixPouch,
          Dt: DtFixPouch,
          Le: LeFixPouch,
          Lp: LpFixPouch,
          Skm: SkmFixPouchDetail,
          Ratarata: RatarataPouch,
        );
      } else if (v == 3) {
        return DetailTallCan(
          Bd: BdFixTallCan,
          Dt: DtFixTallCan,
          Le: LeFixTallCan,
          Lp: LpFixTallCan,
          Skm: SkmFixTallCanDetail,
          Ratarata: RatarataTallCan,
        );
      } else if (v == 4) {
        return DetailSacet(
          Bd: BdFixSacet,
          Dt: DtFixSacet,
          Le: LeFixSacet,
          Lp: LpFixSacet,
          Skm: SkmFixSacetDetail,
          Ratarata: RatarataSacet,
        );
      } else {
        return Container();
      }
    }

    Widget breakdown(v) {
      if (v == 1) {
        return ListView.builder(
            itemCount: outputProses.length >= 6 ? 5 : outputProses.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (outputProses != []) {
                return StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('breakdown')
                        .where("top", isEqualTo: outputProses[index])
                        .snapshots(),
                    builder: (context, snapshot) {
                      final doc = snapshot.data!.docs;
                      if (snapshot.data != null) {}

                      var totalHour = List.generate(doc.length, (index) {
                        double x = double.parse(doc[index]['bdHour'] ?? 0);

                        return x;
                      }).reduce((a, b) => a + b);
                      return BreakdownItem(
                          title: doc[0]["mesin"] ?? "-",
                          desc: doc[0]["reason"] ?? "-",
                          number: totalHour.toStringAsFixed(2));
                    });
              } else {
                return Container();
              }
            });
      } else if (v == 2) {
        return Container(
          child: ListView.builder(
              itemCount: outputPouch.length >= 6 ? 5 : outputPouch.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('breakdown')
                        .where("top", isEqualTo: outputPouch[index])
                        .snapshots(),
                    builder: (context, snapshot) {
                      final doc = snapshot.data!.docs;
                      if (!snapshot.hasData) {
                        return Text("no Data");
                      }

                      var totalHour = List.generate(doc.length, (index) {
                        double x = double.parse(doc[index]['bdHour']);

                        return x;
                      }).reduce((a, b) => a + b);
                      return BreakdownItem(
                          title: doc[0]["mesin"],
                          desc: doc[0]["reason"],
                          number: totalHour.toStringAsFixed(2));
                    });
              }),
        );
      } else if (v == 3) {
        return Container(
          child: ListView.builder(
              itemCount: outputTallCan.length >= 6 ? 5 : outputTallCan.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('breakdown')
                        .where("top", isEqualTo: outputTallCan[index])
                        .snapshots(),
                    builder: (context, snapshot) {
                      final doc = snapshot.data!.docs;
                      if (!snapshot.hasData) {
                        return Text("no Data");
                      }

                      var totalHour = List.generate(doc.length, (index) {
                        double x = double.parse(doc[index]['bdHour']);

                        return x;
                      }).reduce((a, b) => a + b);
                      return BreakdownItem(
                          title: doc[0]["mesin"],
                          desc: doc[0]["reason"],
                          number: totalHour.toStringAsFixed(2));
                    });
              }),
        );
      } else if (v == 4) {
        return Container(
          child: ListView.builder(
              itemCount: outputSacet.length >= 6 ? 5 : outputSacet.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('breakdown')
                        .where("top", isEqualTo: outputSacet[index])
                        .snapshots(),
                    builder: (context, snapshot) {
                      final doc = snapshot.data!.docs;
                      if (!snapshot.hasData) {
                        return Text("no Data");
                      }

                      var totalHour = List.generate(doc.length, (index) {
                        double x = double.parse(doc[index]['bdHour']);

                        return x;
                      }).reduce((a, b) => a + b);
                      return BreakdownItem(
                          title: doc[0]["mesin"],
                          desc: doc[0]["reason"],
                          number: totalHour.toStringAsFixed(2));
                    });
              }),
        );
      } else {
        return Container();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  topBreakdownProses();
                  topBreakdownPouch();
                  topBreakdownTallCan();
                  topBreakdownSacet();
                  DataSkm();
                  DataProduct();
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
                        color: blue,
                        borderRadius: BorderRadius.circular(5)),
                    width: 78,
                    height: 36,
                    child: Center(
                        child: Text(
                      "Refresh",
                      style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.displayMedium,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: light),
                    ))),
              ),
            ],
          ),
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(
            color: lightGrey,
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, 0),
                  color: dark.withOpacity(0.4))
            ],
            border: Border.all(width: 1, color: blue),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: DropdownButton(
                hint: Text("Pilih Nama Laporan *"),
                underline: Container(),
                borderRadius: BorderRadius.circular(10),
                value: SkmFill,
                onChanged: (e) {
                  setState(() {
                    SkmFill = e!;
                  });
                  dataSkmFilter();
                },
                items: [
                  DropdownMenuItem(
                    child: Text("All"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Proccess"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("FillPack"),
                    value: 3,
                  ),
                ]),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            DashboardCard(
                color: active,
                Product: "SKM",
                LE: LeSkm.toStringAsFixed(0),
                LP: LpSkm.toStringAsFixed(0),
                ProdAcv: ProdActSkm.toStringAsFixed(0),
                DT: DtSkm.toStringAsFixed(0),
                BD: BdSkm.toStringAsFixed(0)),
            SizedBox(width: width * 0.042),
            DashboardCard(
                color: Color(0xff2BB8C1),
                Product: "UHT",
                LE: "-",
                LP: "-",
                ProdAcv: "-",
                DT: "-",
                BD: "-"),
            SizedBox(width: width * 0.042),
            DashboardCard(
                color: Color(0xff50E279),
                Product: "Factory",
                LE: "-",
                LP: "-",
                ProdAcv: "-",
                DT: "-",
                BD: "-")
          ],
        ),
        SizedBox(height: 15),
        Container(
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('From'),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            offset: Offset(0, 0),
                            color: dark.withOpacity(0.4))
                      ],
                      color: Color.fromARGB(255, 229, 228, 228),
                      border: Border.all(color: blue),
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                      onTap: () async {
                        DateTime? pickDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000));

                        setState(() {
                          _fromSelectedDate = pickDate;
                          int noww = _fromSelectedDate!.millisecondsSinceEpoch;

                          DateTime date =
                              DateTime.fromMillisecondsSinceEpoch(noww);
                          var moon;
                          var day;

                          if (date.month == 10 ||
                              date.month == 11 ||
                              date.month == 12) {
                            moon = "${date.month}";
                          } else {
                            moon = "0" + "${date.month}";
                          }

                          if (date.day == 1 ||
                              date.day == 2 ||
                              date.day == 3 ||
                              date.day == 4 ||
                              date.day == 5 ||
                              date.day == 6 ||
                              date.day == 7 ||
                              date.day == 8 ||
                              date.day == 9) {
                            day = "0" + "${date.day}";
                          } else {
                            day = "${date.day}";
                          }
                          String datetime = date.year.toString() + moon + day;
                          FromFix = int.parse(datetime);

                          topBreakdownProses();
                          topBreakdownPouch();
                          topBreakdownTallCan();
                          topBreakdownSacet();
                          DataProduct();
                          DataSkm();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 2, bottom: 2),
                        child: Text(
                            "${_fromSelectedDate != null ? selectedDateText(_fromSelectedDate) : "                    -                   "}"),
                      )),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
              child: Container(width: 80, color: blue, height: 3),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('To'),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            offset: Offset(0, 0),
                            color: dark.withOpacity(0.4))
                      ],
                      color: Color.fromARGB(255, 229, 228, 228),
                      border: Border.all(color: blue),
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                      onTap: () async {
                        DateTime? pickDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000));

                        setState(() {
                          _toSelectedDate = pickDate;
                          int noww = _toSelectedDate!.millisecondsSinceEpoch;
                          DateTime date =
                              DateTime.fromMillisecondsSinceEpoch(noww);
                          var moon;
                          var day;

                          if (date.month == 10 ||
                              date.month == 11 ||
                              date.month == 12) {
                            moon = "${date.month}";
                          } else {
                            moon = "0" + "${date.month}";
                          }

                          if (date.day == 1 ||
                              date.day == 2 ||
                              date.day == 3 ||
                              date.day == 4 ||
                              date.day == 5 ||
                              date.day == 6 ||
                              date.day == 7 ||
                              date.day == 8 ||
                              date.day == 9) {
                            day = "0" + "${date.day}";
                          } else {
                            day = "${date.day}";
                          }
                          String datetime = date.year.toString() + moon + day;
                          ToFix = int.parse(datetime);
                          topBreakdownProses();
                          topBreakdownPouch();
                          topBreakdownTallCan();
                          topBreakdownSacet();
                          DataProduct();
                          DataSkm();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 2, bottom: 2),
                        child: Text(
                            "${_toSelectedDate != null ? selectedDateText(_toSelectedDate) : "                    -                   "}"),
                      )),
                ),
              ],
            )
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardContainer(
                width: 1000,
                child: Stack(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            "Pencapaian dan Performa",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),

                          SizedBox(height: 15),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Shift",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Row(children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: selectedShift == 1
                                                  ? light
                                                  : blue,
                                              border: Border.all(),
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  topLeft:
                                                      Radius.circular(10))),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedShift = 1;
                                              });
                                              dataProsesFilter();
                                              dataPouchFilter();
                                              dataSacetFilter();
                                              dataTallCanFilter();
                                              topBreakdownProses();
                                              topBreakdownPouch();
                                              topBreakdownTallCan();
                                              topBreakdownSacet();
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: 8,
                                                  left: 8,
                                                  top: 1.5,
                                                  bottom: 1.5),
                                              child: Text("1",
                                                  style: TextStyle(
                                                      color: selectedShift == 1
                                                          ? dark
                                                          : light)),
                                            ),
                                          )),
                                      Container(
                                          decoration: BoxDecoration(
                                            color: selectedShift == 2
                                                ? light
                                                : blue,
                                            border: Border.all(),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedShift = 2;
                                              });
                                              dataProsesFilter();
                                              dataPouchFilter();
                                              dataSacetFilter();
                                              dataTallCanFilter();
                                              topBreakdownProses();
                                              topBreakdownPouch();
                                              topBreakdownTallCan();
                                              topBreakdownSacet();
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: 8,
                                                  left: 8,
                                                  top: 1.5,
                                                  bottom: 1.5),
                                              child: Text("2",
                                                  style: TextStyle(
                                                      color: selectedShift == 2
                                                          ? dark
                                                          : light)),
                                            ),
                                          )),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: selectedShift == 3
                                                  ? light
                                                  : blue,
                                              border: Border.all(),
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10))),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedShift = 3;
                                              });
                                              dataProsesFilter();
                                              dataPouchFilter();
                                              dataSacetFilter();
                                              dataTallCanFilter();
                                              topBreakdownProses();
                                              topBreakdownPouch();
                                              topBreakdownTallCan();
                                              topBreakdownSacet();
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: 8,
                                                  left: 8,
                                                  top: 1.5,
                                                  bottom: 1.5),
                                              child: Text(
                                                "3",
                                                style: TextStyle(
                                                    color: selectedShift == 3
                                                        ? dark
                                                        : light),
                                              ),
                                            ),
                                          ))
                                    ]),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Container(
                                    decoration: BoxDecoration(
                                      color: selectedShift == 0 ? light : blue,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            offset: Offset(0, 0),
                                            color: dark.withOpacity(0.4))
                                      ],
                                      border: Border.all(width: 1, color: dark),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedShift = 0;
                                        });
                                        dataProsesFilter();
                                        dataPouchFilter();
                                        dataSacetFilter();
                                        dataTallCanFilter();
                                        topBreakdownProses();
                                        topBreakdownPouch();
                                        topBreakdownTallCan();
                                        topBreakdownSacet();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            bottom: 2,
                                            right: 4,
                                            left: 4),
                                        child: Text("all shift",
                                            style: TextStyle(
                                                color: selectedShift == 0
                                                    ? dark
                                                    : light)),
                                      ),
                                    )),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    Text("Line",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: light,
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 4,
                                              offset: Offset(0, 0),
                                              color: dark.withOpacity(0.4))
                                        ],
                                        border:
                                            Border.all(width: 1, color: blue),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: DropdownButton(
                                            underline: Container(),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            value: dropdownValue,
                                            onChanged: (e) {
                                              setState(() {
                                                dropdownValue = e!;
                                              });
                                              dataProsesFilter();
                                              dataPouchFilter();
                                              dataSacetFilter();
                                              dataTallCanFilter();
                                              topBreakdownProses();
                                              topBreakdownPouch();
                                              topBreakdownTallCan();
                                              topBreakdownSacet();
                                            },
                                            items: [
                                              DropdownMenuItem(
                                                child: Text("all"),
                                                value: 0,
                                              ),
                                              DropdownMenuItem(
                                                child: Text("1"),
                                                value: 1,
                                              ),
                                              DropdownMenuItem(
                                                child: Text("2"),
                                                value: 2,
                                              ),
                                              DropdownMenuItem(
                                                child: Text("A"),
                                                value: "A",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("B"),
                                                value: "B",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("C"),
                                                value: "C",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("D"),
                                                value: "D",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("E"),
                                                value: "E",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("F"),
                                                value: "F",
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                          SizedBox(
                            height: 20,
                          ),
                          //chart

                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 480,
                                  height: 500,
                                  child: GridView.count(
                                      childAspectRatio: 3 / 3,
                                      crossAxisCount: 2,
                                      children: [
                                        // Radial Bar 1

                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              showProgress = 1;
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: 5),
                                                        height: 15,
                                                        width: 15,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xffE48D9D),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                      Text(
                                                        "Process_SKM",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      child:
                                                          CircularPercentIndicator(
                                                        radius: 80.0,
                                                        lineWidth: 16.0,
                                                        percent: SkmFixProses,
                                                        center: RadialBar(
                                                          chartData: [
                                                            ChartData(
                                                                'LE',
                                                                LeFixProses,
                                                                blueLE),
                                                            ChartData(
                                                                'LP',
                                                                LpFixProses,
                                                                greenLP),
                                                            ChartData(
                                                                'DT',
                                                                DtFixProses,
                                                                redDT),
                                                            ChartData(
                                                                'BD',
                                                                BdFixProses,
                                                                orangeBD),
                                                          ],
                                                        ),
                                                        progressColor:
                                                            const Color(
                                                                0xffE48D9D),
                                                      ),
                                                    ),
                                                    CircularPercentIndicator(
                                                      radius: 30.0,
                                                      lineWidth: 12,
                                                      percent: SkmAllFix,
                                                      center: Text("SKM"),
                                                      progressColor: redSKM,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Radial Bar 2
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              showProgress = 2;
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: 5),
                                                        height: 15,
                                                        width: 15,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xff872643),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                      Text(
                                                        "Filling Packing SKM Pouch",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      child:
                                                          CircularPercentIndicator(
                                                        radius: 80.0,
                                                        lineWidth: 16.0,
                                                        percent: SkmFixPouch,
                                                        center: RadialBar(
                                                          chartData: [
                                                            ChartData(
                                                                'LE',
                                                                LeFixPouch,
                                                                blueLE),
                                                            ChartData(
                                                                'LP',
                                                                LpFixPouch,
                                                                greenLP),
                                                            ChartData(
                                                                'DT',
                                                                DtFixPouch,
                                                                redDT),
                                                            ChartData(
                                                                'BD',
                                                                BdFixPouch,
                                                                orangeBD),
                                                          ],
                                                        ),
                                                        progressColor:
                                                            const Color(
                                                                0xff872643),
                                                      ),
                                                    ),
                                                    CircularPercentIndicator(
                                                      radius: 30.0,
                                                      lineWidth: 12,
                                                      percent: SkmAllFix,
                                                      center: Text("SKM"),
                                                      progressColor: redSKM,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Radial Bar 3
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              showProgress = 3;
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: 5),
                                                        height: 15,
                                                        width: 15,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xff194B6D),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                      Text(
                                                        "Filling Packing SKM Tall Can",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      child:
                                                          CircularPercentIndicator(
                                                        radius: 80.0,
                                                        lineWidth: 16.0,
                                                        percent: SkmFixTallCan,
                                                        center: RadialBar(
                                                          chartData: [
                                                            ChartData(
                                                                'LE',
                                                                LeFixTallCan,
                                                                blueLE),
                                                            ChartData(
                                                                'LP',
                                                                LpFixTallCan,
                                                                greenLP),
                                                            ChartData(
                                                                'DT',
                                                                DtFixTallCan,
                                                                redDT),
                                                            ChartData(
                                                                'BD',
                                                                BdFixTallCan,
                                                                orangeBD),
                                                          ],
                                                        ),
                                                        progressColor:
                                                            const Color(
                                                                0xff194B6D),
                                                      ),
                                                    ),
                                                    CircularPercentIndicator(
                                                      radius: 30.0,
                                                      lineWidth: 12,
                                                      percent: SkmAllFix,
                                                      center: Text("SKM"),
                                                      progressColor: redSKM,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Radial Bar 4
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              showProgress = 4;
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: 5),
                                                        height: 15,
                                                        width: 15,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xff297E6F),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                      Text(
                                                        "Filling Packing SKM Sachet",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      child:
                                                          CircularPercentIndicator(
                                                        radius: 80.0,
                                                        lineWidth: 16.0,
                                                        percent: SkmFixSacet,
                                                        center: RadialBar(
                                                          chartData: [
                                                            ChartData(
                                                                'LE',
                                                                LeFixSacet,
                                                                blueLE),
                                                            ChartData(
                                                                'LP',
                                                                LpFixSacet,
                                                                greenLP),
                                                            ChartData(
                                                                'DT',
                                                                DtFixSacet,
                                                                redDT),
                                                            ChartData(
                                                                'BD',
                                                                BdFixSacet,
                                                                orangeBD),
                                                          ],
                                                        ),
                                                        progressColor:
                                                            const Color(
                                                                0xff297E6F),
                                                      ),
                                                    ),
                                                    CircularPercentIndicator(
                                                      radius: 30.0,
                                                      lineWidth: 12,
                                                      percent: SkmAllFix,
                                                      center: Text("SKM"),
                                                      progressColor: redSKM,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Column(
                                  children: [
                                    detail(showProgress),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset("assets/images/gears.png",
                            width: 120, height: 120),
                      ),
                    ],
                  )
                ])),
            SizedBox(width: 12),
            DashboardContainer(
                height: 620,
                width: 375,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Text(
                      "TOP 5 BREAKDOWN MESIN",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 45),
                    Expanded(child: breakdown(showProgress))
                  ],
                ))
          ],
        )
      ],
    );
  }
}

class Detail {
  Widget detail = Container();

  Widget detail2 = Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Filling_packing_SKM"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(colors: [
                      Colors.green,
                      Color.fromARGB(255, 164, 219, 166)
                    ]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 20,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("41287/45000")
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BD"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(
                        colors: [blue, Color.fromARGB(255, 129, 141, 182)]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 20,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("94,59%")
              ],
            ),
          ],
        ),
      ],
    ),
  );

  Widget detail3 = Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Filling_packing_SKM"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(colors: [
                      Colors.green,
                      Color.fromARGB(255, 164, 219, 166)
                    ]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 95,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("41287/45000")
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BD"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(
                        colors: [blue, Color.fromARGB(255, 129, 141, 182)]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 10,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("94,59%")
              ],
            ),
          ],
        ),
      ],
    ),
  );

  Widget detail4 = Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Filling_packing_SKM"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(colors: [
                      Colors.green,
                      Color.fromARGB(255, 164, 219, 166)
                    ]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 50,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("41287/45000")
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BD"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 9,
                  child: FAProgressBar(
                    progressGradient: LinearGradient(
                        colors: [blue, Color.fromARGB(255, 129, 141, 182)]),
                    borderRadius: BorderRadius.circular(5),
                    currentValue: 37,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text("94,59%")
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
