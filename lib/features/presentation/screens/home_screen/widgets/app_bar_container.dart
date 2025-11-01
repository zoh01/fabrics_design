import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';


class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: ZohSizes.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                      'Hello',
                      style: GoogleFonts.sora(
                          fontSize: ZohSizes.spaceBtwZoh,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  SizedBox(width: ZohSizes.xs),
                  Text(
                      'Zoh',
                      style: GoogleFonts.sora(
                          fontSize: ZohSizes.spaceBtwZoh,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  SizedBox(width: ZohSizes.cardRadiusXs),
                  Image(
                    image: AssetImage(ZohImageStrings.excited),
                    height: ZohSizes.spaceBtwSections * .8,
                  ),
                ],
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                padding: EdgeInsets.all(ZohSizes.sm),
                margin: EdgeInsets.only(top: ZohSizes.sm, right: ZohSizes.sm),
                decoration: BoxDecoration(
                  border: Border.all(color: ZohColors.grey),
                  borderRadius: BorderRadius.circular(ZohSizes.sm),
                ),
                child: Icon(
                  Icons.notifications_rounded,
                  color: ZohColors.darkColor,
                  size: ZohSizes.defaultSpace,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(ZohSizes.sm),
                    decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}