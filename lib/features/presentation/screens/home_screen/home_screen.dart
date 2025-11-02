import 'package:fabrics_design/features/domain/common/containers/header_container.dart';
import 'package:fabrics_design/features/domain/common/texts/section_heading.dart';
import 'package:fabrics_design/features/domain/models/category_model.dart';
import 'package:fabrics_design/features/domain/models/fabrics_model.dart';
import 'package:fabrics_design/features/presentation/screens/home_screen/widgets/app_bar_container.dart';
import 'package:fabrics_design/features/presentation/screens/home_screen/widgets/carousel_animations.dart';
import 'package:fabrics_design/features/presentation/screens/home_screen/widgets/fabrics_container.dart';
import 'package:fabrics_design/features/presentation/screens/home_screen/widgets/search_container.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

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
              child: Padding(
                padding: EdgeInsets.all(ZohSizes.md),
                child: Column(
                  children: [
                    AppBarContainer(),
                    SizedBox(height: ZohSizes.md),
                    SearchContainer(),
                    SizedBox(height: ZohSizes.md),
                    ZSectionHeading(
                      title: 'POPULAR CATEGORIES',
                      showActionButton: false,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: ZohSizes.sm),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(bottom: ZohSizes.md),
                      child: Row(
                        children: List.generate(
                          fCategoryModel.length,
                          (index) => InkWell(
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
                                SizedBox(height: ZohSizes.sm),
                                Text(fCategoryModel[index].name),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: ZohSizes.xs),
            CarouselAnimations(),
          ],
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
