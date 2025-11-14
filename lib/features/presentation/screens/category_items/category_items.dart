import 'package:fabrics_design/features/domain/models/fabrics_model.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final String category;
  final List<FabricsModel> categoryItems;
  const CategoryItems({super.key, required this.category, required this.categoryItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      ),
      body: SafeArea(child: Column(children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
        Row(children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new),
          ),
          SizedBox(width: ZohSizes.sm,),
          Expanded(child: SizedBox(height: ZohSizes.spaceBtwSections,))
        ],)
      ],)),
    );
  }
}
