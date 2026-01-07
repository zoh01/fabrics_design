import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper_functions/helper_functions.dart';
import '../../home_screen/widgets/shimmer_effect.dart';

class ZohCircularImage extends StatelessWidget {
  const ZohCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = ZohSizes.xs,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        // If Image background color is null then switch it to light and dark mode color design.
        color: backgroundColor ?? (dark ? ZohColors.black : ZohColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
            imageUrl: image,
            color: overlayColor,
            fit: fit,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
            const ZohShimmerEffect(
              width: 55,
              height: 55,
              radius: 55,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
              : Image(
            fit: fit,
            image: AssetImage(image),
            color: overlayColor,
          ),
        ),
      ),
    );
  }
}