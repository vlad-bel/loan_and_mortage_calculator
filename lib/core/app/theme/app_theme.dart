import 'package:flutter/material.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_colors.dart';

final light = ThemeData.light().copyWith(
  extensions: [
    lightAppColors,
  ],
);

final lightAppColors = AppColorsExtension(
  appBackground: AppColors.grey1,
  widgetBackground: AppColors.white,
  textPrimary: AppColors.black,
  textSecondary: AppColors.grey2,
  textField: AppColors.grey3,
  error: AppColors.red,
);

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.appBackground,
    required this.widgetBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.textField,
    required this.error,
  });

  final Color appBackground;
  final Color widgetBackground;
  final Color textPrimary;
  final Color textSecondary;
  final Color textField;
  final Color error;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? appBackground,
    Color? widgetBackground,
    Color? textPrimary,
    Color? textSecondary,
    Color? textField,
    Color? error,
  }) {
    return AppColorsExtension(
      appBackground: appBackground ?? this.appBackground,
      widgetBackground: widgetBackground ?? this.widgetBackground,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textField: textField ?? this.textField,
      error: error ?? this.error,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      appBackground: Color.lerp(appBackground, other.appBackground, t)!,
      widgetBackground: Color.lerp(widgetBackground, other.widgetBackground, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textField: Color.lerp(textField, other.textField, t)!,
      error: Color.lerp(error, other.error, t)!,
    );
  }
}

extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors => extension<AppColorsExtension>() ?? lightAppColors;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
