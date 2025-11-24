import 'package:fabrics_design/features/data/provider/cart_provider.dart';
import 'package:fabrics_design/features/data/provider/navigation_provider.dart';
import 'package:fabrics_design/features/domain/models/cart_model.dart';
import 'package:fabrics_design/features/presentation/screens/cart_screen/widgets/cart_items.dart';
import 'package:fabrics_design/features/presentation/screens/shopping_screen/shopping_screen.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:fabrics_design/utils/helper_functions/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../navigation_bar/bottom_nav_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    List<CartModel> cartFabrics = cartProvider.carts.reversed.toList();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: cartFabrics.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(ZohSizes.spaceBtwSections),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BounceInDown(
                        child: Image(
                          image: AssetImage(ZohImageStrings.emptyBasket),
                          width: MediaQuery.of(context).size.width * .6,
                        ),
                      ),
                      FadeInUp(
                        child: Text(
                          ZohTextString.empty,
                          style: GoogleFonts.anton(
                            fontSize: ZohSizes.spaceBtwZoh,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: ZohSizes.iconXs),
                      FadeInUp(
                        child: ElevatedButton(
                          onPressed: () {
                            Provider.of<NavigationProvider>(
                              context,
                              listen: false,
                            ).changeTab(1);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Explore Fabrics"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ZohSizes.md),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: ZohSizes.md,
                      vertical: ZohSizes.sm,
                    ),
                    child: Row(
                      children: [
                        // Search Field
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                textAlign: TextAlign.center,
                                "Cart Screen",
                                style: GoogleFonts.merriweather(
                                  fontSize: ZohSizes.spaceBtwZoh,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...List.generate(
                            cartFabrics.length,
                            (index) => Container(
                              width: ZohHelperFunctions.screenWidth(),
                              margin: EdgeInsets.only(
                                top: index == 0 ? 20 : 0,
                                right: ZohSizes.spaceBtwItems,
                                left: ZohSizes.spaceBtwItems,
                              ),
                              child: Stack(
                                children: [
                                  CartFabrics(cartModel: cartFabrics[index]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
      bottomNavigationBar: cartFabrics.isEmpty
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.only(
                bottom: ZohSizes.spaceBtwSections * 2.8,
                top: ZohSizes.md,
                left: ZohSizes.md,
                right: ZohSizes.md,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    backgroundColor: ZohColors.primaryColor,
                    side: BorderSide(color: ZohColors.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    "Checkout  #${(cartProvider.totalCart() + 3.52).toStringAsFixed(2)}",
                    style: GoogleFonts.roboto(
                      fontSize: ZohSizes.spaceBtwZoh,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
