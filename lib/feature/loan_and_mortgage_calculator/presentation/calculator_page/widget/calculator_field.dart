import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_styles.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_theme.dart';
import 'package:loan_and_mortgage_calculator/core/ui_kit/app_input/app_input.dart';

class CalculatorField extends StatelessWidget {
  const CalculatorField({
    super.key,
    required this.controller,
    required this.currentSliderValue,
    required this.maxSliderValue,
    required this.minSliderValue,
    required this.onSliderChanged,
    required this.title,
    required this.hint,
    required this.sliderValueDescription,
    this.formatters,
    required this.onInputChange,
    required this.minliderDescr,
    required this.maxSliderDescr,
  });

  final TextEditingController controller;
  final double currentSliderValue;
  final double maxSliderValue;
  final double minSliderValue;
  final String minliderDescr;
  final String maxSliderDescr;
  final String sliderValueDescription;
  final String title;
  final String hint;
  final Function(double) onSliderChanged;
  final Function(String) onInputChange;
  final List<TextInputFormatter>? formatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppInput(
          controller: controller,
          title: title,
          hintText: hint,
          formatters: formatters,
          onChanged: onInputChange,
          inputType: const TextInputType.numberWithOptions(decimal: false),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width.w ,
          child: Slider(
            value: currentSliderValue,
            max: maxSliderValue,
            min: minSliderValue,
            onChanged: onSliderChanged,
            activeColor: context.theme.appColors.primary,
            inactiveColor: context.theme.appColors.primary,
            overlayColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
            thumbColor: context.theme.appColors.primary,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$minliderDescr $sliderValueDescription",
              style: AppStyles.body,
            ),
            Text(
              "$maxSliderDescr $sliderValueDescription",
              style: AppStyles.body,
            ),
          ],
        ),
      ],
    );
  }
}
