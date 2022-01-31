import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class AppTextStyle {
  TextStyle get label;
  TextStyle get input;
  TextStyle get hint;
  TextStyle get buttonTextStyleColor;
  TextStyle get buttonBoldTextColor;
  TextStyle get buttonTextColor;
  TextStyle get title;
  TextStyle get titleSuccess;
  TextStyle get titleError;
  TextStyle get subTitle;
  TextStyle get titleWhite;
  TextStyle get subTitleWhite;
  TextStyle get subTitleGrey;
}

class AppTextStyleImpl implements AppTextStyle {
  @override
  TextStyle get buttonTextStyleColor => GoogleFonts.inter(
    fontSize: 16,
    color: AppTheme.colors.background,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle get buttonBoldTextColor => GoogleFonts.inter(
    fontSize: 16,
    color: AppTheme.colors.textColor,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle get buttonTextColor => GoogleFonts.inter(
    fontSize: 16,
    color: AppTheme.colors.textColor,
    fontWeight: FontWeight.normal,
  );

  @override
  TextStyle get hint => GoogleFonts.inter(
    fontSize: 16,
    color: AppTheme.colors.inputNormal,
    fontWeight: FontWeight.normal,
  );

  @override
  TextStyle get input => GoogleFonts.inter(
    fontSize: 18,
    color: AppTheme.colors.inputNormal,
    fontWeight: FontWeight.normal,
  );

  @override
  TextStyle get label => GoogleFonts.inter(
    fontSize: 16,
    color: AppTheme.colors.textColor,
    fontWeight: FontWeight.normal,
  );

  @override
  TextStyle get subTitle => GoogleFonts.inter(
    fontSize: 16,
    color: AppTheme.colors.subTitle,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle get title => GoogleFonts.inter(
    fontSize: 22,
    color: AppTheme.colors.title,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle get subTitleWhite => GoogleFonts.inter(
    fontSize: 12,
    color: AppTheme.colors.subTitleWhite,
  );

  @override
  TextStyle get titleWhite => GoogleFonts.inter(
    fontSize: 22,
    color: AppTheme.colors.titleWhite,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle get subTitleGrey => GoogleFonts.inter(
    fontSize: 12,
    color: AppTheme.colors.subTitleGrey,
  );

  @override
  TextStyle get titleSuccess => GoogleFonts.inter(
    fontSize: 30,
    color: AppTheme.colors.titleSuccess,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle get titleError => GoogleFonts.inter(
    fontSize: 30,
    color: AppTheme.colors.titleError,
    fontWeight: FontWeight.bold,
  );

}
