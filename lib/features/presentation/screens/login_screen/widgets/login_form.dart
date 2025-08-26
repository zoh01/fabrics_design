import 'package:animate_do/animate_do.dart';
import 'package:fabrics_design/features/presentation/screens/navigation_bar/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isSecuredZoh = true;
  bool rememberMe = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          /// Email Form Field
          SlideInRight(
            child: TextFormField(
              controller: emailController,
              validator: (zoh) {
                if (zoh!.isEmpty) {
                  return 'Email Address Required';
                } else if (!emailRegex.hasMatch(zoh)) {
                  return 'Invalid Email Address';
                }
                return null;
              },
              style: GoogleFonts.viga(
                fontWeight: FontWeight.normal,
                fontSize: ZohSizes.spaceBtwZoh,
                color: ZohColors.darkColor,
              ),
              keyboardType: TextInputType.emailAddress,
              cursorColor: ZohColors.darkColor,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(
                  Icons.email_rounded,
                  color: ZohColors.darkColor,
                ),
                fillColor: Colors.white,
                hintText: 'Input Email',
                hintStyle: GoogleFonts.viga(
                  fontSize: ZohSizes.spaceBtwZoh,
                  fontWeight: FontWeight.normal,
                  color: ZohColors.darkColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ZohColors.darkColor, width: 2),
                  borderRadius: BorderRadius.circular(ZohSizes.md),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ZohColors.darkColor),
                  borderRadius: BorderRadius.circular(ZohSizes.md),
                ),
              ),
            ),
          ),
          SizedBox(height: ZohSizes.md),

          /// Password Form Field
          SlideInLeft(
            child: TextFormField(
              controller: passwordController,
              validator: (zoh) {
                if (zoh!.isEmpty) {
                  return 'Password Required';
                }
                return null;
              },
              style: GoogleFonts.viga(
                fontWeight: FontWeight.normal,
                fontSize: ZohSizes.spaceBtwZoh,
                color: ZohColors.darkColor,
              ),
              keyboardType: TextInputType.visiblePassword,
              cursorColor: ZohColors.darkColor,
              obscureText: _isSecuredZoh,
              decoration: InputDecoration(
                suffixIcon: toggleZoh(),
                prefixIcon: Icon(
                  Icons.password_rounded,
                  color: ZohColors.darkColor,
                ),
                filled: true,
                fillColor: ZohColors.white,
                hintText: 'Input Password',
                hintStyle: GoogleFonts.viga(
                  fontSize: ZohSizes.spaceBtwZoh,
                  fontWeight: FontWeight.normal,
                  color: ZohColors.darkColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ZohColors.darkColor, width: 2),
                  borderRadius: BorderRadius.circular(ZohSizes.md),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ZohColors.darkColor),
                  borderRadius: BorderRadius.circular(ZohSizes.md),
                ),
              ),
            ),
          ),
          SizedBox(height: ZohSizes.defaultSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Check Box
              SlideInLeft(
                child: Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      activeColor: ZohColors.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                    ),
                    Text(
                      'Remember Me!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: ZohSizes.iconXs,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SlideInRight(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: Colors.transparent),
                  ),
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: ZohSizes.md,
                      fontFamily: 'Roboto',
                      color: ZohColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ZohSizes.spaceBtwSections),
          SlideInLeft(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(builder: (context) => BottomNavBar()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: ZohColors.primaryColor,
                  side: BorderSide(color: ZohColors.primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(ZohSizes.md),
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: GoogleFonts.viga(
                    fontSize: ZohSizes.spaceBtwZoh,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget toggleZoh() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecuredZoh = !_isSecuredZoh;
        });
      },
      icon: _isSecuredZoh
          ? Icon(Icons.visibility_off, color: ZohColors.darkColor)
          : Icon(Icons.visibility, color: ZohColors.darkColor),
    );
  }

  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
}
