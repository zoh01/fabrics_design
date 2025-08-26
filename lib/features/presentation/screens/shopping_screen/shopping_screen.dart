import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Shopping Screen', style: TextStyle(fontSize: ZohSizes.spaceBtwSections),),
      ),
    );
  }
}
