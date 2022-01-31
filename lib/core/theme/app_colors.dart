import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;
  Color get buttonDisabled;
  Color get textDisabled;
  Color get textEnabled;
  Color get inputNormal;
  Color get background;
  Color get iconInactive;
  Color get textColor;
  Color get backButton;
  Color get border;
  Color get title;
  Color get titleSuccess;
  Color get titleError;
  Color get subTitle;
  Color get titleWhite;
  Color get subTitleWhite;
  Color get icon;
  Color get subTitleGrey;
}

class AppColorsImpl implements AppColors {
  @override
  Color get background => const Color(0xFFF7F7F7);

  @override
  Color get buttonDisabled => const Color(0xFFABABAB);

  @override
  Color get iconInactive => const Color(0xFF8C8C8C);

  @override
  Color get inputNormal => const Color(0xFF949B9C);

  @override
  Color get primary => const Color(0xFF186CDA);

  @override
  Color get textColor => const Color(0xFF272727);

  @override
  Color get textDisabled => const Color(0xFFD9D9D9);

  @override
  Color get textEnabled => const Color(0xFFFFFFFF);

  @override
  Color get border => const Color(0xFFE9E9EC);

  @override
  Color get subTitle => const Color(0xFF000000);

  @override
  Color get title => const Color(0xFF1E1F20);

  @override
  Color get subTitleWhite => const Color(0xFFFFFFFF);

  @override
  Color get titleWhite => const Color(0xFFFFFFFF);

  @override
  Color get backButton => const Color(0xFF000000);

  @override
  Color get icon => const Color(0xFF00ABB8);

  @override
  Color get subTitleGrey => const Color(0xFFA4A4A4);

  @override
  Color get titleError => const Color(0xFFF44336);

  @override
  Color get titleSuccess => const Color(0xFF4CAF50);

}
