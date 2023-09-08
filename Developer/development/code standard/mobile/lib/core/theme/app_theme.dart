import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

export 'package:google_fonts/google_fonts.dart';

part 'src/color_theme.dart';

part 'src/font_theme.dart';

class AppTheme {
  // Fonts for implements in our apps.
  static AppFontsTheme font = AppFontsTheme();

  // Colors for implements in our apps.
  static AppColorsTheme color = AppColorsTheme();

  // SIZE
  static const double sizeS = 12;
  static const double sizeM = 14;
  static const double sizeL = 18;
  static const double sizeXL = 21; // use for padding edge of screen
  static const double sizeXXL = 24;
  static const double sizeXXXL = 26;

  // Card theme default
  static CardTheme get defaultCardTheme => CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: color.borderColor),
        ),
        margin: EdgeInsets.zero,
      );
}
