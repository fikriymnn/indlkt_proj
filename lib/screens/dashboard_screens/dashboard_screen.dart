import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/slide_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideBar(),
    );
  }
}
