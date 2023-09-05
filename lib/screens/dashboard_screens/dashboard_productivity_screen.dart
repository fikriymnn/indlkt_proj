import 'dart:math';

import 'package:chart_components/bar_chart_component.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widget_productivity.dart/chart.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_container.dart';
import 'package:indlkt_proj/screens/dashboard_screens/widgets/dashboard_productivity_container.dart';

import '../../constants/style.dart';
import 'package:intl/intl.dart';

class DashboardProductivity extends StatefulWidget {
  const DashboardProductivity({super.key});

  @override
  State<DashboardProductivity> createState() => _DashboardProductivityState();
}

class _DashboardProductivityState extends State<DashboardProductivity> {
  @override
  void initState() {
    // TODO: implement initState
    getTahunNow();

    super.initState();
  }

  var tahun = DateFormat.y().format(DateTime.now());

  var weekSort1 = 4;
  var weekSort2;
  var weekSort3;
  var weekSort4;

  var moonSort1;
  var moonSort2;

  dynamic labelTahunNow = "";
  dynamic labelTahunThen = "";
  dynamic labelWeek1 = "";
  dynamic labelWeek2 = "";
  dynamic labelWeek3 = "";
  dynamic labelWeek4 = "";
  dynamic labelmoon1 = "";
  dynamic labelmoon2 = "";

//Value data Ctn
  dynamic tahunNowCtn = 0;
  dynamic tahunThenCtn = 0;
  dynamic week1Ctn = 0;
  dynamic week2Ctn = 0;
  dynamic week3Ctn = 0;
  dynamic week4Ctn = 0;
  dynamic moon1Ctn = 0;
  dynamic moon2Ctn = 0;

  //value data Lp Proses
  dynamic tahunNowLpProses = 0;
  dynamic tahunThenLpProses = 0;
  dynamic week1LpProses = 0;
  dynamic week2LpProses = 0;
  dynamic week3LpProses = 0;
  dynamic week4LpProses = 0;
  dynamic moon1LpProses = 0;
  dynamic moon2LpProses = 0;

  //value data Lp Fillpack
  dynamic tahunNowLpFillpack = 0;
  dynamic tahunThenLpFillpack = 0;
  dynamic week1LpFillpack = 0;
  dynamic week2LpFillpack = 0;
  dynamic week3LpFillpack = 0;
  dynamic week4LpFillpack = 0;
  dynamic moon1LpFillpack = 0;
  dynamic moon2LpFillpack = 0;

  //value data Le Proses
  dynamic tahunNowLeProses = 0;
  dynamic tahunThenLeProses = 0;
  dynamic week1LeProses = 0;
  dynamic week2LeProses = 0;
  dynamic week3LeProses = 0;
  dynamic week4LeProses = 0;
  dynamic moon1LeProses = 0;
  dynamic moon2LeProses = 0;

  //value data Le Fillpack
  dynamic tahunNowLeFillpack = 0;
  dynamic tahunThenLeFillpack = 0;
  dynamic week1LeFillpack = 0;
  dynamic week2LeFillpack = 0;
  dynamic week3LeFillpack = 0;
  dynamic week4LeFillpack = 0;
  dynamic moon1LeFillpack = 0;
  dynamic moon2LeFillpack = 0;

  //value data Dt Proses
  dynamic tahunNowDtProses = 0;
  dynamic tahunThenDtProses = 0;
  dynamic week1DtProses = 0;
  dynamic week2DtProses = 0;
  dynamic week3DtProses = 0;
  dynamic week4DtProses = 0;
  dynamic moon1DtProses = 0;
  dynamic moon2DtProses = 0;

  //value data Dt FillPack
  dynamic tahunNowDtFillPack = 0;
  dynamic tahunThenDtFillPack = 0;
  dynamic week1DtFillPack = 0;
  dynamic week2DtFillPack = 0;
  dynamic week3DtFillPack = 0;
  dynamic week4DtFillPack = 0;
  dynamic moon1DtFillPack = 0;
  dynamic moon2DtFillPack = 0;

  //value data Bd Proses
  dynamic tahunNowBdProses = 0;
  dynamic tahunThenBdProses = 0;
  dynamic week1BdProses = 0;
  dynamic week2BdProses = 0;
  dynamic week3BdProses = 0;
  dynamic week4BdProses = 0;
  dynamic moon1BdProses = 0;
  dynamic moon2BdProses = 0;

  //value data Bd fillpack
  dynamic tahunNowBdFillpack = 0;
  dynamic tahunThenBdFillpack = 0;
  dynamic week1BdFillpack = 0;
  dynamic week2BdFillpack = 0;
  dynamic week3BdFillpack = 0;
  dynamic week4BdFillpack = 0;
  dynamic moon1BdFillpack = 0;
  dynamic moon2BdFillpack = 0;

  //value data Proses
  dynamic tahunNowProses = 0;
  dynamic tahunThenProses = 0;
  dynamic week1Proses = 0;
  dynamic week2Proses = 0;
  dynamic week3Proses = 0;
  dynamic week4Proses = 0;
  dynamic moon1Proses = 0;
  dynamic moon2Proses = 0;

  //value data pouch
  dynamic tahunNowpouch = 0;
  dynamic tahunThenpouch = 0;
  dynamic week1pouch = 0;
  dynamic week2pouch = 0;
  dynamic week3pouch = 0;
  dynamic week4pouch = 0;
  dynamic moon1pouch = 0;
  dynamic moon2pouch = 0;

  //value data TallCan
  dynamic tahunNowTallCan = 0;
  dynamic tahunThenTallCan = 0;
  dynamic week1TallCan = 0;
  dynamic week2TallCan = 0;
  dynamic week3TallCan = 0;
  dynamic week4TallCan = 0;
  dynamic moon1TallCan = 0;
  dynamic moon2TallCan = 0;

  //value data sacet
  dynamic tahunNowSacet = 0;
  dynamic tahunThenSacet = 0;
  dynamic week1Sacet = 0;
  dynamic week2Sacet = 0;
  dynamic week3Sacet = 0;
  dynamic week4Sacet = 0;
  dynamic moon1Sacet = 0;
  dynamic moon2Sacet = 0;

  //value data proses skm
  dynamic tahunNowProsesSkm = 0;
  dynamic tahunThenProsesSkm = 0;
  dynamic week1ProsesSkm = 0;
  dynamic week2ProsesSkm = 0;
  dynamic week3ProsesSkm = 0;
  dynamic week4ProsesSkm = 0;
  dynamic moon1ProsesSkm = 0;
  dynamic moon2ProsesSkm = 0;

  //value data Pouch
  dynamic tahunNowFillPouch = 0;
  dynamic tahunThenFillPouch = 0;
  dynamic week1FillPouch = 0;
  dynamic week2FillPouch = 0;
  dynamic week3FillPouch = 0;
  dynamic week4FillPouch = 0;
  dynamic moon1FillPouch = 0;
  dynamic moon2FillPouch = 0;

  //value data Pouch
  dynamic tahunNowFillTallCan = 0;
  dynamic tahunThenFillTallCan = 0;
  dynamic week1FillTallCan = 0;
  dynamic week2FillTallCan = 0;
  dynamic week3FillTallCan = 0;
  dynamic week4FillTallCan = 0;
  dynamic moon1FillTallCan = 0;
  dynamic moon2FillTallCan = 0;

  //value data Sacet
  dynamic tahunNowFillSacet = 0;
  dynamic tahunThenFillSacet = 0;
  dynamic week1FillSacet = 0;
  dynamic week2FillSacet = 0;
  dynamic week3FillSacet = 0;
  dynamic week4FillSacet = 0;
  dynamic moon1FillSacet = 0;
  dynamic moon2FillSacet = 0;

  final db = FirebaseFirestore.instance;
  List dataProductCtn = [];
  List dataProductProsesTahunNow = [];
  List dataProductProsesTahunThen = [];
  List dataProductFillpackTahunNow = [];
  List dataProductFillpackTahunThen = [];
  List dataProductWeek1Proses = [];
  List dataProductWeek2Proses = [];
  List dataProductWeek3Proses = [];
  List dataProductWeek4Proses = [];
  List dataProductWeek1Fillpack = [];
  List dataProductWeek2Fillpack = [];
  List dataProductWeek3Fillpack = [];
  List dataProductWeek4Fillpack = [];
  List dataProductMoon1Proses = [];
  List dataProductMoon2Proses = [];
  List dataProductMoon1Fillpack = [];
  List dataProductMoon2Fillpack = [];

  List dataProsesSkmTahunNow = [];
  List dataProsesSkmTahunThen = [];
  List dataProsesSkmWeek1 = [];
  List dataProsesSkmWeek2 = [];
  List dataProsesSkmWeek3 = [];
  List dataProsesSkmWeek4 = [];
  List dataProsesSkmMoon1 = [];
  List dataProsesSkmMoon2 = [];

  List datapouchTahunNow = [];
  List datapouchTahunThen = [];
  List datapouchWeek1 = [];
  List datapouchWeek2 = [];
  List datapouchWeek3 = [];
  List datapouchWeek4 = [];
  List datapouchMoon1 = [];
  List datapouchMoon2 = [];

  List dataTallCanTahunNow = [];
  List dataTallCanTahunThen = [];
  List dataTallCanWeek1 = [];
  List dataTallCanWeek2 = [];
  List dataTallCanWeek3 = [];
  List dataTallCanWeek4 = [];
  List dataTallCanMoon1 = [];
  List dataTallCanMoon2 = [];

  List dataSacetTahunNow = [];
  List dataSacetTahunThen = [];
  List dataSacetWeek1 = [];
  List dataSacetWeek2 = [];
  List dataSacetWeek3 = [];
  List dataSacetWeek4 = [];
  List dataSacetMoon1 = [];
  List dataSacetMoon2 = [];

  getTahunNow() async {
    var tahunn = int.parse(tahun);
    QuerySnapshot querySnapshot =
        await db.collection("product").where("tahun", isEqualTo: tahunn).get();
    QuerySnapshot ProsesSkm = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Process_SKM")
        .get();
    QuerySnapshot Pouch = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Pouch")
        .get();
    QuerySnapshot Sacet = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Sachet")
        .get();
    QuerySnapshot TallCan = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Tall_Can")
        .get();

    QuerySnapshot Proses = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("type", isEqualTo: "process")
        .get();
    QuerySnapshot fillpack = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("type", isEqualTo: "fillpack")
        .get();

    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        tahunNowCtn = tahunFix * 100;

        weekSort1 = findMax(List.generate(
            dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        print(weekSort1);
      } else {
        setState(() {
          tahunNowCtn = 0;
          weekSort1 = 4;
        });
      }

      //data Proses Skm
      if (ProsesSkm.docs.isNotEmpty) {
        dataProsesSkmTahunNow =
            ProsesSkm.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProsesSkmTahunNow.length, (index) {
          double x =
              double.parse(dataProsesSkmTahunNow[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProsesSkmTahunNow.length, (index) {
          double x =
              double.parse(dataProsesSkmTahunNow[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        tahunNowProsesSkm = tahunFix * 100;
      } else {
        setState(() {
          tahunNowProsesSkm = 0;
        });
      }

      //data Pouch
      if (Pouch.docs.isNotEmpty) {
        datapouchTahunNow = Pouch.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(datapouchTahunNow.length, (index) {
          double x = double.parse(datapouchTahunNow[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(datapouchTahunNow.length, (index) {
          double x = double.parse(datapouchTahunNow[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        tahunNowFillPouch = tahunFix * 100;
      } else {
        setState(() {
          tahunNowFillPouch = 0;
        });
      }

      //data Sacet
      if (Sacet.docs.isNotEmpty) {
        dataSacetTahunNow = Sacet.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataSacetTahunNow.length, (index) {
          double x = double.parse(dataSacetTahunNow[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataSacetTahunNow.length, (index) {
          double x = double.parse(dataSacetTahunNow[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        tahunNowFillSacet = tahunFix * 100;
      } else {
        setState(() {
          tahunNowFillSacet = 0;
        });
      }

      //data tallcan
      if (TallCan.docs.isNotEmpty) {
        dataTallCanTahunNow = TallCan.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataTallCanTahunNow.length, (index) {
          double x = double.parse(dataTallCanTahunNow[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataTallCanTahunNow.length, (index) {
          double x = double.parse(dataTallCanTahunNow[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        tahunNowFillTallCan = tahunFix * 100;
      } else {
        setState(() {
          tahunNowFillTallCan = 0;
        });
      }

      //data Proses
      if (Proses.docs.isNotEmpty) {
        dataProductProsesTahunNow =
            Proses.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductProsesTahunNow.length, (index) {
          double x = double.parse(dataProductProsesTahunNow[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductProsesTahunNow.length, (index) {
          double x = double.parse(dataProductProsesTahunNow[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductProsesTahunNow.length, (index) {
          double x = double.parse(dataProductProsesTahunNow[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductProsesTahunNow.length, (index) {
          double x = double.parse(dataProductProsesTahunNow[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        tahunNowLeProses = leCuy / dataProductProsesTahunNow.length;
        tahunNowLpProses = lpCuy / dataProductProsesTahunNow.length;
        tahunNowBdProses = bdCuy / dataProductProsesTahunNow.length;
        tahunNowDtProses = dtCuy / dataProductProsesTahunNow.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          tahunNowLeProses = 0;
          tahunNowLpProses = 0;
          tahunNowBdProses = 0;
          tahunNowDtProses = 0;
          //weekSort1 = 4;
        });
      }

//data Proses fillPack
      if (fillpack.docs.isNotEmpty) {
        dataProductFillpackTahunNow =
            fillpack.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductFillpackTahunNow.length, (index) {
          double x = double.parse(dataProductFillpackTahunNow[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductFillpackTahunNow.length, (index) {
          double x = double.parse(dataProductFillpackTahunNow[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductFillpackTahunNow.length, (index) {
          double x = double.parse(dataProductFillpackTahunNow[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductFillpackTahunNow.length, (index) {
          double x = double.parse(dataProductFillpackTahunNow[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        tahunNowLeFillpack = leCuy / dataProductFillpackTahunNow.length;
        tahunNowLpFillpack = lpCuy / dataProductFillpackTahunNow.length;
        tahunNowBdFillpack = bdCuy / dataProductFillpackTahunNow.length;
        tahunNowDtFillPack = dtCuy / dataProductFillpackTahunNow.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          tahunNowLeFillpack = 0;
          tahunNowLpFillpack = 0;
          tahunNowBdFillpack = 0;
          tahunNowDtFillPack = 0;
          //weekSort1 = 4;
        });
      }

      labelTahunNow = tahun.toString();
      getTahunthen();
      getWeek1();
    });
  }

  int findMax(List<int> numbers) {
    return numbers.reduce(max);
  }

  getTahunthen() async {
    var tahunn = int.parse(tahun);
    var Tahun = tahunn - 1;
    QuerySnapshot querySnapshot =
        await db.collection("product").where("tahun", isEqualTo: Tahun).get();
    QuerySnapshot ProsesSkm = await db
        .collection("product")
        .where("tahun", isEqualTo: tahun)
        .where("product", isEqualTo: "Process_SKM")
        .get();
    QuerySnapshot Pouch = await db
        .collection("product")
        .where("tahun", isEqualTo: tahun)
        .where("product", isEqualTo: "Filling_Packing_SKM_Pouch")
        .get();
    QuerySnapshot Sacet = await db
        .collection("product")
        .where("tahun", isEqualTo: tahun)
        .where("product", isEqualTo: "Filling_Packing_SKM_Sachet")
        .get();
    QuerySnapshot TallCan = await db
        .collection("product")
        .where("tahun", isEqualTo: tahun)
        .where("product", isEqualTo: "Filling_Packing_SKM_Tall_Can")
        .get();
    QuerySnapshot Proses = await db
        .collection("product")
        .where("tahun", isEqualTo: Tahun)
        .where("type", isEqualTo: "process")
        .get();
    QuerySnapshot fillpack = await db
        .collection("product")
        .where("tahun", isEqualTo: Tahun)
        .where("type", isEqualTo: "fillpack")
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;

        tahunThenCtn = tahunFix * 100;
      } else {
        setState(() {
          tahunThenCtn = 0;
        });
      }

      //data Proses Skm
      if (ProsesSkm.docs.isNotEmpty) {
        dataProsesSkmTahunThen =
            ProsesSkm.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProsesSkmTahunThen.length, (index) {
          double x =
              double.parse(dataProsesSkmTahunThen[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProsesSkmTahunThen.length, (index) {
          double x =
              double.parse(dataProsesSkmTahunThen[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        tahunThenProsesSkm = tahunFix * 100;
      } else {
        setState(() {
          tahunThenProsesSkm = 0;
        });
      }

      //data Pouch
      if (Pouch.docs.isNotEmpty) {
        datapouchTahunThen = Pouch.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(datapouchTahunThen.length, (index) {
          double x = double.parse(datapouchTahunThen[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(datapouchTahunThen.length, (index) {
          double x = double.parse(datapouchTahunThen[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        tahunThenFillPouch = tahunFix * 100;
      } else {
        setState(() {
          tahunThenFillPouch = 0;
        });
      }

      //data Sacet
      if (Sacet.docs.isNotEmpty) {
        dataSacetTahunThen = Sacet.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataSacetTahunThen.length, (index) {
          double x = double.parse(dataSacetTahunThen[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataSacetTahunThen.length, (index) {
          double x = double.parse(dataSacetTahunThen[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        tahunThenFillSacet = tahunFix * 100;
      } else {
        setState(() {
          tahunThenFillSacet = 0;
        });
      }

      //data tallcan
      if (TallCan.docs.isNotEmpty) {
        dataTallCanTahunThen = TallCan.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataTallCanTahunThen.length, (index) {
          double x = double.parse(dataTallCanTahunThen[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataTallCanTahunThen.length, (index) {
          double x =
              double.parse(dataTallCanTahunThen[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        tahunThenFillTallCan = tahunFix * 100;
      } else {
        setState(() {
          tahunThenFillTallCan = 0;
        });
      }

      //data Proses
      if (Proses.docs.isNotEmpty) {
        dataProductProsesTahunNow =
            Proses.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductProsesTahunNow.length, (index) {
          double x = double.parse(dataProductProsesTahunNow[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductProsesTahunNow.length, (index) {
          double x = double.parse(dataProductProsesTahunNow[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductProsesTahunNow.length, (index) {
          double x = double.parse(dataProductProsesTahunNow[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductProsesTahunNow.length, (index) {
          double x = double.parse(dataProductProsesTahunNow[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        tahunThenLeProses = leCuy / dataProductProsesTahunNow.length;
        tahunThenLpProses = lpCuy / dataProductProsesTahunNow.length;
        tahunThenBdProses = bdCuy / dataProductProsesTahunNow.length;
        tahunThenDtProses = dtCuy / dataProductProsesTahunNow.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          tahunThenLeProses = 0;
          tahunThenLpProses = 0;
          tahunThenBdProses = 0;
          tahunThenDtProses = 0;
          //weekSort1 = 4;
        });
      }

//data Proses fillPack
      if (fillpack.docs.isNotEmpty) {
        dataProductFillpackTahunNow =
            fillpack.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductFillpackTahunNow.length, (index) {
          double x = double.parse(dataProductFillpackTahunNow[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductFillpackTahunNow.length, (index) {
          double x = double.parse(dataProductFillpackTahunNow[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductFillpackTahunNow.length, (index) {
          double x = double.parse(dataProductFillpackTahunNow[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductFillpackTahunNow.length, (index) {
          double x = double.parse(dataProductFillpackTahunNow[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        tahunThenLeFillpack = leCuy / dataProductFillpackTahunNow.length;
        tahunThenLpFillpack = lpCuy / dataProductFillpackTahunNow.length;
        tahunThenBdFillpack = bdCuy / dataProductFillpackTahunNow.length;
        tahunThenDtFillPack = dtCuy / dataProductFillpackTahunNow.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          tahunThenLeFillpack = 0;
          tahunThenLpFillpack = 0;
          tahunThenBdFillpack = 0;
          tahunThenDtFillPack = 0;
          //weekSort1 = 4;
        });
      }

      labelTahunThen = Tahun.toString();
    });
  }

  getWeek1() async {
    var tahunn = int.parse(tahun);

    var weeks1 = weekSort1;
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("week", isEqualTo: weeks1)
        .get();
    QuerySnapshot ProsesSkm = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Process_SKM")
        .where("week", isEqualTo: weeks1)
        .get();
    QuerySnapshot Pouch = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Pouch")
        .where("week", isEqualTo: weeks1)
        .get();
    QuerySnapshot Sacet = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Sachet")
        .where("week", isEqualTo: weeks1)
        .get();
    QuerySnapshot TallCan = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Tall_Can")
        .where("week", isEqualTo: weeks1)
        .get();
    QuerySnapshot Proses = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("type", isEqualTo: "process")
        .where("week", isEqualTo: weeks1)
        .get();
    QuerySnapshot fillpack = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("type", isEqualTo: "fillpack")
        .where("week", isEqualTo: weeks1)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var weekFik = actualO / planingO;

        week1Ctn = weekFik * 100;
      } else {
        setState(() {
          week1Ctn = 0;
        });
      }

      //data Proses Skm
      if (ProsesSkm.docs.isNotEmpty) {
        dataProsesSkmWeek1 = ProsesSkm.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProsesSkmWeek1.length, (index) {
          double x = double.parse(dataProsesSkmWeek1[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProsesSkmWeek1.length, (index) {
          double x = double.parse(dataProsesSkmWeek1[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week1ProsesSkm = tahunFix * 100;
      } else {
        setState(() {
          week1ProsesSkm = 0;
        });
      }

      //data Pouch
      if (Pouch.docs.isNotEmpty) {
        datapouchWeek1 = Pouch.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(datapouchWeek1.length, (index) {
          double x = double.parse(datapouchWeek1[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(datapouchWeek1.length, (index) {
          double x = double.parse(datapouchWeek1[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week1FillPouch = tahunFix * 100;
      } else {
        setState(() {
          week1FillPouch = 0;
        });
      }

      //data Sacet
      if (Sacet.docs.isNotEmpty) {
        dataSacetWeek1 = Sacet.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataSacetWeek1.length, (index) {
          double x = double.parse(dataSacetWeek1[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataSacetWeek1.length, (index) {
          double x = double.parse(dataSacetWeek1[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week1FillSacet = tahunFix * 100;
      } else {
        setState(() {
          week1FillSacet = 0;
        });
      }

      //data tallcan
      if (TallCan.docs.isNotEmpty) {
        dataTallCanWeek1 = TallCan.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataTallCanWeek1.length, (index) {
          double x = double.parse(dataTallCanWeek1[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataTallCanWeek1.length, (index) {
          double x = double.parse(dataTallCanWeek1[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week1FillTallCan = tahunFix * 100;
      } else {
        setState(() {
          week1FillTallCan = 0;
        });
      }

      //data Proses
      if (Proses.docs.isNotEmpty) {
        dataProductWeek1Proses = Proses.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductWeek1Proses.length, (index) {
          double x = double.parse(dataProductWeek1Proses[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductWeek1Proses.length, (index) {
          double x = double.parse(dataProductWeek1Proses[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductWeek1Proses.length, (index) {
          double x = double.parse(dataProductWeek1Proses[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductWeek1Proses.length, (index) {
          double x = double.parse(dataProductWeek1Proses[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        week1LeProses = leCuy / dataProductWeek1Proses.length;
        week1LpProses = lpCuy / dataProductWeek1Proses.length;
        week1BdProses = bdCuy / dataProductWeek1Proses.length;
        week1DtProses = dtCuy / dataProductWeek1Proses.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          week1LeProses = 0;
          week1LpProses = 0;
          week1BdProses = 0;
          week1DtProses = 0;
          //weekSort1 = 4;
        });
      }

//data Proses fillPack
      if (fillpack.docs.isNotEmpty) {
        dataProductWeek1Fillpack =
            fillpack.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductWeek1Fillpack.length, (index) {
          double x = double.parse(dataProductWeek1Fillpack[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductWeek1Fillpack.length, (index) {
          double x = double.parse(dataProductWeek1Fillpack[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductWeek1Fillpack.length, (index) {
          double x = double.parse(dataProductWeek1Fillpack[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductWeek1Fillpack.length, (index) {
          double x = double.parse(dataProductWeek1Fillpack[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        week1LeFillpack = leCuy / dataProductWeek1Fillpack.length;
        week1LpFillpack = lpCuy / dataProductWeek1Fillpack.length;
        week1BdFillpack = bdCuy / dataProductWeek1Fillpack.length;
        week1DtFillPack = dtCuy / dataProductWeek1Fillpack.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          week1LeFillpack = 0;
          week1LpFillpack = 0;
          week1BdFillpack = 0;
          week1DtFillPack = 0;
          //weekSort1 = 4;
        });
      }

      labelWeek1 = weeks1.toString();
      getWeek2();
      getMoon(weeks1);
    });
  }

  getWeek2() async {
    var tahunn = int.parse(tahun);

    var weeks2;
    if (weekSort1 == 1) {
      weeks2 = 0;
    } else {
      weeks2 = weekSort1 - 1;
    }
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("week", isEqualTo: weeks2)
        .get();
    QuerySnapshot ProsesSkm = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Process_SKM")
        .where("week", isEqualTo: weeks2)
        .get();
    QuerySnapshot Pouch = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Pouch")
        .where("week", isEqualTo: weeks2)
        .get();
    QuerySnapshot Sacet = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Sachet")
        .where("week", isEqualTo: weeks2)
        .get();
    QuerySnapshot TallCan = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Tall_Can")
        .where("week", isEqualTo: weeks2)
        .get();
    QuerySnapshot Proses = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("type", isEqualTo: "process")
        .where("week", isEqualTo: weeks2)
        .get();
    QuerySnapshot fillpack = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("type", isEqualTo: "fillpack")
        .where("week", isEqualTo: weeks2)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var weekFik = actualO / planingO;

        week2Ctn = weekFik * 100;
        weekSort2 = weeks2;
      } else {
        setState(() {
          week2Ctn = 0;
          weekSort2 = weeks2;
        });
      }

      //data Proses Skm
      if (ProsesSkm.docs.isNotEmpty) {
        dataProsesSkmWeek2 = ProsesSkm.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProsesSkmWeek2.length, (index) {
          double x = double.parse(dataProsesSkmWeek2[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProsesSkmWeek2.length, (index) {
          double x = double.parse(dataProsesSkmWeek2[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week2ProsesSkm = tahunFix * 100;
      } else {
        setState(() {
          week2ProsesSkm = 0;
        });
      }

      //data Pouch
      if (Pouch.docs.isNotEmpty) {
        datapouchWeek2 = Pouch.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(datapouchWeek2.length, (index) {
          double x = double.parse(datapouchWeek2[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(datapouchWeek2.length, (index) {
          double x = double.parse(datapouchWeek2[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week2FillPouch = tahunFix * 100;
      } else {
        setState(() {
          week2FillPouch = 0;
        });
      }

      //data Sacet
      if (Sacet.docs.isNotEmpty) {
        dataSacetWeek2 = Sacet.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataSacetWeek2.length, (index) {
          double x = double.parse(dataSacetWeek2[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataSacetWeek2.length, (index) {
          double x = double.parse(dataSacetWeek2[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week2FillSacet = tahunFix * 100;
      } else {
        setState(() {
          week2FillSacet = 0;
        });
      }

      //data tallcan
      if (TallCan.docs.isNotEmpty) {
        dataTallCanWeek2 = TallCan.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataTallCanWeek2.length, (index) {
          double x = double.parse(dataTallCanWeek2[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataTallCanWeek2.length, (index) {
          double x = double.parse(dataTallCanWeek2[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week2FillTallCan = tahunFix * 100;
      } else {
        setState(() {
          week2FillTallCan = 0;
        });
      }

      //data Proses
      if (Proses.docs.isNotEmpty) {
        dataProductWeek2Proses = Proses.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductWeek2Proses.length, (index) {
          double x = double.parse(dataProductWeek2Proses[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductWeek2Proses.length, (index) {
          double x = double.parse(dataProductWeek2Proses[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductWeek2Proses.length, (index) {
          double x = double.parse(dataProductWeek2Proses[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductWeek2Proses.length, (index) {
          double x = double.parse(dataProductWeek2Proses[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        week2LeProses = leCuy / dataProductWeek2Proses.length;
        week2LpProses = lpCuy / dataProductWeek2Proses.length;
        week2BdProses = bdCuy / dataProductWeek2Proses.length;
        week2DtProses = dtCuy / dataProductWeek2Proses.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          week2LeProses = 0;
          week2LpProses = 0;
          week2BdProses = 0;
          week2DtProses = 0;
          //weekSort1 = 4;
        });
      }

//data Proses fillPack
      if (fillpack.docs.isNotEmpty) {
        dataProductWeek2Fillpack =
            fillpack.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductWeek2Fillpack.length, (index) {
          double x = double.parse(dataProductWeek2Fillpack[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductWeek2Fillpack.length, (index) {
          double x = double.parse(dataProductWeek2Fillpack[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductWeek2Fillpack.length, (index) {
          double x = double.parse(dataProductWeek2Fillpack[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductWeek2Fillpack.length, (index) {
          double x = double.parse(dataProductWeek2Fillpack[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        week2LeFillpack = leCuy / dataProductWeek2Fillpack.length;
        week2LpFillpack = lpCuy / dataProductWeek2Fillpack.length;
        week2BdFillpack = bdCuy / dataProductWeek2Fillpack.length;
        week2DtFillPack = dtCuy / dataProductWeek2Fillpack.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          week2LeFillpack = 0;
          week2LpFillpack = 0;
          week2BdFillpack = 0;
          week2DtFillPack = 0;
          //weekSort1 = 4;
        });
      }

      labelWeek2 = weeks2.toString();
      getWeek3();
    });
  }

  getWeek3() async {
    var tahunn = int.parse(tahun);

    var weeks3;
    if (weekSort1 == 1) {
      weeks3 = 0;
    } else {
      weeks3 = weekSort2 - 1;
    }
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("week", isEqualTo: weeks3)
        .get();
    QuerySnapshot ProsesSkm = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Process_SKM")
        .where("week", isEqualTo: weeks3)
        .get();
    QuerySnapshot Pouch = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Pouch")
        .where("week", isEqualTo: weeks3)
        .get();
    QuerySnapshot Sacet = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Sachet")
        .where("week", isEqualTo: weeks3)
        .get();
    QuerySnapshot TallCan = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Tall_Can")
        .where("week", isEqualTo: weeks3)
        .get();
    QuerySnapshot Proses = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("type", isEqualTo: "process")
        .where("week", isEqualTo: weeks3)
        .get();
    QuerySnapshot fillpack = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("type", isEqualTo: "fillpack")
        .where("week", isEqualTo: weeks3)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var weekFik = actualO / planingO;

        week3Ctn = weekFik * 100;
        weekSort3 = weeks3;
      } else {
        setState(() {
          week3Ctn = 0;
          weekSort3 = weeks3;
        });
      }

//data Proses Skm
      if (ProsesSkm.docs.isNotEmpty) {
        dataProsesSkmWeek3 = ProsesSkm.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProsesSkmWeek3.length, (index) {
          double x = double.parse(dataProsesSkmWeek3[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProsesSkmWeek3.length, (index) {
          double x = double.parse(dataProsesSkmWeek3[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week3ProsesSkm = tahunFix * 100;
      } else {
        setState(() {
          week3ProsesSkm = 0;
        });
      }

      //data Pouch
      if (Pouch.docs.isNotEmpty) {
        datapouchWeek3 = Pouch.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(datapouchWeek3.length, (index) {
          double x = double.parse(datapouchWeek3[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(datapouchWeek3.length, (index) {
          double x = double.parse(datapouchWeek3[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week3FillPouch = tahunFix * 100;
      } else {
        setState(() {
          week3FillPouch = 0;
        });
      }

      //data Sacet
      if (Sacet.docs.isNotEmpty) {
        dataSacetWeek3 = Sacet.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataSacetWeek3.length, (index) {
          double x = double.parse(dataSacetWeek3[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataSacetWeek3.length, (index) {
          double x = double.parse(dataSacetWeek3[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week3FillSacet = tahunFix * 100;
      } else {
        setState(() {
          week3FillSacet = 0;
        });
      }

      //data tallcan
      if (TallCan.docs.isNotEmpty) {
        dataTallCanWeek3 = TallCan.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataTallCanWeek3.length, (index) {
          double x = double.parse(dataTallCanWeek3[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataTallCanWeek3.length, (index) {
          double x = double.parse(dataTallCanWeek3[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week3FillTallCan = tahunFix * 100;
      } else {
        setState(() {
          week3FillTallCan = 0;
        });
      }
      //data Proses
      if (Proses.docs.isNotEmpty) {
        dataProductWeek3Proses = Proses.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductWeek3Proses.length, (index) {
          double x = double.parse(dataProductWeek3Proses[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductWeek3Proses.length, (index) {
          double x = double.parse(dataProductWeek3Proses[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductWeek3Proses.length, (index) {
          double x = double.parse(dataProductWeek3Proses[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductWeek3Proses.length, (index) {
          double x = double.parse(dataProductWeek3Proses[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        week3LeProses = leCuy / dataProductWeek3Proses.length;
        week3LpProses = lpCuy / dataProductWeek3Proses.length;
        week3BdProses = bdCuy / dataProductWeek3Proses.length;
        week3DtProses = dtCuy / dataProductWeek3Proses.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          week3LeProses = 0;
          week3LpProses = 0;
          week3BdProses = 0;
          week3DtProses = 0;
          //weekSort1 = 4;
        });
      }

//data Proses fillPack
      if (fillpack.docs.isNotEmpty) {
        dataProductWeek3Fillpack =
            fillpack.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductWeek3Fillpack.length, (index) {
          double x = double.parse(dataProductWeek3Fillpack[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductWeek3Fillpack.length, (index) {
          double x = double.parse(dataProductWeek3Fillpack[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductWeek3Fillpack.length, (index) {
          double x = double.parse(dataProductWeek3Fillpack[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductWeek3Fillpack.length, (index) {
          double x = double.parse(dataProductWeek3Fillpack[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        week3LeFillpack = leCuy / dataProductWeek3Fillpack.length;
        week3LpFillpack = lpCuy / dataProductWeek3Fillpack.length;
        week3BdFillpack = bdCuy / dataProductWeek3Fillpack.length;
        week3DtFillPack = dtCuy / dataProductWeek3Fillpack.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          week3LeFillpack = 0;
          week3LpFillpack = 0;
          week3BdFillpack = 0;
          week3DtFillPack = 0;
          //weekSort1 = 4;
        });
      }
      labelWeek3 = weeks3.toString();
      getWeek4();
    });
  }

  getWeek4() async {
    var tahunn = int.parse(tahun);

    var weeks4;
    if (weekSort1 == 1) {
      weeks4 = 0;
    } else {
      weeks4 = weekSort3 - 1;
    }
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("week", isEqualTo: weeks4)
        .get();
    QuerySnapshot ProsesSkm = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Process_SKM")
        .where("week", isEqualTo: weeks4)
        .get();
    QuerySnapshot Pouch = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Pouch")
        .where("week", isEqualTo: weeks4)
        .get();
    QuerySnapshot Sacet = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Sachet")
        .where("week", isEqualTo: weeks4)
        .get();
    QuerySnapshot TallCan = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Tall_Can")
        .where("week", isEqualTo: weeks4)
        .get();
    QuerySnapshot Proses = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("type", isEqualTo: "process")
        .where("week", isEqualTo: weeks4)
        .get();
    QuerySnapshot fillpack = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("type", isEqualTo: "fillpack")
        .where("week", isEqualTo: weeks4)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var weekFik = actualO / planingO;

        week4Ctn = weekFik * 100;
        weekSort4 = weeks4;
      } else {
        setState(() {
          week4Ctn = 0;
          weekSort4 = weeks4;
        });
      }

      //data Proses Skm
      if (ProsesSkm.docs.isNotEmpty) {
        dataProsesSkmWeek4 = ProsesSkm.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProsesSkmWeek4.length, (index) {
          double x = double.parse(dataProsesSkmWeek4[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProsesSkmWeek4.length, (index) {
          double x = double.parse(dataProsesSkmWeek4[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week4ProsesSkm = tahunFix * 100;
      } else {
        setState(() {
          week4ProsesSkm = 0;
        });
      }

      //data Pouch
      if (Pouch.docs.isNotEmpty) {
        datapouchWeek4 = Pouch.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(datapouchWeek4.length, (index) {
          double x = double.parse(datapouchWeek4[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(datapouchWeek4.length, (index) {
          double x = double.parse(datapouchWeek4[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week4FillPouch = tahunFix * 100;
      } else {
        setState(() {
          week4FillPouch = 0;
        });
      }

      //data Sacet
      if (Sacet.docs.isNotEmpty) {
        dataSacetWeek4 = Sacet.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataSacetWeek4.length, (index) {
          double x = double.parse(dataSacetWeek4[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataSacetWeek4.length, (index) {
          double x = double.parse(dataSacetWeek4[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week4FillSacet = tahunFix * 100;
      } else {
        setState(() {
          week4FillSacet = 0;
        });
      }

      //data tallcan
      if (TallCan.docs.isNotEmpty) {
        dataTallCanWeek4 = TallCan.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataTallCanWeek4.length, (index) {
          double x = double.parse(dataTallCanWeek4[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataTallCanWeek4.length, (index) {
          double x = double.parse(dataTallCanWeek4[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        week4FillTallCan = tahunFix * 100;
      } else {
        setState(() {
          week4FillTallCan = 0;
        });
      }

      //data Proses
      if (Proses.docs.isNotEmpty) {
        dataProductWeek4Proses = Proses.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductWeek4Proses.length, (index) {
          double x = double.parse(dataProductWeek4Proses[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductWeek4Proses.length, (index) {
          double x = double.parse(dataProductWeek4Proses[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductWeek4Proses.length, (index) {
          double x = double.parse(dataProductWeek4Proses[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductWeek4Proses.length, (index) {
          double x = double.parse(dataProductWeek4Proses[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        week4LeProses = leCuy / dataProductWeek4Proses.length;
        week4LpProses = lpCuy / dataProductWeek4Proses.length;
        week4BdProses = bdCuy / dataProductWeek4Proses.length;
        week4DtProses = dtCuy / dataProductWeek4Proses.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          week4LeProses = 0;
          week4LpProses = 0;
          week4BdProses = 0;
          week4DtProses = 0;
          //weekSort1 = 4;
        });
      }

//data Proses fillPack
      if (fillpack.docs.isNotEmpty) {
        dataProductWeek4Fillpack =
            fillpack.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductWeek4Fillpack.length, (index) {
          double x = double.parse(dataProductWeek4Fillpack[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductWeek4Fillpack.length, (index) {
          double x = double.parse(dataProductWeek4Fillpack[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductWeek4Fillpack.length, (index) {
          double x = double.parse(dataProductWeek4Fillpack[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductWeek4Fillpack.length, (index) {
          double x = double.parse(dataProductWeek4Fillpack[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        week4LeFillpack = leCuy / dataProductWeek4Fillpack.length;
        week4LpFillpack = lpCuy / dataProductWeek4Fillpack.length;
        week4BdFillpack = bdCuy / dataProductWeek4Fillpack.length;
        week4DtFillPack = dtCuy / dataProductWeek4Fillpack.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          week4LeFillpack = 0;
          week4LpFillpack = 0;
          week4BdFillpack = 0;
          week4DtFillPack = 0;
          //weekSort1 = 4;
        });
      }
      labelWeek4 = weeks4.toString();
    });
  }

  getMoon(weekSort) {
    if (weekSort == 1 || weekSort == 2 || weekSort == 3 || weekSort == 4) {
      setState(() {
        moonSort1 = "January";
        moonSort2 = "-";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 5 ||
        weekSort == 6 ||
        weekSort == 7 ||
        weekSort == 8) {
      setState(() {
        moonSort1 = "February";
        moonSort2 = "January";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 9 ||
        weekSort == 10 ||
        weekSort == 11 ||
        weekSort == 12 ||
        weekSort == 13) {
      setState(() {
        moonSort1 = "March";
        moonSort2 = "February";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 14 ||
        weekSort == 15 ||
        weekSort == 16 ||
        weekSort == 17) {
      setState(() {
        moonSort1 = "April";
        moonSort2 = "March";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 18 ||
        weekSort == 19 ||
        weekSort == 20 ||
        weekSort == 21) {
      setState(() {
        moonSort1 = "May";
        moonSort2 = "April";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 22 ||
        weekSort == 23 ||
        weekSort == 24 ||
        weekSort == 25 ||
        weekSort == 26) {
      setState(() {
        moonSort1 = "June";
        moonSort2 = "May";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 27 ||
        weekSort == 28 ||
        weekSort == 29 ||
        weekSort == 30) {
      setState(() {
        moonSort1 = "July";
        moonSort2 = "June";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 31 ||
        weekSort == 32 ||
        weekSort == 33 ||
        weekSort == 34) {
      setState(() {
        moonSort1 = "August";
        moonSort2 = "July";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 35 ||
        weekSort == 36 ||
        weekSort == 37 ||
        weekSort == 38 ||
        weekSort == 39) {
      setState(() {
        moonSort1 = "September";
        moonSort2 = "August";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 40 ||
        weekSort == 41 ||
        weekSort == 42 ||
        weekSort == 43) {
      setState(() {
        moonSort1 = "October";
        moonSort2 = "September";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 44 ||
        weekSort == 45 ||
        weekSort == 46 ||
        weekSort == 47) {
      setState(() {
        moonSort1 = "November";
        moonSort2 = "October";
        getMoon1(moonSort1, moonSort2);
      });
    } else if (weekSort == 48 ||
        weekSort == 49 ||
        weekSort == 50 ||
        weekSort == 51 ||
        weekSort == 52) {
      setState(() {
        moonSort1 = "December";
        moonSort2 = "November";
        getMoon1(moonSort1, moonSort2);
      });
    }
  }

  getMoon1(moonAwal, moonAkhir) async {
    var tahunn = int.parse(tahun);

    var moon = moonAwal;
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("bulan", isEqualTo: moon)
        .get();
    QuerySnapshot ProsesSkm = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Process_SKM")
        .where("bulan", isEqualTo: moon)
        .get();
    QuerySnapshot Pouch = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Pouch")
        .where("nulan", isEqualTo: moon)
        .get();
    QuerySnapshot Sacet = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Sachet")
        .where("bulan", isEqualTo: moon)
        .get();
    QuerySnapshot TallCan = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Tall_Can")
        .where("bulan", isEqualTo: moon)
        .get();
    QuerySnapshot Proses = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("type", isEqualTo: "process")
        .where("bulan", isEqualTo: moon)
        .get();
    QuerySnapshot fillpack = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("type", isEqualTo: "fillpack")
        .where("bulan", isEqualTo: moon)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var moonFik = actualO / planingO;

        moon1Ctn = moonFik * 100;
        moonSort1 = moon;
      } else {
        setState(() {
          moon1Ctn = 0;
        });
      }

      //data Proses Skm
      if (ProsesSkm.docs.isNotEmpty) {
        dataProsesSkmMoon1 = ProsesSkm.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProsesSkmMoon1.length, (index) {
          double x = double.parse(dataProsesSkmMoon1[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProsesSkmMoon1.length, (index) {
          double x = double.parse(dataProsesSkmMoon1[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        moon1ProsesSkm = tahunFix * 100;
      } else {
        setState(() {
          moon1ProsesSkm = 0;
        });
      }

      //data Pouch
      if (Pouch.docs.isNotEmpty) {
        datapouchMoon1 = Pouch.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(datapouchMoon1.length, (index) {
          double x = double.parse(datapouchMoon1[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(datapouchMoon1.length, (index) {
          double x = double.parse(datapouchMoon1[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        moon1FillPouch = tahunFix * 100;
      } else {
        setState(() {
          moon1FillPouch = 0;
        });
      }

      //data Sacet
      if (Sacet.docs.isNotEmpty) {
        dataSacetMoon1 = Sacet.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataSacetMoon1.length, (index) {
          double x = double.parse(dataSacetMoon1[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataSacetMoon1.length, (index) {
          double x = double.parse(dataSacetMoon1[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        moon1FillSacet = tahunFix * 100;
      } else {
        setState(() {
          moon1FillSacet = 0;
        });
      }

      //data tallcan
      if (TallCan.docs.isNotEmpty) {
        dataTallCanMoon1 = TallCan.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataTallCanMoon1.length, (index) {
          double x = double.parse(dataTallCanMoon1[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataTallCanMoon1.length, (index) {
          double x = double.parse(dataTallCanMoon1[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        moon1FillTallCan = tahunFix * 100;
      } else {
        setState(() {
          moon1FillTallCan = 0;
        });
      }

      //data Proses
      if (Proses.docs.isNotEmpty) {
        dataProductMoon1Proses = Proses.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductMoon1Proses.length, (index) {
          double x = double.parse(dataProductMoon1Proses[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductMoon1Proses.length, (index) {
          double x = double.parse(dataProductMoon1Proses[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductMoon1Proses.length, (index) {
          double x = double.parse(dataProductMoon1Proses[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductMoon1Proses.length, (index) {
          double x = double.parse(dataProductMoon1Proses[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        moon1LeProses = leCuy / dataProductMoon1Proses.length;
        moon1LpProses = lpCuy / dataProductMoon1Proses.length;
        moon1BdProses = bdCuy / dataProductMoon1Proses.length;
        moon1DtProses = dtCuy / dataProductMoon1Proses.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          moon1LeProses = 0;
          moon1LpProses = 0;
          moon1BdProses = 0;
          moon1DtProses = 0;
          //weekSort1 = 4;
        });
      }

//data Proses fillPack
      if (fillpack.docs.isNotEmpty) {
        dataProductMoon1Fillpack =
            fillpack.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductMoon1Fillpack.length, (index) {
          double x = double.parse(dataProductMoon1Fillpack[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductMoon1Fillpack.length, (index) {
          double x = double.parse(dataProductMoon1Fillpack[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductMoon1Fillpack.length, (index) {
          double x = double.parse(dataProductMoon1Fillpack[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductMoon1Fillpack.length, (index) {
          double x = double.parse(dataProductMoon1Fillpack[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        moon1LeFillpack = leCuy / dataProductMoon1Fillpack.length;
        moon1LpFillpack = lpCuy / dataProductMoon1Fillpack.length;
        moon1BdFillpack = bdCuy / dataProductMoon1Fillpack.length;
        moon1DtFillPack = dtCuy / dataProductMoon1Fillpack.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          moon1LeFillpack = 0;
          moon1LpFillpack = 0;
          moon1BdFillpack = 0;
          moon1DtFillPack = 0;
          //weekSort1 = 4;
        });
      }
      labelmoon1 = moon.toString();
      getMoon2(moonAkhir);
    });
  }

  getMoon2(moonAkhir) async {
    var tahunn = int.parse(tahun);

    var moon = moonAkhir;
    QuerySnapshot querySnapshot = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("bulan", isEqualTo: moon)
        .get();
    QuerySnapshot ProsesSkm = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Process_SKM")
        .where("bulan", isEqualTo: moon)
        .get();
    QuerySnapshot Pouch = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Pouch")
        .where("nulan", isEqualTo: moon)
        .get();
    QuerySnapshot Sacet = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Sachet")
        .where("bulan", isEqualTo: moon)
        .get();
    QuerySnapshot TallCan = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("product", isEqualTo: "Filling_Packing_SKM_Tall_Can")
        .where("bulan", isEqualTo: moon)
        .get();
    QuerySnapshot Proses = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("type", isEqualTo: "process")
        .where("bulan", isEqualTo: moon)
        .get();
    QuerySnapshot fillpack = await db
        .collection("product")
        .where("tahun", isEqualTo: tahunn)
        .where("type", isEqualTo: "fillpack")
        .where("bulan", isEqualTo: moon)
        .get();
    setState(() {
      if (querySnapshot.docs.isNotEmpty) {
        dataProductCtn = querySnapshot.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProductCtn.length, (index) {
          double x = double.parse(dataProductCtn[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var moonFik = actualO / planingO;

        moon2Ctn = moonFik * 100;
        moonSort2 = moon;
      } else {
        setState(() {
          moon2Ctn = 0;
        });
      }

      //data Proses Skm
      if (ProsesSkm.docs.isNotEmpty) {
        dataProsesSkmMoon2 = ProsesSkm.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataProsesSkmMoon2.length, (index) {
          double x = double.parse(dataProsesSkmMoon2[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataProsesSkmMoon2.length, (index) {
          double x = double.parse(dataProsesSkmMoon2[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        moon2ProsesSkm = tahunFix * 100;
      } else {
        setState(() {
          moon2ProsesSkm = 0;
        });
      }

      //data Pouch
      if (Pouch.docs.isNotEmpty) {
        datapouchMoon2 = Pouch.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(datapouchMoon2.length, (index) {
          double x = double.parse(datapouchMoon2[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(datapouchMoon2.length, (index) {
          double x = double.parse(datapouchMoon2[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        moon2FillPouch = tahunFix * 100;
      } else {
        setState(() {
          moon2FillPouch = 0;
        });
      }

      //data Sacet
      if (Sacet.docs.isNotEmpty) {
        dataSacetMoon2 = Sacet.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataSacetMoon2.length, (index) {
          double x = double.parse(dataSacetMoon2[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataSacetMoon2.length, (index) {
          double x = double.parse(dataSacetMoon2[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        moon2FillSacet = tahunFix * 100;
      } else {
        setState(() {
          moon2FillSacet = 0;
        });
      }

      //data tallcan
      if (TallCan.docs.isNotEmpty) {
        dataTallCanMoon2 = TallCan.docs.map((doc) => doc.data()).toList();

        var actualO = List.generate(dataTallCanMoon2.length, (index) {
          double x = double.parse(dataTallCanMoon2[index]['actual_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var planingO = List.generate(dataTallCanMoon2.length, (index) {
          double x = double.parse(dataTallCanMoon2[index]['planing_output']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        var tahunFix = actualO / planingO;
        moon2FillTallCan = tahunFix * 100;
      } else {
        setState(() {
          moon2FillTallCan = 0;
        });
      }

      //data Proses
      if (Proses.docs.isNotEmpty) {
        dataProductMoon2Proses = Proses.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductMoon2Proses.length, (index) {
          double x = double.parse(dataProductMoon2Proses[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductMoon2Proses.length, (index) {
          double x = double.parse(dataProductMoon2Proses[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductMoon2Proses.length, (index) {
          double x = double.parse(dataProductMoon2Proses[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductMoon2Proses.length, (index) {
          double x = double.parse(dataProductMoon2Proses[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        moon2LeProses = leCuy / dataProductMoon2Proses.length;
        moon2LpProses = lpCuy / dataProductMoon2Proses.length;
        moon2BdProses = bdCuy / dataProductMoon2Proses.length;
        moon2DtProses = dtCuy / dataProductMoon2Proses.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          moon2LeProses = 0;
          moon2LpProses = 0;
          moon2BdProses = 0;
          moon2DtProses = 0;
          //weekSort1 = 4;
        });
      }

//data Proses fillPack
      if (fillpack.docs.isNotEmpty) {
        dataProductMoon2Fillpack =
            fillpack.docs.map((doc) => doc.data()).toList();

        var leCuy = List.generate(dataProductMoon2Fillpack.length, (index) {
          double x = double.parse(dataProductMoon2Fillpack[index]['le']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var lpCuy = List.generate(dataProductMoon2Fillpack.length, (index) {
          double x = double.parse(dataProductMoon2Fillpack[index]['lp']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var bdCuy = List.generate(dataProductMoon2Fillpack.length, (index) {
          double x = double.parse(dataProductMoon2Fillpack[index]['bd']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);
        var dtCuy = List.generate(dataProductMoon2Fillpack.length, (index) {
          double x = double.parse(dataProductMoon2Fillpack[index]['dt']);
          String z = x.toStringAsFixed(0);
          int a = int.parse(z);

          return a;
        }).fold(0, (p, c) => p + c);

        moon2LeFillpack = leCuy / dataProductMoon2Fillpack.length;
        moon2LpFillpack = lpCuy / dataProductMoon2Fillpack.length;
        moon2BdFillpack = bdCuy / dataProductMoon2Fillpack.length;
        moon2DtFillPack = dtCuy / dataProductMoon2Fillpack.length;

        // weekSort1 = findMax(List.generate(
        //     dataProductCtn.length, (index) => dataProductCtn[index]['week']));
        // print(weekSort1);
      } else {
        setState(() {
          moon2LeFillpack = 0;
          moon2LpFillpack = 0;
          moon2BdFillpack = 0;
          moon2DtFillPack = 0;
          //weekSort1 = 4;
        });
      }
      labelmoon2 = moon.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    double mediaQuery = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        DashboardContainer(
            width: mediaQuery * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Performance Dashboard",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text("Filter Week",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: light,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: CustomSearchableDropDown(
                                enabled: true,
                                items: [
                                  1,
                                  2,
                                  3,
                                  4,
                                  5,
                                  6,
                                  7,
                                  8,
                                  9,
                                  10,
                                  11,
                                  12,
                                  13,
                                  14,
                                  15,
                                  16,
                                  17,
                                  18,
                                  19,
                                  20,
                                  21,
                                  22,
                                  23,
                                  24,
                                  25,
                                  26,
                                  27,
                                  28,
                                  29,
                                  30,
                                  31,
                                  32,
                                  33,
                                  34,
                                  35,
                                  36,
                                  37,
                                  38,
                                  39,
                                  40,
                                  41,
                                  42,
                                  43,
                                  44,
                                  45,
                                  46,
                                  47,
                                  48,
                                  49,
                                  50,
                                  51,
                                  52
                                ],
                                label: 'Pilih Week...',
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: dark.withOpacity(0.5))),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Icon(Icons.search),
                                ),
                                dropDownMenuItems: [
                                  1,
                                  2,
                                  3,
                                  4,
                                  5,
                                  6,
                                  7,
                                  8,
                                  9,
                                  10,
                                  11,
                                  12,
                                  13,
                                  14,
                                  15,
                                  16,
                                  17,
                                  18,
                                  19,
                                  20,
                                  21,
                                  22,
                                  23,
                                  24,
                                  25,
                                  26,
                                  27,
                                  28,
                                  29,
                                  30,
                                  31,
                                  32,
                                  33,
                                  34,
                                  35,
                                  36,
                                  37,
                                  38,
                                  39,
                                  40,
                                  41,
                                  42,
                                  43,
                                  44,
                                  45,
                                  46,
                                  47,
                                  48,
                                  49,
                                  50,
                                  51,
                                  52
                                ],
                                onChanged: (a) {
                                  setState(() {
                                    weekSort1 = a;
                                  });
                                  getWeek1();
                                },
                              ),
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Filter Year",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: light,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: CustomSearchableDropDown(
                                enabled: true,
                                items: Calender().year,
                                label: 'Pilih Tahun...',
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: dark.withOpacity(0.5))),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Icon(Icons.search),
                                ),
                                dropDownMenuItems: Calender().year,
                                onChanged: (a) {
                                  setState(() {
                                    tahun = a;
                                  });
                                  getTahunNow();
                                  getWeek1();
                                },
                              ),
                            )),
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                      decoration: BoxDecoration(
                          color: blue, borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 40, left: 40, top: 8, bottom: 8),
                        child: Text(
                          "PRODUCTIVITY",
                          style: TextStyle(
                              color: light,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Bar 1
                        ChartProductivity(
                            title: "Production Archievement (CTN)",
                            labelMoon1: labelmoon1,
                            labelMoon2: labelmoon2,
                            labelTahunNow: labelTahunNow,
                            labelTahunThen: labelTahunThen,
                            labelWeek1: labelWeek1,
                            labelWeek2: labelWeek2,
                            labelWeek3: labelWeek3,
                            labelWeek4: labelWeek4,
                            moon1: moon1Ctn,
                            moon2: moon2Ctn,
                            tahunNow: tahunNowCtn,
                            tahunThen: tahunThenCtn,
                            week1: week1Ctn,
                            week2: week2Ctn,
                            week3: week3Ctn,
                            week4: week4Ctn),
                        // Bar 2
                        ChartProductivity(
                            title: "LE Proses",
                            labelMoon1: labelmoon1,
                            labelMoon2: labelmoon2,
                            labelTahunNow: labelTahunNow,
                            labelTahunThen: labelTahunThen,
                            labelWeek1: labelWeek1,
                            labelWeek2: labelWeek2,
                            labelWeek3: labelWeek3,
                            labelWeek4: labelWeek4,
                            moon1: moon1LeProses,
                            moon2: moon2LeProses,
                            tahunNow: tahunNowLeProses,
                            tahunThen: tahunThenLeProses,
                            week1: week1LeProses,
                            week2: week2LeProses,
                            week3: week3LeProses,
                            week4: week4LeProses)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Bar 3
                        ChartProductivity(
                            title: "LE FillPack",
                            labelMoon1: labelmoon1,
                            labelMoon2: labelmoon2,
                            labelTahunNow: labelTahunNow,
                            labelTahunThen: labelTahunThen,
                            labelWeek1: labelWeek1,
                            labelWeek2: labelWeek2,
                            labelWeek3: labelWeek3,
                            labelWeek4: labelWeek4,
                            moon1: moon1LeFillpack,
                            moon2: moon2LeFillpack,
                            tahunNow: tahunNowLeFillpack,
                            tahunThen: tahunThenLeFillpack,
                            week1: week1LeFillpack,
                            week2: week2LeFillpack,
                            week3: week3LeFillpack,
                            week4: week4LeFillpack),
                        // Bar 4
                        ChartProductivity(
                            title: "LP Proses",
                            labelMoon1: labelmoon1,
                            labelMoon2: labelmoon2,
                            labelTahunNow: labelTahunNow,
                            labelTahunThen: labelTahunThen,
                            labelWeek1: labelWeek1,
                            labelWeek2: labelWeek2,
                            labelWeek3: labelWeek3,
                            labelWeek4: labelWeek4,
                            moon1: moon1LpProses,
                            moon2: moon2LpProses,
                            tahunNow: tahunNowLpProses,
                            tahunThen: tahunThenLpProses,
                            week1: week1LpProses,
                            week2: week2LpProses,
                            week3: week3LpProses,
                            week4: week4LpProses)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Bar 3
                        ChartProductivity(
                            title: "LP FillPack",
                            labelMoon1: labelmoon1,
                            labelMoon2: labelmoon2,
                            labelTahunNow: labelTahunNow,
                            labelTahunThen: labelTahunThen,
                            labelWeek1: labelWeek1,
                            labelWeek2: labelWeek2,
                            labelWeek3: labelWeek3,
                            labelWeek4: labelWeek4,
                            moon1: moon1LpFillpack,
                            moon2: moon2LpFillpack,
                            tahunNow: tahunNowLpFillpack,
                            tahunThen: tahunThenLpFillpack,
                            week1: week1LpFillpack,
                            week2: week2LpFillpack,
                            week3: week3LpFillpack,
                            week4: week4LpFillpack),
                        // Bar 4
                        ChartProductivity(
                            title: "DT Proses",
                            labelMoon1: labelmoon1,
                            labelMoon2: labelmoon2,
                            labelTahunNow: labelTahunNow,
                            labelTahunThen: labelTahunThen,
                            labelWeek1: labelWeek1,
                            labelWeek2: labelWeek2,
                            labelWeek3: labelWeek3,
                            labelWeek4: labelWeek4,
                            moon1: moon1DtProses,
                            moon2: moon2DtProses,
                            tahunNow: tahunNowDtProses,
                            tahunThen: tahunThenDtProses,
                            week1: week1DtProses,
                            week2: week2DtProses,
                            week3: week3DtProses,
                            week4: week4DtProses)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Bar 3
                        ChartProductivity(
                            title: "DT FillPack",
                            labelMoon1: labelmoon1,
                            labelMoon2: labelmoon2,
                            labelTahunNow: labelTahunNow,
                            labelTahunThen: labelTahunThen,
                            labelWeek1: labelWeek1,
                            labelWeek2: labelWeek2,
                            labelWeek3: labelWeek3,
                            labelWeek4: labelWeek4,
                            moon1: moon1DtFillPack,
                            moon2: moon2DtFillPack,
                            tahunNow: tahunNowDtFillPack,
                            tahunThen: tahunThenDtFillPack,
                            week1: week1DtFillPack,
                            week2: week2DtFillPack,
                            week3: week3DtFillPack,
                            week4: week4DtFillPack),
                        // Bar 4
                        ChartProductivity(
                            title: "BD Proses",
                            labelMoon1: labelmoon1,
                            labelMoon2: labelmoon2,
                            labelTahunNow: labelTahunNow,
                            labelTahunThen: labelTahunThen,
                            labelWeek1: labelWeek1,
                            labelWeek2: labelWeek2,
                            labelWeek3: labelWeek3,
                            labelWeek4: labelWeek4,
                            moon1: moon1BdProses,
                            moon2: moon2BdProses,
                            tahunNow: tahunNowBdProses,
                            tahunThen: tahunThenBdProses,
                            week1: week1BdProses,
                            week2: week2BdProses,
                            week3: week3BdProses,
                            week4: week4BdProses)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Bar 3
                        ChartProductivity(
                            title: "BD FillPack",
                            labelMoon1: labelmoon1,
                            labelMoon2: labelmoon2,
                            labelTahunNow: labelTahunNow,
                            labelTahunThen: labelTahunThen,
                            labelWeek1: labelWeek1,
                            labelWeek2: labelWeek2,
                            labelWeek3: labelWeek3,
                            labelWeek4: labelWeek4,
                            moon1: moon1BdFillpack,
                            moon2: moon2BdFillpack,
                            tahunNow: tahunNowBdFillpack,
                            tahunThen: tahunThenBdFillpack,
                            week1: week1BdFillpack,
                            week2: week2BdFillpack,
                            week3: week3BdFillpack,
                            week4: week4BdFillpack),
                        // Bar 4
                        ChartProductivity(
                            title: "Proses SKM",
                            labelMoon1: labelmoon1,
                            labelMoon2: labelmoon2,
                            labelTahunNow: labelTahunNow,
                            labelTahunThen: labelTahunThen,
                            labelWeek1: labelWeek1,
                            labelWeek2: labelWeek2,
                            labelWeek3: labelWeek3,
                            labelWeek4: labelWeek4,
                            moon1: moon1ProsesSkm,
                            moon2: moon2ProsesSkm,
                            tahunNow: tahunNowProsesSkm,
                            tahunThen: tahunThenProsesSkm,
                            week1: week1ProsesSkm,
                            week2: week2ProsesSkm,
                            week3: week3ProsesSkm,
                            week4: week4ProsesSkm),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Bar 3
                        ChartProductivity(
                            title: "Filling Packing SKM Pouch",
                            labelMoon1: labelmoon1,
                            labelMoon2: labelmoon2,
                            labelTahunNow: labelTahunNow,
                            labelTahunThen: labelTahunThen,
                            labelWeek1: labelWeek1,
                            labelWeek2: labelWeek2,
                            labelWeek3: labelWeek3,
                            labelWeek4: labelWeek4,
                            moon1: moon1FillPouch,
                            moon2: moon2FillPouch,
                            tahunNow: tahunNowFillPouch,
                            tahunThen: tahunThenFillPouch,
                            week1: week1FillPouch,
                            week2: week2FillPouch,
                            week3: week3FillPouch,
                            week4: week4FillPouch),
                        // Bar 4
                        ChartProductivity(
                            title: "Filling Packing SKM Tall Can",
                            labelMoon1: labelmoon1,
                            labelMoon2: labelmoon2,
                            labelTahunNow: labelTahunNow,
                            labelTahunThen: labelTahunThen,
                            labelWeek1: labelWeek1,
                            labelWeek2: labelWeek2,
                            labelWeek3: labelWeek3,
                            labelWeek4: labelWeek4,
                            moon1: moon1FillTallCan,
                            moon2: moon2FillTallCan,
                            tahunNow: tahunNowFillTallCan,
                            tahunThen: tahunThenFillTallCan,
                            week1: week1FillTallCan,
                            week2: week2FillTallCan,
                            week3: week3FillTallCan,
                            week4: week4FillTallCan),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Bar 3
                        ChartProductivity(
                            title: "Filling Packing SKM Sachet",
                            labelMoon1: labelmoon1,
                            labelMoon2: labelmoon2,
                            labelTahunNow: labelTahunNow,
                            labelTahunThen: labelTahunThen,
                            labelWeek1: labelWeek1,
                            labelWeek2: labelWeek2,
                            labelWeek3: labelWeek3,
                            labelWeek4: labelWeek4,
                            moon1: moon1FillSacet,
                            moon2: moon2FillSacet,
                            tahunNow: tahunNowFillSacet,
                            tahunThen: tahunThenFillSacet,
                            week1: week1FillSacet,
                            week2: week2FillSacet,
                            week3: week3FillSacet,
                            week4: week4FillSacet),
                        // Bar 4
                      ],
                    ),
                  ],
                )
              ],
            )),
      ],
    );
  }
}

class Data {
  static Color getColor(double value) {
    return Colors.amber.shade900;
  }

  static Color getColor1(double value) {
    return Colors.amber.shade600;
  }

  static Color getColor2(double value) {
    return Colors.amber.shade300;
  }

  static Icon getIcon(double value) {
    return Icon(Icons.percent, size: 15);
  }
}

class Calender {
  dynamic year = [
    "2023",
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030",
    "2031",
    "2032",
    "2033",
    "2034",
    "2035",
    "2036",
    "2037",
    "2038",
    "2039",
    "2040",
    "2041",
  ];

  dynamic calender = [
    {
      "week": [1, 2, 3, 4],
      "month": "jan"
    },
    {
      "week": [5, 6, 7, 8],
      "month": "feb"
    }
  ];
}
