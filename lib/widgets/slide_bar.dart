import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../constants/style.dart';

class SlideBar extends StatefulWidget {
  const SlideBar({super.key});

  @override
  State<SlideBar> createState() => _SlideBarState();
}

class _SlideBarState extends State<SlideBar> {
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: SidebarXController(selectedIndex: 0),
      theme: SidebarXTheme(
        decoration: BoxDecoration(
          color: blue,
        ),
        hoverColor: Color(0xFF464667),
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFF464667)),
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
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 150,
      ),
      footerDivider: Divider(color: Colors.white, height: 1),
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: Container(
              color: light,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
        );
      },
      items: const [
        SidebarXItem(icon: Icons.home, label: 'Home'),
        SidebarXItem(icon: Icons.search, label: 'Search'),
      ],
    );
  }
}
