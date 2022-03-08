import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RedBullStyle {
  // Colors
  static const Color fontColor = Color(0xFFF8F8F8);
  static const Color facebookColor = Color(0xFF3B5998);
  static const Color grayFontColor = Color(0xFF94969B);

  // Margins, Paddings, Card properties
  static const double bodyPadding = 15.0;
  static const double buttonPaddingVertical = 15.0;
  static const double buttonPaddingHorizontal = 150.0;

  // Font sizes, TextStyles
  static const double textSizeSmall = 17.0;
  static const double textSizeTitle = 31.0;

  static TextStyle get textTitle => GoogleFonts.getFont(
        'Assistant',
        color: RedBullStyle.fontColor,
        fontWeight: FontWeight.w500,
        fontSize: 31,
      );

  static TextStyle textTitleCustom(Color c, double fSize) =>
      GoogleFonts.getFont(
        'Assistant',
        color: c,
        fontWeight: FontWeight.w600,
        fontSize: fSize,
      );
}
