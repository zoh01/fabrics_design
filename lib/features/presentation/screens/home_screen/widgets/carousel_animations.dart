import 'package:carousel_slider/carousel_slider.dart';
import 'package:fabrics_design/utils/helper_functions/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../onboarding_screen/widgets/dot_indicator.dart';
import 'carousel_image.dart';

class CarouselAnimations extends StatefulWidget {
  const CarouselAnimations({super.key});

  @override
  State<CarouselAnimations> createState() => _CarouselAnimationsState();
}

class _CarouselAnimationsState extends State<CarouselAnimations> {
  final fabricsCarousel = [
    CarouselImages(images: ZohImageStrings.slider1),
    CarouselImages(images: ZohImageStrings.slider2),
    CarouselImages(images: ZohImageStrings.slider3),
    CarouselImages(images: ZohImageStrings.slider4),
    CarouselImages(images: ZohImageStrings.slider5),
    CarouselImages(images: ZohImageStrings.slider6),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: ZohHelperFunctions.screenHeight() * .2,
            viewportFraction: .85,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayInterval: Duration(milliseconds: 2000),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: fabricsCarousel,
        ),
        SizedBox(height: ZohSizes.spaceBtwZoh),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              fabricsCarousel.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: ZohSizes.xs),
                child: DotIndicator(isActiveDot: index == currentIndex),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
