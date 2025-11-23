import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fabrics_design/features/presentation/screens/cart_screen/cart_screen.dart';
import 'package:fabrics_design/features/presentation/screens/home_screen/home_screen.dart';
import 'package:fabrics_design/features/presentation/screens/profile_screen/profile_screen.dart';
import 'package:fabrics_design/features/presentation/screens/shopping_screen/shopping_screen.dart';
import 'package:fabrics_design/utils/constants/colors.dart';
import 'package:fabrics_design/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // int index = 0;
  late int index;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
  }

  final screens = [
    HomeScreen(),
    ShoppingScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home_rounded, size: ZohSizes.spaceBtwSections, color: Colors.white),
      Icon(Icons.shopify_rounded, size: ZohSizes.spaceBtwSections, color: Colors.white),
      Icon(Icons.shopping_cart_rounded, size: ZohSizes.spaceBtwSections, color: Colors.white),
      Icon(Icons.person, size: ZohSizes.spaceBtwSections, color: Colors.white),
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Your main page background (can be any color, gradient, or image)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Color(0xFFF5F5F5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: screens[index],
          ),

          // The curved navigation bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              child: CurvedNavigationBar(
                key: navigationKey,
                index: index,
                items: items,
                onTap: (i) => setState(() => index = i),
                backgroundColor: Colors.transparent,
                color: ZohColors.primaryColor,
                buttonBackgroundColor: ZohColors.primaryColor,
                height: 65,
                animationCurve: Curves.easeInOut,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
