import 'package:fabrics_design/features/data/provider/cart_provider.dart';
import 'package:fabrics_design/features/domain/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../domain/common/price_format/price_format.dart';

class CartFabrics extends StatelessWidget {
  final CartModel cartModel;

  const CartFabrics({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(ZohSizes.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ---------------- IMAGE ----------------
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              cartModel.fabricsModel.image,
              height: 95,
              width: 95,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: ZohSizes.md),

          /// ---------------- FABRIC INFO ----------------
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name + Delete Button Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        cartModel.fabricsModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.sora(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    // Delete Button
                    InkWell(
                      onTap: () {
                        cartProvider.removeFromCart(cartModel.fabricsModel);
                      },
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.08),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Iconsax.trash,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                /// Discount Tag
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: ZohColors.primaryColor.withOpacity(.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "-${cartModel.fabricsModel.discount}%",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: ZohColors.primaryColor,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// Price + Quantity Control
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Price
                    Text(
                      formatPrice(cartModel.fabricsModel.price.toDouble()),
                      style: GoogleFonts.sora(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: ZohColors.darkColor,
                      ),
                    ),


                    /// Quantity Control
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      height: 38,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      child: Row(
                        children: [
                          _qtyBtn(
                            icon: Iconsax.minus,
                            isAdd: false,
                            cartProvider: cartProvider,
                            cartModel: cartModel,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              cartModel.quantity.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          _qtyBtn(
                            icon: Iconsax.add,
                            isAdd: true,
                            cartProvider: cartProvider,
                            cartModel: cartModel,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Quantity Button Builder
  Widget _qtyBtn({
    required IconData icon,
    required bool isAdd,
    required CartProvider cartProvider,
    required CartModel cartModel,
  }) {
    return InkWell(
      onTap: () {
        if (isAdd) {
          cartProvider.addCart(cartModel.fabricsModel);
        } else {
          if (cartModel.quantity > 1) {
            cartProvider.reduceQuantity(cartModel.fabricsModel);
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
        ),
      ),
    );
  }
}
