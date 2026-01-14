import 'package:flutter/material.dart';

/// A class that holds constant values for spacing, padding, and gaps.
class AppSpacing {
  AppSpacing._();

  // Paddings
  static const double p4 = 4;
  static const double p8 = 8;
  static const double p12 = 12;
  static const double p16 = 16;
  static const double p20 = 20;
  static const double p24 = 24;
  static const double p32 = 32;
  static const double p48 = 48;

  // Gaps
  static const Widget gapH8 = SizedBox(height: p8);
  static const Widget gapH16 = SizedBox(height: p16);
  static const Widget gapH24 = SizedBox(height: p24);
  static const Widget gapH32 = SizedBox(height: p32);
  static const Widget gapH48 = SizedBox(height: p48);
}
