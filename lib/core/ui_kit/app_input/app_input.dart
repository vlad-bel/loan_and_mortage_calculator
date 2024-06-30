import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_styles.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_theme.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_values.dart';
import 'package:loan_and_mortgage_calculator/core/ui_kit/app_input/input_validation_mixins.dart';
import 'package:loan_and_mortgage_calculator/core/ui_kit/app_input/input_validator_model.dart';
import 'package:loan_and_mortgage_calculator/gen/assets.gen.dart';

class AppInput extends StatefulWidget with InputValidationMixin {
  static const double kDefaultHeight = 56;
  final Widget? prefix;
  final Widget? suffixWidget;
  final String? hintText;
  final String? suffixText;
  final TextInputType inputType;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  final TextEditingController controller;
  final double? height;
  final bool autoFocus;
  final EdgeInsets padding;
  final bool readOnly;
  final Function(bool)? onFocus;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String text)? onFieldSubmitted;
  final List<TextInputFormatter>? formatters;
  final String? errorString;
  final List<MHFInputValidatorModel> validators;
  final FocusNode? focusNode;
  final bool? disable;
  final String? title;
  final TextInputAction? inputAction;
  final int? maxLines;
  final int? minLines;
  final EdgeInsets scrollPadding;
  final TextAlign textAlign;
  final double? borderRadius;
  final BoxBorder? border;

  const AppInput({
    super.key,
    this.prefix = const SizedBox(),
    this.inputType = TextInputType.text,
    this.textStyle,
    this.backgroundColor,
    required this.controller,
    this.height = kDefaultHeight,
    this.disable = false,
    this.autoFocus = false,
    this.padding = const EdgeInsets.all(AppValues.kPageMargin),
    this.readOnly = false,
    this.onFocus,
    this.suffixWidget = const SizedBox(),
    this.formatters,
    this.errorString,
    this.validators = const [],
    this.focusNode,
    this.onChanged,
    this.hintStyle,
    this.hintText,
    this.title,
    this.maxLines,
    this.minLines,
    this.scrollPadding = const EdgeInsets.all(AppValues.kBigMargin),
    this.textAlign = TextAlign.start,
    this.suffixText,
    this.inputAction,
    this.onTap,
    this.onFieldSubmitted,
    this.borderRadius,
    this.border,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  String? _errorString;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _errorString = widget.errorString;
    super.initState();
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? AppValues.kDefaultBorderRadius)),
        border: _errorString != null
            ? Border.all(color: context.theme.appColors.appBackground)
            : Border.all(color: context.theme.appColors.primary, width: 1));
  }

  Widget _suffix() {
    return Align(
      alignment: Alignment.centerRight,
      child: _errorString == null ? widget.suffixWidget : _errorIcon(),
    );
  }

  Widget _errorIcon() {
    return SvgPicture.asset(Assets.icon.icError);
  }

  Widget _prefix() {
    return widget.prefix != null ? widget.prefix! : const SizedBox();
  }

  Widget _input() {
    return Expanded(
      child: TextFormField(
        onTap: widget.onTap,
        onFieldSubmitted: widget.onFieldSubmitted,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        textAlign: widget.textAlign,
        scrollPadding: widget.scrollPadding,
        maxLines: widget.maxLines,
        textInputAction: widget.inputAction,
        minLines: widget.minLines,
        enabled: widget.disable == false,
        keyboardType: widget.inputType,
        controller: widget.controller,
        inputFormatters: widget.formatters,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        autofocus: widget.autoFocus,
        cursorColor: context.theme.appColors.textPrimary,
        style: widget.textStyle?.copyWith(fontSize: 12.sp),

        decoration: InputDecoration(
          suffixIcon: Text(widget.suffixText ?? '', style: widget.hintStyle),
          suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
          hintStyle: AppStyles.body,
          hintText: widget.hintText,
          errorStyle: const TextStyle(height: 0, fontSize: 0),
          isDense: true,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(bottom: 0),
        ),
        validator: (val) {
          String? errStr = widget.validateField(val?.trim(), widget.validators);

          if (errStr != null) {
            setState(() {
              _errorString = errStr;
            });
            return '';
          }

          setState(() {
            _errorString = null;
          });
          return null;
        },
        readOnly: widget.readOnly,
        onEditingComplete: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }

  Widget _body() {
    return Focus(
      focusNode: _focusNode,
      onFocusChange: (focus) {
        if (widget.onFocus != null) {
          widget.onFocus!(focus);
        }
      },
      child: Container(
        padding: widget.padding,
        // height: widget.height!.h,
        decoration: _boxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _prefix(),
            _input(),
            _suffix(),
          ],
        ),
      ),
    );
  }

  Widget _errorWidget() {
    return Container(
      margin: const EdgeInsets.only(
        left: AppValues.kPageMargin,
        top: AppValues.kPageMargin,
      ),
      child: Text(
        _errorString!,
        style: AppStyles.body.copyWith(
          color: context.theme.appColors.error,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        if (widget.title != null) Text(widget.title!, style: AppStyles.titleS),
        if (widget.title != null) SizedBox(height: AppValues.kSmallMarginX2),
        SizedBox(
          width: size.width,
          child: _body(),
        ),
        if (_errorString != null && _errorString!.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(left: AppValues.kPageMargin, top: 4),
            child: _errorWidget(),
          ),
      ],
    );
  }
}
