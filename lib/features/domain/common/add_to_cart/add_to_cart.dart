import 'package:fabrics_design/features/domain/models/fabrics_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../data/provider/cart_provider.dart';

class ZAddToCart extends StatefulWidget {
  final FabricsModel fabricsDetails;

  const ZAddToCart({
    super.key, required this.fabricsDetails,
  });

  @override
  State<ZAddToCart> createState() => _ZAddToCartState();
}

class _ZAddToCartState extends State<ZAddToCart> {
  @override
  Widget build(BuildContext context) {
    final fabric = widget.fabricsDetails;
    CartProvider cartProvider = Provider.of<CartProvider>(context);
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
          GestureDetector(
            onTap: () {
              cartProvider.addCart(fabric);
            },
            child: Container(
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
