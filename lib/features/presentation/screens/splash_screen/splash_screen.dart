import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fabrics_design/features/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:fabrics_design/utils/constants/colors.dart';
import 'package:fabrics_design/utils/constants/image_strings.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:fabrics_design/utils/constants/text_strings.dart';
import 'package:fabrics_design/utils/helper_functions/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 8)).then((zoh) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (ctx) => OnboardingScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(ZohSizes.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(ZohImageStrings.fabricsImage),
              height: ZohHelperFunctions.screenHeight() * .4,
              alignment: AlignmentGeometry.center,
            ),

            SizedBox(height: ZohSizes.spaceBtwSections),

            SizedBox(
              child: DefaultTextStyle(
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: ZohColors.darkColor,
                  fontSize: ZohSizes.spaceBtwZoh,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(ZohTextString.splashTitle),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
