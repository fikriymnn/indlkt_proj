import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/custom_container.dart';

import '../../widgets/appbar.dart';

class ProductAcvScreen extends StatefulWidget {
  const ProductAcvScreen({super.key});

  @override
  State<ProductAcvScreen> createState() => _ProductAcvScreenState();
}

class _ProductAcvScreenState extends State<ProductAcvScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Product Acv"),
      body: CustomContainer(child: Text("hai")),
    );
  }
}
