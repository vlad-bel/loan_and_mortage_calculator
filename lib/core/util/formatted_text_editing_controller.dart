import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormattedTextEditingController extends TextEditingController {
  final TextInputFormatter formatter;

  FormattedTextEditingController({required this.formatter, super.text});

  @override
  void notifyListeners() {
    if (text.isNotEmpty) {
      final newText = formatter
          .formatEditUpdate(
            TextEditingValue(text: text),
            TextEditingValue(text: text, selection: selection),
          )
          .text;

      if (newText != text) {
        value = value.copyWith(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
        );
      }
      super.notifyListeners();
    }

  }
}
