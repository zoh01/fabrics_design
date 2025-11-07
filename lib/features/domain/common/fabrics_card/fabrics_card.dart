import 'package:fabrics_design/features/domain/models/fabrics_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper_functions/helper_functions.dart';
import '../fabrics_details/fabrics_details.dart';

class FabricsCard extends StatefulWidget {
  final FabricsModel fabricsItems;

  const FabricsCard({super.key, required this.fabricsItems});

  @override
  State<FabricsCard> createState() => _FabricsCardState();
}

class _FabricsCardState extends State<FabricsCard> {
  @override
  Widget build(BuildContext context) {
    final fabrics = widget.fabricsItems;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) =>
                FabricsDetails(fabricsDetails: widget.fabricsItems),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: ZohSizes.sm),
        margin: EdgeInsets.only(top: ZohSizes.xs),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(2, 4),
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
                borderRadius: BorderRadius.circular(
                  ZohSizes.productImageRadius,
                ),
                color: Colors.grey.shade200,
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(ZohSizes.sm),
                    child: Image(
                      width: ZohHelperFunctions.screenWidth() * .38,
                      height: ZohHelperFunctions.screenHeight() * .2,
                      image: AssetImage(fabrics.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.all(ZohSizes.sm),
                      decoration: BoxDecoration(
                        color: ZohColors.secondaryColor,
                        borderRadius: BorderRadius.circular(ZohSizes.sm),
                      ),
                      child: Text(
                        "-${fabrics.discount}%",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ZohSizes.md,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: ZohSizes.md,
                      backgroundColor: ZohColors.darkColor,
                      child: Icon(Icons.favorite_border, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ZohSizes.sm),
            Text(
              fabrics.name,
              style: GoogleFonts.merriweather(
                fontWeight: FontWeight.bold,
                fontSize: ZohSizes.spaceBtwZoh,
                color: ZohColors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: ZohColors.secondaryColor,
                  size: ZohSizes.spaceBtwZoh,
                ),
                Text(
                  "(${fabrics.rating.toString()})",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: ZohSizes.sm),
                Text("${fabrics.review} reviews"),
              ],
            ),
            const SizedBox(height: ZohSizes.xs),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "#${fabrics.price.toStringAsFixed(2)}",
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
      ),
    );
  }
}
