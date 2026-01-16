import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper_functions/helper_functions.dart';
import '../../../../data/provider/cart_provider.dart';
import '../../../../domain/common/price_format/price_format.dart';
import '../../../../domain/models/fabrics_model.dart';


class CategoryCard extends StatefulWidget {
  const CategoryCard({
    super.key,
    required this.fabricsCategory,
  });

  final FabricsModel fabricsCategory;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {


  @override
  Widget build(BuildContext context) {
    final fabric = widget.fabricsCategory;
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    bool isFavorite = false;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.8),
            Colors.grey.shade200.withOpacity(0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: ZohColors.darkColor.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🖼️ Image Section
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.asset(
                  widget.fabricsCategory.image,
                  width: double.infinity,
                  height:
                  ZohHelperFunctions.screenHeight() *
                      0.22,
                  fit: BoxFit.cover,
                ),
              ),

              // 💰 Discount Tag
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: ZohColors.secondaryColor,
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: Text(
                    "-${widget.fabricsCategory.discount}%",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // ❤️ Favorite Icon
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: () => setState(
                        () => isFavorite = !isFavorite,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isFavorite
                          ? Colors.redAccent
                          : ZohColors.darkColor,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // 🧵 Fabric Info
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  widget.fabricsCategory.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: ZohColors.darkColor,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: ZohColors.secondaryColor,
                      size: 18,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      widget.fabricsCategory.rating.toStringAsFixed(1),
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "(${widget.fabricsCategory.review} reviews)",
                      style: GoogleFonts.inter(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // 💸 Price and Add Button
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatPrice(widget.fabricsCategory.price.toDouble()),
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: ZohColors.primaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cartProvider.addCart(fabric);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ZohColors.primaryColor,
                          borderRadius:
                          BorderRadius.circular(
                            ZohSizes.iconXs,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(ZohSizes.sm),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: ZohSizes.md,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
}