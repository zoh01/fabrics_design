import 'package:fabrics_design/utils/constants/colors.dart';
import 'package:fabrics_design/utils/constants/image_strings.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:fabrics_design/utils/device_utils/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ZohSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hello',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: ZohSizes.spaceBtwZoh,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: ZohSizes.xs),
                          Text(
                            'Zoh',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: ZohSizes.spaceBtwZoh,
                            ),
                          ),
                          SizedBox(width: ZohSizes.cardRadiusXs),
                          Image(
                            image: AssetImage(ZohImageStrings.excited),
                            height: ZohSizes.spaceBtwSections,
                          ),
                        ],
                      ),
                      SizedBox(height: ZohSizes.sm),
                      Row(
                        children: [
                          Image(
                            image: AssetImage(ZohImageStrings.location),
                            height: ZohSizes.defaultSpace,
                          ),
                          SizedBox(width: ZohSizes.sm),
                          Text(
                            'Lagos, Nigeria',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: ZohSizes.spaceBtwZoh,
                            ),
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
                        decoration: BoxDecoration(
                          border: Border.all(color: ZohColors.primaryColor),
                          borderRadius: BorderRadius.circular(ZohSizes.sm),
                        ),
                        child: Icon(
                          Icons.notifications_rounded,
                          color: ZohColors.darkColor,
                          size: ZohSizes.spaceBtwSections,
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
              SizedBox(height: ZohSizes.md),
              Container(
                padding: EdgeInsets.all(ZohSizes.sm),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ZohSizes.md),
                  color: ZohColors.primaryColor.withOpacity(.1),
                ),
                child: SizedBox(
                  width: ZohDeviceUtils.getScreenWidth() * .9,
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: ZohColors.darkColor,
                        size: ZohSizes.spaceBtwSections,
                      ),
                      SizedBox(width: ZohSizes.xs),
                      Expanded(
                        child: TextField(
                          showCursor: true,
                          style: TextStyle(
                            color: ZohColors.darkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: ZohSizes.md,
                          ),
                          cursorColor: ZohColors.darkColor,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: ZohColors.primaryColor,
                              fontSize: ZohSizes.md,
                              fontWeight: FontWeight.bold,
                            ),
                            hintText: 'Search Fabrics',
                            hintStyle: TextStyle(
                              color: ZohColors.darkColor,
                              fontSize: ZohSizes.md,
                              fontWeight: FontWeight.bold,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(width: ZohSizes.xs),
                      Icon(
                        Icons.mic,
                        color: ZohColors.darkColor,
                        size: ZohSizes.spaceBtwSections,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
