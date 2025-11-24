import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int currentIndex = 0;

  void changeTab(int i) {
    currentIndex = i;
    notifyListeners();
  }
}