import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_colors.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_styles.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_theme.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_values.dart';

class AppButton extends StatelessWidget {
  final Function? onTap;
  final String text;
  final Color? color;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double? width;
  final double height;
  final bool isOutline;
  static const double kDefaultButtonHeight = 56;
  final Widget prefixWidget;
  final Widget suffixWidget;
  final bool isLoading;
  final double borderRadius;
  final Alignment textAlignment;
  final int textFlex;

  const AppButton({
    Key? key,
    this.isLoading = false,
    required this.onTap,
    required this.text,
    this.color,
    this.borderColor,
    this.textStyle,
    this.width,
    this.height = kDefaultButtonHeight,
    this.prefixWidget = const SizedBox(),
    this.borderRadius = AppValues.kDefaultBorderRadius,
    this.suffixWidget = const SizedBox(),
    this.textAlignment = Alignment.center,
    this.textFlex = 1,
    this.isOutline = false,
  }) : super(key: key);

  Widget _text(BuildContext context) {
    return Align(
      alignment: textAlignment,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle ??
              AppStyles.buttons.copyWith(
                color: isOutline ? context.theme.appColors.primary : context.theme.appColors.widgetBackground,
              ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
        color: borderColor ?? context.theme.appColors.primary,
        width: 1,
      ),
      color: onTap == null
          ? AppColors.grey1
          : isOutline
              ? Colors.transparent
              : color ?? context.theme.appColors.primary,
      borderRadius: BorderRadius.circular(AppValues.kDefaultBorderRadius),
    );
  }

  Widget _content(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: isLoading
          ? const Padding(padding: EdgeInsets.all(4), child: CircularProgressIndicator())
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                prefixWidget,
                Expanded(
                  flex: textFlex,
                  child: _text(context),
                ),
                suffixWidget,
              ],
            ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Ink(
      width: width?.w ?? double.infinity,
      height: height.h,
      decoration: _boxDecoration(context),
      child: _content(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Material(
      borderRadius: BorderRadius.circular(AppValues.kDefaultBorderRadius),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppValues.kDefaultBorderRadius),
        onTap: onTap != null ? () => onTap!() : null,
        child: _body(size, context),
      ),
    );
  }
}
