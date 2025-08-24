import 'package:fabrics_design/features/presentation/screens/login_screen/login_screen.dart';
import 'package:fabrics_design/features/presentation/screens/signup_screen/widgets/signup_form.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ZohSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create Account',
                style: GoogleFonts.staatliches(
                  fontSize: ZohSizes.defaultSpace * 1.4,
                  fontWeight: FontWeight.bold,
                  color: ZohColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ZohSizes.sm),
              Text(
                ZohTextString.create,
                style: GoogleFonts.saira(
                  fontSize: ZohSizes.spaceBtwZoh,
                  fontWeight: FontWeight.bold,
                  color: ZohColors.darkColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ZohSizes.spaceBtwSections),

              SignUpForm(),

              SizedBox(height: ZohSizes.spaceBtwZoh),

              SizedBox(
                width: double.infinity,
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
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: Colors.transparent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(
                        ZohSizes.md,
                      ),
                    ),
                  ),
                  child: Text(
                    'Already have an account',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: ZohSizes.spaceBtwZoh,
                      fontWeight: FontWeight.bold,
                      color: ZohColors.darkColor,
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
