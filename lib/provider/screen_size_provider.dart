import 'package:flutter/material.dart';

class ScreenSizeProvider with ChangeNotifier {
  double width = 0;
  double height = 0;

  void updateSize(Size size) {
    width = size.width;
    height = size.height;
    notifyListeners();
  }
}
