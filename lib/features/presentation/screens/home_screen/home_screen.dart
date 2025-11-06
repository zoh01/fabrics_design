import 'package:fabrics_design/features/domain/common/containers/header_container.dart';
import 'package:fabrics_design/features/domain/common/fabrics_card/fabrics_card.dart';
import 'package:fabrics_design/features/domain/common/fabrics_details/fabrics_details.dart';
import 'package:fabrics_design/features/domain/common/texts/section_heading.dart';
import 'package:fabrics_design/features/domain/models/category_model.dart';
import 'package:fabrics_design/features/domain/models/fabrics_model.dart';
import 'package:fabrics_design/features/presentation/screens/home_screen/widgets/app_bar_container.dart';
import 'package:fabrics_design/features/presentation/screens/home_screen/widgets/carousel_animations.dart';
import 'package:fabrics_design/features/presentation/screens/home_screen/widgets/search_container.dart';
import 'package:fabrics_design/utils/constants/colors.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
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
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ZohPrimaryHeaderContainer(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: ZohSizes.md,
                      right: ZohSizes.md,
                      top: ZohSizes.spaceBtwZoh,
                    ),
                    child: AppBarContainer(),
                  ),
                  SizedBox(height: ZohSizes.sm),
                  SearchContainer(),
                  SizedBox(height: ZohSizes.md),
                  Padding(
                    padding: const EdgeInsets.only(left: ZohSizes.md),
                    child: ZSectionHeading(
                      title: 'POPULAR CATEGORIES',
                      showActionButton: false,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: ZohSizes.sm),
                  Padding(
                    padding: EdgeInsets.only(bottom: ZohSizes.md),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(bottom: ZohSizes.md),
                      child: Row(
                        children: List.generate(
                          fCategoryModel.length,
                          (index) => Padding(
                            padding: index == 0
                                ? EdgeInsets.only(left: ZohSizes.sm)
                                : EdgeInsets.only(right: ZohSizes.xs),
                            child: InkWell(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: ZohSizes.sm,
                                    ),
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(.7),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(ZohSizes.md),
                                        ),
                                      ),
                                      child: Center(
                                        child: Image(
                                          image: AssetImage(
                                            fCategoryModel[index].image,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: ZohSizes.xs),
                                  Text(
                                    fCategoryModel[index].name,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      color: ZohColors.darkColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ZohSizes.xs),
            CarouselAnimations(),
            SizedBox(height: ZohSizes.sm),
            Padding(
              padding: const EdgeInsets.only(left: ZohSizes.md),
              child: ZSectionHeading(
                title: 'FABRICS FOR YOU',
                showActionButton: true,
              ),
            ),
            GridView.builder(
              itemCount: fabricsModel.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: ZohSizes.sm,
                vertical: ZohSizes.sm,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.62,
                mainAxisSpacing: ZohSizes.iconXs,
                crossAxisSpacing: ZohSizes.md,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => FabricsDetails()),
                  );
                },
                child: FabricsCard(fabricsItems: fabricsModel[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
