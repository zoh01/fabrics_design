import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper_functions/helper_functions.dart';


class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.sunTitle,
  });

  final String image, title, sunTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(image),
          height: ZohHelperFunctions.screenHeight() * .4,
          fit: BoxFit.contain,
        ),
        Spacer(),
        Text(
          title,
          style: GoogleFonts.breeSerif(
            fontSize: ZohSizes.defaultSpace,
            fontWeight: FontWeight.bold,
          )
        ),
        SizedBox(height: ZohSizes.md),
        Text(
          sunTitle,
          style: TextStyle(
            fontSize: ZohSizes.spaceBtwZoh,
            fontFamily: 'Poppins',
          ),
          textAlign: TextAlign.center,
        ),
        Spacer()
      ],
    );
  }
}