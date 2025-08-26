import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isSecuredZoh = true;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          /// Name Field
          SlideInLeft(
            child: TextFormField(
              controller: nameController,
              validator: (zoh) {
                if(zoh!.isEmpty) {
                  return 'Full Name Required';
                }
                return null;
              },
              style: GoogleFonts.viga(
                fontWeight: FontWeight.normal,
                fontSize: ZohSizes.spaceBtwZoh,
                color: ZohColors.darkColor,
              ),
              keyboardType: TextInputType.name,
              cursorColor: ZohColors.darkColor,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.person, color: ZohColors.darkColor),
                fillColor: Colors.white,
                hintText: 'Full Name',
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
                prefixIcon: Icon(Icons.email_rounded, color: ZohColors.darkColor),
                fillColor: Colors.white,
                hintText: 'Email',
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
                suffixIcon: togglePassword(),
                prefixIcon: Icon(
                  Icons.password_rounded,
                  color: ZohColors.darkColor,
                ),
                filled: true,
                fillColor: ZohColors.white,
                hintText: 'Password',
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
          SizedBox(height: ZohSizes.spaceBtwSections),
          SlideInRight(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
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
                  'Sign Up',
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

  Widget togglePassword() {
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


  final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
}
