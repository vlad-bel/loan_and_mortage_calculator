import 'package:flutter/material.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_theme.dart';

class AppSnackbar {
  static show({
    required BuildContext context,
    required String titleText,
    Duration duration = const Duration(seconds: 2),
    bool error = false,
  }) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            backgroundColor: context.theme.appColors.error,
            padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
            margin: const EdgeInsets.only(bottom: 32, left: 16, right: 16),
            elevation: 5,
            content: Text(
              titleText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
        .closed
        .then((SnackBarClosedReason reason) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
    });
  }
}
