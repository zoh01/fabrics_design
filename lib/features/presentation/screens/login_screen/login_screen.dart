import 'package:fabrics_design/features/presentation/screens/login_screen/widgets/login_form.dart';
import 'package:fabrics_design/features/presentation/screens/signup_screen/signup_screen.dart';
import 'package:fabrics_design/utils/constants/colors.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:fabrics_design/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ZohSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BounceIn(
                child: Text(
                  'Login Here',
                  style: GoogleFonts.staatliches(
                    fontSize: ZohSizes.defaultSpace * 1.4,
                    fontWeight: FontWeight.bold,
                    color: ZohColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: ZohSizes.sm),
              BounceIn(
                child: Text(
                  ZohTextString.welcome,
                  style: GoogleFonts.saira(
                    fontSize: ZohSizes.defaultSpace,
                    fontWeight: FontWeight.bold,
                    color: ZohColors.darkColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: ZohSizes.spaceBtwSections),

              LoginForm(),
              SizedBox(height: ZohSizes.spaceBtwZoh),
              SlideInRight(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => SignupScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: Colors.transparent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(
                          ZohSizes.md,
                        ),
                      ),
                    ),
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: ZohSizes.spaceBtwZoh,
                        fontWeight: FontWeight.bold,
                        color: ZohColors.darkColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
