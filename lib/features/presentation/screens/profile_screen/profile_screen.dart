import 'package:fabrics_design/utils/constants/image_strings.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Screen",
          style: TextStyle(
            fontSize: ZohSizes.spaceBtwZoh,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(children: [
        Image(image: AssetImage(ZohImageStrings.emptyBasket))
      ]),
    );
  }
}
