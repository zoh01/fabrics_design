import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper_functions/helper_functions.dart';


class CarouselImages extends StatelessWidget {
  const CarouselImages({required this.images, super.key});

  final String images;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ZohSizes.md),
      child: Image.asset(
        images,
        width: ZohHelperFunctions.screenWidth() * .9,
        fit: BoxFit.cover,
      ),
    );
  }
}
