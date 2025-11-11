import 'package:fabrics_design/features/domain/common/add_to_cart/widgets/add_remove.dart';
import 'package:fabrics_design/features/domain/models/fabrics_model.dart';
import 'package:fabrics_design/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../presentation/screens/onboarding_screen/widgets/dot_indicator.dart';
import '../add_to_cart/add_to_cart.dart';
import '../rating_star/rating_star.dart';

class FabricsDetails extends StatefulWidget {
  final FabricsModel fabricsDetails;

  const FabricsDetails({super.key, required this.fabricsDetails});

  @override
  State<FabricsDetails> createState() => _FabricsDetailsState();
}

class _FabricsDetailsState extends State<FabricsDetails> {
  int currentIndex = 0;
  int selectedColorIndex = 1;
  int currentNumber = 1;

  @override
  Widget build(BuildContext context) {
    final fabric = widget.fabricsDetails;
    final discountedPrice =
        fabric.price * (1 - (double.parse(fabric.discount) / 100));

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          "Fabrics Details",
          style: GoogleFonts.sora(
            fontWeight: FontWeight.w600,
            color: ZohColors.darkColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: ZohSizes.md),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.shopping_bag, color: Colors.black87),
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel
            Container(
              height: ZohHelperFunctions.screenHeight() * .4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ZohSizes.defaultSpace),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    itemCount: 3,
                    onPageChanged: (value) {
                      setState(() => currentIndex = value);
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        fabric.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                  Positioned(
                    bottom: 14,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: DotIndicator(
                            isActiveDot: index == currentIndex,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 🧵 Fabric Info Card
            Padding(
              padding: const EdgeInsets.all(ZohSizes.md),
              child: Container(
                padding: const EdgeInsets.all(ZohSizes.md),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name + Favorite
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            fabric.name,
                            style: GoogleFonts.sora(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: ZohColors.darkColor,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: ZohColors.secondaryColor.withOpacity(
                            0.1,
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            color: ZohColors.secondaryColor,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: ZohSizes.sm),

                    // Prices
                    Row(
                      children: [
                        Text(
                          "#${discountedPrice.toStringAsFixed(2)}",
                          style: GoogleFonts.sora(
                            fontSize: 22,
                            color: ZohColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: ZohSizes.sm),
                        Text(
                          "₦${fabric.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: ZohSizes.sm),
                    const ZRatingBarIndicator(rating: 4.5),
                    const SizedBox(height: ZohSizes.md),

                    // Description
                    Text(
                      "$myDesc1 ${fabric.name}$myDesc2",
                      style: GoogleFonts.inter(fontSize: ZohSizes.md),
                    ),

                    const SizedBox(height: ZohSizes.iconXs),

                    // Color Picker
                    Text(
                      "Available Colors",
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: ZohSizes.xs),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: fabric.fColor.asMap().entries.map((entry) {
                          final int index = entry.key;
                          final color = entry.value;
                          return GestureDetector(
                            onTap: () => setState(() {
                              selectedColorIndex = index;
                            }),
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedColorIndex == index
                                      ? ZohColors.darkColor
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: color,
                                child: selectedColorIndex == index
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: ZohSizes.spaceBtwZoh,
                                      )
                                    : null,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: ZohSizes.iconXs),

                    // Quantity
                    AddRemove(
                      onAdd: () {
                        setState(() => currentNumber++);
                      },
                      onRemove: () {
                        if (currentNumber > 1) {
                          setState(() => currentNumber--);
                        }
                      },
                      currentNumber: currentNumber,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // 🛒 Modern Add to Cart Bar
      bottomNavigationBar: ZAddToCart(
        onAdd: () {
          setState(() {
            currentNumber++;
          });
        },
        onRemove: () {
          if (currentNumber != 1) {
            setState(() {
              currentNumber--;
            });
          }
        },
        currentNumber: currentNumber,
      ),
    );
  }
}
