import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlquilerStyle {
  // Colors
  static const Color primary = Color(0xFF121236);
  static const Color backColor = Color(0xFFEEEEEE);
  static const Color greenFontColor = Color(0xFF54C685);
  static const Color blueFontColor = Color(0xFF96B9E2);
  static const Color greyFontColor = Color(0xFFCFCFCF);
  static const Color mainFontColor = Color(0xFF19191D);

  // Margins, Paddings, Card properties
  static const double bodyPadding = 15.0;

  // Font sizes, TextStyles
  static const double textSizeSmall = 13.0;
  static const double textSizeMedium = 25.0;
  static const double textSizeLarge = 30.0;

  static TextStyle get smallText => GoogleFonts.getFont(
        'Roboto',
        color: AlquilerStyle.greyFontColor,
        fontWeight: FontWeight.w400,
        fontSize: 13,
      );

  static TextStyle get mediumText => GoogleFonts.getFont(
        'Roboto',
        color: AlquilerStyle.mainFontColor,
        fontWeight: FontWeight.w500,
        fontSize: 25,
      );

  static TextStyle get largeText => GoogleFonts.getFont(
        'Roboto',
        color: AlquilerStyle.mainFontColor,
        fontWeight: FontWeight.w600,
        fontSize: 30,
      );

  static TextStyle textTitleCustom(Color c, double fSize) =>
      GoogleFonts.getFont(
        'Roboto',
        color: c,
        fontWeight: FontWeight.w600,
        fontSize: fSize,
      );
}
