import 'package:fabrics_design/features/presentation/screens/home_screen/home_screen.dart';
import 'package:fabrics_design/features/presentation/screens/splash_screen/splash_screen.dart';
import 'package:fabrics_design/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ZohAppTheme.lightTheme,
      darkTheme: ZohAppTheme.darkTheme,
      home: SplashScreen(),
    );
  }
}
