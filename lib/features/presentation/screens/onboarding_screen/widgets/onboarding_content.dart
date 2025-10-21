import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper_functions/helper_functions.dart';


class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.sunTitle,
    required this.isFirstPage,
  });

  final String image, title, sunTitle;
  final bool isFirstPage;

  @override
  Widget build(BuildContext context) {
    // Animate First Page
    if (isFirstPage) {
      return Column(
        children: [
          BounceInDown(
            duration: Duration(milliseconds: 1200),
            child: Image(
              image: AssetImage(image),
              height: ZohHelperFunctions.screenHeight() * .4,
              fit: BoxFit.contain,
            ),
          ),
          Spacer(),
          FadeInUp(
            duration: Duration(milliseconds: 1200),
            delay: const Duration(milliseconds: 300),
            child: Text(
                title,
                style: GoogleFonts.breeSerif(
                  fontSize: ZohSizes.defaultSpace,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          SizedBox(height: ZohSizes.md),
          FadeInUp(
            duration: Duration(milliseconds: 1200),
            delay: Duration(milliseconds: 600),
            child: Text(
              sunTitle,
              style: TextStyle(
                fontSize: ZohSizes.spaceBtwZoh,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer()
        ],
      );
    }
    return Column(
      children: [
        BounceInDown(
          child: Image(
            image: AssetImage(image),
            height: ZohHelperFunctions.screenHeight() * .4,
            fit: BoxFit.contain,
          ),
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