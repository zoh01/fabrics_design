import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:fabrics_design/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../custom_shapes/curved_edges_widgets.dart';
import 'circular_container.dart';

class ZohPrimaryHeaderContainer extends StatelessWidget {
  const ZohPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ZCurvedEdgeWidget(
      child: Container(
        color: ZohColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -170,
              child: ZCircularContainer(
                width: ZohHelperFunctions.screenWidth(),
                height: ZohHelperFunctions.screenHeight() * 0.35,
                padding: 0,
                radius: 400,
                backgroundColor: ZohColors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: ZohSizes.spaceBtwSections * 1.6,
              child: ZCircularContainer(
                width: ZohHelperFunctions.screenWidth(),
                height: ZohHelperFunctions.screenHeight() * .2,
                padding: 0,
                radius: 400,
                backgroundColor: ZohColors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              bottom: -140,
              child: ZCircularContainer(
                width: ZohHelperFunctions.screenWidth(),
                height: ZohHelperFunctions.screenHeight() * 0.4,
                padding: 0,
                radius: 400,
                backgroundColor: ZohColors.white.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}