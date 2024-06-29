import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_styles.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_values.dart';
import 'package:loan_and_mortgage_calculator/gen/assets.gen.dart';

class AppBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    required String title,
    bool showBackButton = false,
    double? initialChildSize,
    bool scrollBar = true,
    Color? color,
    Function()? onClose,
  }) async {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      barrierColor: color,
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: initialChildSize ?? 0.8,
          builder: (_, controller) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _topThumb(),
                    _title(context, title: title, showBackButton: showBackButton, onClose: onClose),
                    Expanded(
                      child: scrollBar ? Scrollbar(thumbVisibility: true, child: child) : child,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  static Widget _topThumb() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppValues.kPageMargin),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 32,
            height: 4,
            decoration: const BoxDecoration(
              color: Color(0xFF79747E),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _title(BuildContext context, {required String title, required bool showBackButton, Function? onClose}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppValues.kBigMargin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showBackButton)
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.router.pop();
                    },
                    child: SvgPicture.asset(Assets.icon.icArrowBack),
                  ),
                  const SizedBox(width: AppValues.kPageMargin),
                  Expanded(
                    child: Text(
                      title,
                      style: AppStyles.titleL,
                    ),
                  ),
                ],
              ),
            )
          else
            Expanded(
              child: Text(
                title,
                style: AppStyles.titleL,
              ),
            ),
          GestureDetector(
            onTap: () {
              onClose != null ? onClose.call() : context.router.pop();
            },
            child: const Icon(
              Icons.close,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
