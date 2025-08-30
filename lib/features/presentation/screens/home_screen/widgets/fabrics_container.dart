import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper_functions/helper_functions.dart';

class FabricsContainer extends StatelessWidget {
  const FabricsContainer({
    super.key,
    required this.image,
    required this.name,
    required this.discount,
    required this.price,
  });

  final String image, name, discount;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ZohHelperFunctions.screenWidth() * .43,
      padding: EdgeInsets.all(ZohSizes.xs),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ZohColors.black.withOpacity(.7),
            offset: Offset(2.0, 2.0),
            blurRadius: 3,
            spreadRadius: 5.0,
          ),
          BoxShadow(
            color: ZohColors.grey,
            offset: Offset(-2.0, -2.0),
            blurRadius: 1,
            spreadRadius: 1.0,
          ),
        ],
        borderRadius: BorderRadius.circular(ZohSizes.productImageRadius),
        color: Colors.grey.shade400,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(ZohSizes.sm),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ZohSizes.productImageRadius),
              color: Colors.grey.shade200,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(ZohSizes.sm),
                  child: Image(
                    width: ZohHelperFunctions.screenWidth() * .38,
                    height: ZohHelperFunctions.screenHeight() * .2,
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(ZohSizes.sm),
                    decoration: BoxDecoration(
                      color: ZohColors.secondaryColor,
                      borderRadius: BorderRadius.circular(ZohSizes.sm),
                    ),
                    child: Text(
                      "-${discount}%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ZohSizes.md,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ZohSizes.sm),
          Text(
            name,
            style: GoogleFonts.merriweather(
              fontWeight: FontWeight.bold,
              fontSize: ZohSizes.spaceBtwZoh,
              color: ZohColors.black,
            ),
          ),
          SizedBox(height: ZohSizes.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "#${price}00",
                style: GoogleFonts.sora(
                  fontSize: ZohSizes.spaceBtwZoh,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: ZohColors.darkColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ZohSizes.productImageRadius),
                    bottomRight: Radius.circular(ZohSizes.productImageRadius),
                  ),
                ),
                child: SizedBox(
                  height: ZohSizes.iconLg * 1.2,
                  width: ZohSizes.iconLg * 1.2,
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: ZohSizes.spaceBtwSections,
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