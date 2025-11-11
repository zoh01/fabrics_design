import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';


class ZRatingBarIndicator extends StatelessWidget {
  const ZRatingBarIndicator({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: ZohSizes.spaceBtwSections,
      unratedColor: ZohColors.grey,
      itemBuilder: (_, __) =>  Icon(
        Iconsax.star1,
        color: ZohColors.secondaryColor,
      ),
    );
  }
}