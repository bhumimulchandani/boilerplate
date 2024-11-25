import 'package:boilerplate/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle typo14blueBold = GoogleFonts.openSans(
    fontSize: 14,
    height: 1.2,
    color: AppColors.blue,
    fontWeight: FontWeight.bold
  );

  static TextStyle typo14greyRegular = GoogleFonts.openSans(
    fontSize: 14,
    height: 1.2,
    color: AppColors.grey,
  );

  static TextStyle typo20DarkBold = GoogleFonts.openSans(
    fontSize: 20,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static TextStyle typo12ErrorRegular = GoogleFonts.openSans(
    fontSize: 12,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.error,
  );

  static TextStyle typo40BlackNormal = GoogleFonts.openSans(
    fontSize: 40,
    height: 1.2,
  );

  static TextStyle typo16MediumkBold = GoogleFonts.openSans(
    fontSize: 16,
    height: 1.2,
    fontWeight: FontWeight.w400,
  );
}
