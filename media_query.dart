import 'dart:ui';

class CustomMediaQuery{
  static double screenWidth = window.physicalSize.width / window.devicePixelRatio;
  static double screenHeight = window.physicalSize.height / window.devicePixelRatio;
  static double screenArea = screenHeight * screenWidth;
}