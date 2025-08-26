import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fabrics_design/features/presentation/screens/cart_screen/cart_screen.dart';
import 'package:fabrics_design/features/presentation/screens/home_screen/home_screen.dart';
import 'package:fabrics_design/features/presentation/screens/profile_screen/profile_screen.dart';
import 'package:fabrics_design/features/presentation/screens/shopping_screen/shopping_screen.dart';
import 'package:fabrics_design/utils/constants/colors.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  final items = <Widget>[
    Icon(Icons.home_rounded, size: ZohSizes.spaceBtwSections),
    Icon(Icons.shopify_rounded, size: ZohSizes.spaceBtwSections),
    Icon(Icons.shopping_cart_rounded, size: ZohSizes.spaceBtwSections),
    Icon(Icons.person, size: ZohSizes.spaceBtwSections),
  ];

  final screens = [
    HomeScreen(),
    ShoppingScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      extendBody: true,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white)
        ),
        child: CurvedNavigationBar(
          items: items,
          key: navigationKey,
          index: index,
          onTap: (index) => setState(() {
            this.index = index;
          }),
          backgroundColor: Colors.transparent,
          height: 70,
          animationCurve: Curves.easeInOut,
          color: ZohColors.primaryColor,
          buttonBackgroundColor: ZohColors.primaryColor,
        ),
      ),
    );
  }
}
