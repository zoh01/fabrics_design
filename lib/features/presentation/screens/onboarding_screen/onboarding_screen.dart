import 'package:fabrics_design/features/domain/models/onboarding_models.dart';
import 'package:fabrics_design/features/presentation/screens/getstarted_screen/getstarted_screen.dart';
import 'package:fabrics_design/features/presentation/screens/onboarding_screen/widgets/dot_indicator.dart';
import 'package:fabrics_design/features/presentation/screens/onboarding_screen/widgets/onboarding_content.dart';
import 'package:fabrics_design/utils/constants/colors.dart';
import 'package:fabrics_design/utils/constants/image_strings.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:fabrics_design/utils/constants/text_strings.dart';
import 'package:fabrics_design/utils/helper_functions/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<OnBoardingModels> onBoardingModel = [
    OnBoardingModels(
      ZohImageStrings.selectFabrics,
      ZohTextString.onBoardingTitle1,
      ZohTextString.onBoardingSubTitle1,
    ),
    OnBoardingModels(
      ZohImageStrings.paymentFabrics,
      ZohTextString.onBoardingTitle2,
      ZohTextString.onBoardingSubTitle2,
    ),
    OnBoardingModels(
      ZohImageStrings.deliveryFabrics,
      ZohTextString.onBoardingTitle3,
      ZohTextString.onBoardingSubTitle3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ZohSizes.iconXs),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: onBoardingModel.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                    image: onBoardingModel[index].image,
                    title: onBoardingModel[index].title,
                    sunTitle: onBoardingModel[index].subTitle,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    onBoardingModel.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: ZohSizes.xs),
                      child: DotIndicator(isActiveDot: index == _pageIndex),
                    ),
                  ),
                ],
              ),

              SizedBox(height: ZohSizes.spaceBtwSections),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => GetStartedScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: ZohColors.primaryColor,
                    side: BorderSide(color: ZohColors.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ZohSizes.md),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.merriweather(
                      fontSize: ZohSizes.spaceBtwZoh,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: ZohSizes.md),
            ],
          ),
        ),
      ),
    );
  }
}
