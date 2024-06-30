import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MoneyFormatter extends TextInputFormatter {
  static final _formatter = NumberFormat('#,###,###', 'ru_RU');

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String newText = newValue.text.replaceAll(RegExp(r'[^0-9.]'), '');

    if (newText.indexOf('.') != newText.lastIndexOf('.')) {
      return oldValue;
    }

    double value;
    try {
      value = double.parse(newText);
    } catch (e) {
      return oldValue;
    }

    String formattedText = getFormattedValue(value);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  static double getUnformattedValue(String value) {
    var number = _formatter.parse(value.replaceAll(" ", ""));
    return number.toDouble();
  }

  static String getFormattedValue(double value) {
    String formattedText = _formatter.format(value);
    return formattedText;
  }
}
