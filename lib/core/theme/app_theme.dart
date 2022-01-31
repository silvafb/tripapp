import 'app_colors.dart';
import 'app_images.dart';
import 'app_text_styles.dart';

class AppTheme {
  static final instance = AppTheme();

  final _colors = AppColorsImpl();
  static AppColors get colors => instance._colors;

  final _textStyles = AppTextStyleImpl();
  static AppTextStyle get textStyles => instance._textStyles;

  final _appImages = AppImagesImpl();
  static AppImages get appImages => instance._appImages;
}
