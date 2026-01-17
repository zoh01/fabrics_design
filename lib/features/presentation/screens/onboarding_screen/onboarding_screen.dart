import 'package:fabrics_design/features/domain/models/onboarding_models.dart';
import 'package:fabrics_design/features/presentation/screens/getstarted_screen/getstarted_screen.dart';
import 'package:fabrics_design/features/presentation/screens/onboarding_screen/widgets/dot_indicator.dart';
import 'package:fabrics_design/features/presentation/screens/onboarding_screen/widgets/onboarding_content.dart';
import 'package:fabrics_design/utils/constants/colors.dart';
import 'package:fabrics_design/utils/constants/image_strings.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:fabrics_design/utils/constants/text_strings.dart';
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
  bool _isAnimating = false;

  // Extract to a static const for better performance
  static final List<OnBoardingModels> _onBoardingData = [
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
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _nextPage() async {
    if (_isAnimating) return;

    setState(() => _isAnimating = true);

    try {
      if (_pageIndex < _onBoardingData.length - 1) {
        await _pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      } else {
        await _goToGetStarted();
      }
    } finally {
      if (mounted) {
        setState(() => _isAnimating = false);
      }
    }
  }

  Future<void> _skipToEnd() async {
    if (_isAnimating) return;

    setState(() => _isAnimating = true);

    try {
      await _pageController.animateToPage(
        _onBoardingData.length - 1,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    } finally {
      if (mounted) {
        setState(() => _isAnimating = false);
      }
    }
  }

  Future<void> _goToGetStarted() async {
    if (!mounted) return;

    await Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        const GetStartedScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _pageIndex == _onBoardingData.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ZohSizes.iconXs),
          child: Column(
            children: [
              /// Skip Button (Top Right)
              _buildSkipButton(),

              /// Onboarding Content
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onBoardingData.length,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    if (mounted) {
                      setState(() => _pageIndex = index);
                    }
                  },
                  itemBuilder: (context, index) {
                    final model = _onBoardingData[index];
                    return OnboardingContent(
                      key: ValueKey(index),
                      image: model.image,
                      title: model.title,
                      sunTitle: model.subTitle,
                      isFirstPage: index == 0,
                    );
                  },
                ),
              ),

              /// Dot Indicators
              _buildDotIndicators(),

              const SizedBox(height: ZohSizes.spaceBtwSections),

              /// Next / Get Started Button
              _buildActionButton(isLastPage),

              const SizedBox(height: ZohSizes.md),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    // Don't show skip button on last page
    if (_pageIndex == _onBoardingData.length - 1) {
      return const SizedBox(height: 48);
    }

    return Align(
      alignment: Alignment.centerRight,
      child: SlideInRight(
        duration: const Duration(milliseconds: 700),
        delay: const Duration(milliseconds: 500),
        child: TextButton(
          onPressed: _isAnimating ? null : _skipToEnd,
          child: Text(
            'Skip',
            style: TextStyle(
              color: _isAnimating
                  ? ZohColors.primaryColor.withOpacity(0.5)
                  : ZohColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: ZohSizes.md,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDotIndicators() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1200),
      delay: const Duration(milliseconds: 900),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _onBoardingData.length,
              (index) => Padding(
            padding: const EdgeInsets.only(left: ZohSizes.xs),
            child: DotIndicator(isActiveDot: index == _pageIndex),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(bool isLastPage) {
    return SizedBox(
      width: double.infinity,
      child: BounceInUp(
        duration: const Duration(milliseconds: 1200),
        delay: const Duration(milliseconds: 1200),
        child: ElevatedButton(
          onPressed: _isAnimating ? null : _nextPage,
          style: ElevatedButton.styleFrom(
            elevation: _isAnimating ? 2 : 5,
            backgroundColor: ZohColors.primaryColor,
            disabledBackgroundColor: ZohColors.primaryColor.withOpacity(0.7),
            side: BorderSide(color: ZohColors.primaryColor),
            padding: const EdgeInsets.symmetric(vertical: ZohSizes.md),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ZohSizes.md),
            ),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            },
            child: Text(
              isLastPage ? 'Get Started' : 'Next',
              key: ValueKey(isLastPage),
              style: GoogleFonts.merriweather(
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