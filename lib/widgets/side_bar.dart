import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:indlkt_proj/methods/auth_methods.dart';
import 'package:indlkt_proj/screens/dashboard_screens/dashboard_screen.dart';
import 'package:indlkt_proj/screens/login_screen/login_screen.dart';
import 'package:indlkt_proj/screens/product_acv_screens/product_acv_form.dart';
import 'package:sidebarx/sidebarx.dart';
import '../constants/style.dart';
import '../screens/data_master_screens/data_master_screen.dart';
import '../screens/product_acv_screens/product_acv_screen.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {

  List list = [
    DashboardScreen(),
    ProductAcvScreen(),
    DataMasterScreen(),
    FormInputData()
  ];
  int selectedIndex = 2;
  int selectedIndexDisplay = 2;

  bool auth = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: selectedIndex == 1
          ? Padding(
              padding: const EdgeInsets.only(right: 60, bottom: 30),
              child: ExpandableFab(
                distance: 80,
                childrenOffset: Offset(10, 10),
                backgroundColor: active,
                child: Icon(Icons.add, color: light),
                collapsedFabSize: ExpandableFabSize.regular,
                expandedFabSize: ExpandableFabSize.regular,
                type: ExpandableFabType.up,
                children: [
                  FloatingActionButton.small(
                    backgroundColor: active,
                    heroTag: null,
                    child: ImageIcon(
                      AssetImage("assets/images/fab_logo1.png"),
                      color: light,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = 3;
                        selectedIndexDisplay = 1;
                      });
                    },
                  ),
                  FloatingActionButton.small(
                    backgroundColor: active,
                    child: ImageIcon(
                      AssetImage("assets/images/fab_logo2.png"),
                      color: light,
                      size: 20,
                    ),
                    heroTag: null,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          : null,
      body: Row(
        children: [
          SidebarX(
            controller: SidebarXController(selectedIndex: selectedIndexDisplay),
            theme: SidebarXTheme(
              decoration: BoxDecoration(
                color: blue,
              ),
              hoverColor: Color.fromARGB(255, 217, 216, 216),
              textStyle: TextStyle(color: dark),
              selectedTextStyle: const TextStyle(color: Colors.white),
              itemMargin: const EdgeInsets.only(left: 13, right: 13, bottom: 5),
              itemPadding: const EdgeInsets.all(11),
              selectedItemPadding: const EdgeInsets.all(11),
              selectedItemMargin:
                  const EdgeInsets.only(left: 13, right: 13, bottom: 5),
              itemTextPadding: const EdgeInsets.only(left: 10),
              selectedItemTextPadding: const EdgeInsets.only(left: 10),
              itemDecoration: BoxDecoration(
                color: light,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: dark),
              ),
              selectedItemDecoration: BoxDecoration(
                color: active,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFF5F5FA7).withOpacity(0.37),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.28),
                    blurRadius: 30,
                  )
                ],
              ),
              iconTheme: IconThemeData(
                color: Color.fromARGB(255, 108, 107, 107),
                size: 20,
              ),
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 20,
              ),
            ),
            headerBuilder: (context, extended) {
              return SizedBox(
                height: 115,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 60),
                    decoration: BoxDecoration(
                        color: light,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              );
            },
            extendedTheme: const SidebarXTheme(
              width: 175,
            ),
            footerDivider: auth
                ? Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: InkWell(
                      onTap: () {
                        AuthMethods().signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(pageBuilder: (BuildContext context,
                                Animation animation,
                                Animation secondaryAnimation) {
                              return LoginScreen();
                            }, transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child) {
                              return new ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            }),
                            (Route route) => false);
                      },
                      hoverColor: const Color.fromARGB(255, 188, 187, 187),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Flexible(
                                child: Icon(
                              Icons.logout,
                              color: active,
                            )),
                            SizedBox(width: 10),
                            SizedBox(width: 10),
                            SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "Logout",
                                style: TextStyle(color: active),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : null,
            items: [
              SidebarXItem(
                  iconWidget: ImageIcon(
                    AssetImage("assets/images/dashboard_logo.png"),
                    size: 15,
                  ),
                  label: 'Dashboard',
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                      selectedIndexDisplay = 0;
                    });
                  }),
              SidebarXItem(
                  iconWidget: ImageIcon(
                    AssetImage("assets/images/production_logo.png"),
                    size: 15,
                  ),
                  label: 'Production Acv',
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                      selectedIndexDisplay = 1;
                    });
                  }),
              SidebarXItem(
                  iconWidget: ImageIcon(
                    AssetImage("assets/images/master_logo.png"),
                    size: 15,
                  ),
                  label: 'Data Master',
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                      selectedIndexDisplay = 2;
                    });
                  }),
            ],
          ),
          Flexible(
              child: Container(
                  child: Center(
            child: list[selectedIndex],
          )))
        ],
      ),
    );
  }
}
