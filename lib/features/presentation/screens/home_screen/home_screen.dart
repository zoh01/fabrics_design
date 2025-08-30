import 'package:fabrics_design/features/domain/models/fabrics_model.dart';
import 'package:fabrics_design/features/presentation/screens/home_screen/widgets/app_bar_container.dart';
import 'package:fabrics_design/features/presentation/screens/home_screen/widgets/carousel_animations.dart';
import 'package:fabrics_design/features/presentation/screens/home_screen/widgets/fabrics_container.dart';
import 'package:fabrics_design/features/presentation/screens/home_screen/widgets/search_container.dart';
import 'package:fabrics_design/utils/constants/colors.dart';
import 'package:fabrics_design/utils/constants/image_strings.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:fabrics_design/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(ZohSizes.md),
            child: Column(
              children: [
                // Bar Container
                AppBarContainer(),
                SizedBox(height: ZohSizes.md),
                // Search Container
                SearchContainer(),
                SizedBox(height: ZohSizes.spaceBtwSections),
                // Carousel Container
                CarouselAnimations(),
                SizedBox(height: ZohSizes.spaceBtwSections),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'FABRICS FOR YOU',
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.bold,
                        fontSize: ZohSizes.spaceBtwZoh,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: ZohColors.secondaryColor,
                          fontSize: ZohSizes.md,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ZohSizes.md),

                GridView.builder(
                  shrinkWrap: true,
                  itemCount: fabricsModel.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: ZohSizes.defaultSpace,
                    crossAxisSpacing: ZohSizes.defaultSpace,
                    mainAxisExtent: ZohHelperFunctions.screenHeight() * .325
                  ),
                  itemBuilder: _buildFabrics,
                ),
                SizedBox(height: ZohSizes.spaceBtwSections,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFabrics(BuildContext context, int index) {
    FabricsModel fabrics = fabricsModel[index];
    return FabricsContainer(
      image: fabrics.image,
      name: fabrics.name,
      discount: fabrics.discount,
      price: fabrics.price,
    );
  }
}
