import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ZAddToCart extends StatelessWidget {
  const ZAddToCart({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.currentNumber,
  });

  final Function() onAdd;
  final Function() onRemove;
  final int currentNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(ZohSizes.md),
          topLeft: Radius.circular(ZohSizes.md),
        ),
        color: ZohColors.black.withOpacity(.8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: ZohSizes.md),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: ZohColors.secondaryColor,
              borderRadius: BorderRadius.circular(ZohSizes.md),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: ZohSizes.iconXs),
              child: Row(
                children: [
                  Icon(Iconsax.shopping_bag, size: 25, color: Colors.white),
                  SizedBox(width: ZohSizes.sm),
                  Text(
                    'ADD TO CART',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ZohSizes.md,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: ZohColors.primaryColor,
              borderRadius: BorderRadius.circular(ZohSizes.md),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: ZohSizes.iconXs),
              child: Row(
                children: [
                  Icon(Iconsax.shopping_bag, size: 25, color: Colors.white),
                  SizedBox(width: ZohSizes.sm),
                  Text(
                    'BUY NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ZohSizes.md,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
