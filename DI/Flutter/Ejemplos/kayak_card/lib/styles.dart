import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KayakStyle {
  // Colors
  static const Color primary = Color(0xFFFF7714);
  static const Color backColor = Color(0xFFE4E5EA);
  static const Color fontMainColor = Color(0xFF040404);
  static const Color grayFontColor = Color(0xFF8E8F96);

  // Margins, Paddings, Card properties
  static const double bodyPadding = 15.0;

  // Font sizes, TextStyles
  static const double textSizeSmall = 13.0;
  static const double textSizeMedium = 25.0;
  static const double textSizeLarge = 30.0;

  static TextStyle get smallText => GoogleFonts.getFont(
        'Roboto',
        color: KayakStyle.grayFontColor,
        fontWeight: FontWeight.w400,
        fontSize: 13,
      );

  static TextStyle get mediumText => GoogleFonts.getFont(
        'Roboto',
        color: KayakStyle.fontMainColor,
        fontWeight: FontWeight.w500,
        fontSize: 25,
      );

  static TextStyle get largeText => GoogleFonts.getFont(
        'Roboto',
        color: KayakStyle.fontMainColor,
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
