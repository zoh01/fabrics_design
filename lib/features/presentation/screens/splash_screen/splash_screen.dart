import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fabrics_design/features/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:fabrics_design/utils/constants/colors.dart';
import 'package:fabrics_design/utils/constants/image_strings.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:fabrics_design/utils/constants/text_strings.dart';
import 'package:fabrics_design/utils/helper_functions/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 6)).then((zoh) {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (ctx) => OnboardingScreen()));
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
            BounceInDown(
              duration: Duration(milliseconds: 2000),
              child: Image(
                image: AssetImage(ZohImageStrings.fabricsImage),
                height: ZohHelperFunctions.screenHeight() * .4,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),

            SizedBox(height: ZohSizes.spaceBtwSections),

            FadeInUp(
              duration: Duration(milliseconds: 2000),
              delay: Duration(milliseconds: 1000),
              child: Center(
                child: DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: ZohColors.primaryColor,
                    fontSize: ZohSizes.defaultSpace,
                    fontWeight: FontWeight.bold
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(ZohTextString.splashTitle),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
