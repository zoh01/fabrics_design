import 'package:fabrics_design/features/presentation/screens/login_screen/login_screen.dart';
import 'package:fabrics_design/features/presentation/screens/signup_screen/signup_screen.dart';
import 'package:fabrics_design/utils/constants/colors.dart';
import 'package:fabrics_design/utils/constants/image_strings.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:fabrics_design/utils/constants/text_strings.dart';
import 'package:fabrics_design/utils/helper_functions/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(ZohSizes.defaultSpace),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              BounceInDown(
                duration: Duration(milliseconds: 2000),
                child: Image(
                  image: AssetImage(ZohImageStrings.fabricsImage),
                  height: ZohHelperFunctions.screenHeight() * .3,
                  fit: BoxFit.contain,
                ),
              ),
              Spacer(),
              SlideInLeft(
                duration: Duration(milliseconds: 2000),
                child: Text(
                  ZohTextString.discover,
                  style: GoogleFonts.oswald(
                    fontSize: ZohSizes.defaultSpace * 1.3,
                    fontWeight: FontWeight.bold,
                    color: ZohColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: ZohSizes.md),
              SlideInRight(
                duration: Duration(milliseconds: 2000),
                child: Text(
                  ZohTextString.explore,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: ZohSizes.spaceBtwZoh,
                    fontWeight: FontWeight.bold,
                    color: ZohColors.darkColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Spacer(),

              Row(
                children: [
                  Expanded(
                    child: BounceInUp(
                      duration: Duration(milliseconds: 2000),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor: ZohColors.primaryColor,
                          side: BorderSide(color: ZohColors.primaryColor),
                        ),
                        child: Text('Login', style: GoogleFonts.viga(
                          fontSize: ZohSizes.spaceBtwZoh,
                          color: Colors.white,
                        ),),
                      ),
                    ),
                  ),
                  SizedBox(width: ZohSizes.sm),
                  Expanded(
                    child: BounceInUp(
                      duration: Duration(milliseconds: 2000),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => SignupScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(color: Colors.transparent),
                        ),
                        child: Text(
                          'Register',
                          style: GoogleFonts.viga(
                            color: ZohColors.primaryColor,
                            fontSize: ZohSizes.spaceBtwZoh,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
