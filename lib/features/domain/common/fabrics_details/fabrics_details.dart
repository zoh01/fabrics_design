import 'package:fabrics_design/features/domain/models/fabrics_model.dart';
import 'package:fabrics_design/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../presentation/screens/onboarding_screen/widgets/dot_indicator.dart';

class FabricsDetails extends StatefulWidget {
  final FabricsModel fabricsDetails;

  const FabricsDetails({super.key, required this.fabricsDetails});

  @override
  State<FabricsDetails> createState() => _FabricsDetailsState();
}

class _FabricsDetailsState extends State<FabricsDetails> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final fabric = widget.fabricsDetails;
    final discountedPrice =
        fabric.price * (1 - (double.parse(fabric.discount) / 100));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: const Text("Fabric Details"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: ZohSizes.md),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.shopping_bag),
                  color: ZohColors.darkColor,
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    height: 18,
                    width: 18,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          // 🖼️ Image Carousel
          Container(
            height: ZohHelperFunctions.screenHeight() * .35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(ZohSizes.spaceBtwZoh),
                bottomLeft: Radius.circular(ZohSizes.spaceBtwZoh),
              ),
              color: Colors.grey.shade200,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  itemCount: 3, // Could be dynamic later
                  onPageChanged: (value) {
                    setState(() => currentIndex = value);
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      fabric.image,
                      height: ZohHelperFunctions.screenHeight() * .3,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ),
                Positioned(
                  bottom: 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: DotIndicator(isActiveDot: index == currentIndex),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(ZohSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fabric.name,
                          style: GoogleFonts.sora(
                            fontWeight: FontWeight.bold,
                            fontSize: ZohSizes.defaultSpace,
                          ),
                        ),
                        const SizedBox(height: ZohSizes.xs),
                        Row(
                          children: [
                            // Discounted price
                            Text(
                              "₦${discountedPrice.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 20,
                                color: ZohColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: ZohSizes.sm,),
                            // Original price with strikethrough
                            Text(
                              "₦${fabric.price.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough, // strikethrough
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: ZohSizes.defaultSpace,
                      backgroundColor: ZohColors.darkColor,
                      child: Icon(Icons.favorite_border, color: Colors.white, size: ZohSizes.spaceBtwSections,),
                    ),
                  ],
                ),

                const SizedBox(height: ZohSizes.md),
                Text(
                  "$myDesc1 ${fabric.name}$myDesc2",
                  style: TextStyle(fontSize: 15, height: 1.5),
                ),
                const SizedBox(height: ZohSizes.lg),
                // 🛒 Add to Cart Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ZohColors.secondaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ZohSizes.md),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Add cart logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Added to cart successfully!"),
                        ),
                      );
                    },
                    icon: const Icon(Iconsax.shopping_bag),
                    label: const Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
