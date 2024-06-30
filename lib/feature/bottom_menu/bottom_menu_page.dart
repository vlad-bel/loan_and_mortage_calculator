import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loan_and_mortgage_calculator/core/app/di/injection.dart';
import 'package:loan_and_mortgage_calculator/core/app/router/router.gr.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_styles.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_theme.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_values.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/presentation/history_page/bloc/history_page_bloc.dart';
import 'package:loan_and_mortgage_calculator/gen/assets.gen.dart';

@RoutePage()
class BottomMenuPage extends StatefulWidget {
  const BottomMenuPage({super.key});

  @override
  State<BottomMenuPage> createState() => _BottomMenuPageState();
}

class _BottomMenuPageState extends State<BottomMenuPage> {
  final List<PageRouteInfo<void>> _buildRoutes = const [
    CalculatorRoute(),
    HistoryRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: _buildRoutes,
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          decoration: BoxDecoration(color: context.theme.appColors.widgetBackground),
          child: Padding(
            padding: const EdgeInsets.only(top: AppValues.kSmallMargin, bottom: AppValues.kPageMargin),
            child: Row(
              children: _navBarsItems(
                activeIndex: tabsRouter.activeIndex,
                onSelectedItem: tabsRouter.setActiveIndex,
              ).map((e) => Expanded(child: e)).toList(),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _navBarsItems({
    required int activeIndex,
    required Function(int index) onSelectedItem,
  }) {
    return [
      _buildNavItem(
        item: BottomMenuItem(
          assetName: Assets.icon.icAdd,
          label: 'Калькулятор',
          index: 0,
        ),
        isActive: activeIndex == 0,
        onSelectedItem: onSelectedItem,
      ),
      _buildNavItem(
        item: BottomMenuItem(
          assetName: Assets.icon.icViewList,
          label: 'История',
          index: 1,
        ),
        isActive: activeIndex == 1,
        onSelectedItem: (index){
          onSelectedItem(index);
          getIt<HistoryPageBloc>().add(const HistoryPageEvent.update());
        },
      ),
    ];
  }

  Widget _buildNavItem({
    bool isActive = true,
    required BottomMenuItem item,
    required Function(int index) onSelectedItem,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onSelectedItem(item.index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: isActive
                ? BoxDecoration(
                    color: context.theme.appColors.primary,
                    borderRadius: BorderRadius.circular(AppValues.kDefaultBorderRadius),
                  )
                : null,
            padding: const EdgeInsets.symmetric(horizontal: AppValues.kSmallMargin, vertical: AppValues.kSmallMargin),
            child: SizedBox(
              width: 16.w,
              height: 16.h,
              child: SvgPicture.asset(
                item.assetName,
                colorFilter: ColorFilter.mode(
                  isActive ? context.theme.appColors.widgetBackground : context.theme.appColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            item.label,
            style: AppStyles.body.copyWith(
              color: context.theme.appColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomMenuItem {
  String assetName;
  String label;
  int index;

  BottomMenuItem({
    required this.assetName,
    required this.label,
    required this.index,
  });
}
