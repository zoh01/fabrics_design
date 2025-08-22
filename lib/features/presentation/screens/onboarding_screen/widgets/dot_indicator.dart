import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';


class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key, required this.isActiveDot,
  });

  final bool isActiveDot;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ZohSizes.sm,
      width: isActiveDot ? ZohSizes.spaceBtwSections * 1.2 : ZohSizes.spaceBtwZoh,
      decoration: BoxDecoration(
        color: isActiveDot ? ZohColors.primaryColor : ZohColors.bgColor,
        borderRadius: BorderRadius.circular(ZohSizes.xs),
      ),
    );
  }
}