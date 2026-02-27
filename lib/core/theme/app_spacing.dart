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

  // Gaps - Height
  static const Widget gapH4 = SizedBox(height: p4);
  static const Widget gapH8 = SizedBox(height: p8);
  static const Widget gapH12 = SizedBox(height: p12);
  static const Widget gapH16 = SizedBox(height: p16);
  static const Widget gapH20 = SizedBox(height: p20);
  static const Widget gapH24 = SizedBox(height: p24);
  static const Widget gapH32 = SizedBox(height: p32);
  static const Widget gapH48 = SizedBox(height: p48);

  // Gaps - Width
  static const Widget gapW4 = SizedBox(width: p4);
  static const Widget gapW8 = SizedBox(width: p8);
  static const Widget gapW12 = SizedBox(width: p12);
  static const Widget gapW16 = SizedBox(width: p16);
  static const Widget gapW20 = SizedBox(width: p20);
  static const Widget gapW24 = SizedBox(width: p24);
  static const Widget gapW32 = SizedBox(width: p32);
  static const Widget gapW48 = SizedBox(width: p48);
}
