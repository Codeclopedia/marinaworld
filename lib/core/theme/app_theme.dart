import '../constants.dart';
import '../ui_core.dart';

class AppTheme {
  static final _themeLight =
      ThemeData(brightness: Brightness.light, fontFamily: 'manrope');

  static final themeLight = _themeLight.copyWith(
    colorScheme: _themeLight.colorScheme.copyWith(
      primary: AppColors.primaryColor,
      // secondary: AppColors.addedColor,
    ),
  );

  static final _themeDark =
      ThemeData(brightness: Brightness.dark, fontFamily: 'manrope');

  static final themeDark = _themeDark.copyWith(
    colorScheme: _themeDark.colorScheme.copyWith(
      primary: AppColors.primaryColor,
      // secondary: AppColors.addedColor,
    ),
  );
}
