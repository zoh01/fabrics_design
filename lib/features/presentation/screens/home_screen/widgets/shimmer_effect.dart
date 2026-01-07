import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helper_functions/helper_functions.dart';

class ZohShimmerEffect extends StatelessWidget {
  const ZohShimmerEffect(
      {super.key,
        required this.width,
        required this.height,
        this.radius = 14,
        this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? ZohColors.white : ZohColors.darkerGrey),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}