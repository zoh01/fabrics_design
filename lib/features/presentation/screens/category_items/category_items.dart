import 'package:fabrics_design/features/domain/models/fabrics_model.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final String category;
  final List<FabricsModel> categoryItems;
  const CategoryItems({super.key, required this.category, required this.categoryItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Column(children: [],)),
    );
  }
}
