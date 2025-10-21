import 'package:fabrics_design/features/domain/models/onboarding_models.dart';
import 'package:fabrics_design/features/presentation/screens/getstarted_screen/getstarted_screen.dart';
import 'package:fabrics_design/features/presentation/screens/onboarding_screen/widgets/dot_indicator.dart';
import 'package:fabrics_design/features/presentation/screens/onboarding_screen/widgets/onboarding_content.dart';
import 'package:fabrics_design/utils/constants/colors.dart';
import 'package:fabrics_design/utils/constants/image_strings.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:fabrics_design/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

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
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_pageIndex < onBoardingModel.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _goToGetStarted();
    }
  }

  void _skipToEnd() {
    _pageController.animateToPage(
      onBoardingModel.length - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _goToGetStarted() {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (_) => const GetStartedScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ZohSizes.iconXs),
          child: Column(
            children: [
              /// Skip Button (Top Right)
              Align(
                alignment: Alignment.centerRight,
                child: SlideInRight(
                  duration: Duration(milliseconds: 1200),
                  delay: Duration(milliseconds: 500),
                  child: TextButton(
                    onPressed: _skipToEnd,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: ZohColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: ZohSizes.md
                      ),
                    ),
                  ),
                ),
              ),

              /// Onboarding Content
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onBoardingModel.length,
                  onPageChanged: (index) {
                    if (mounted) {
                      setState(() => _pageIndex = index);
                    }
                  },
                  itemBuilder: (context, index) {
                    final model = onBoardingModel[index];
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder: (child, anim) =>
                          FadeTransition(opacity: anim, child: child),
                      child: OnboardingContent(
                        key: ValueKey(index),
                        image: model.image,
                        title: model.title,
                        sunTitle: model.subTitle,
                        isFirstPage: index == 0,
                      ),
                    );
                  },
                ),
              ),

              /// Dot Indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onBoardingModel.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: ZohSizes.xs),
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1200),
                      delay: Duration(milliseconds: 900),
                      child: DotIndicator(isActiveDot: index == _pageIndex),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: ZohSizes.spaceBtwSections),

              /// Next / Get Started Button
              SizedBox(
                width: double.infinity,
                child: BounceInUp(
                  duration: Duration(milliseconds: 1200),
                  delay: Duration(milliseconds: 1200),
                  child: ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: ZohColors.primaryColor,
                      side: BorderSide(color: ZohColors.primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ZohSizes.md),
                      ),
                    ),
                    child: Text(
                      _pageIndex == onBoardingModel.length - 1
                          ? 'Get Started'
                          : 'Next',
                      style: GoogleFonts.merriweather(
                        fontSize: ZohSizes.spaceBtwZoh,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: ZohSizes.md),
            ],
          ),
        ),
      ),
    );
  }
}
