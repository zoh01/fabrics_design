import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device_utils/device_utils.dart';


class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ZohSizes.xs),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ZohSizes.md),
        color: ZohColors.secondaryColor.withOpacity(.2),
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
            SizedBox(width: ZohSizes.sm),
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
    );
  }
}