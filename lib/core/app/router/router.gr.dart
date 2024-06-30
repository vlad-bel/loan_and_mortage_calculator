// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:loan_and_mortgage_calculator/feature/bottom_menu/bottom_menu_page.dart'
    as _i1;
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/presentation/calculator_page/calculator_page.dart'
    as _i2;
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/presentation/history_page/history_page.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    BottomMenuRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BottomMenuPage(),
      );
    },
    CalculatorRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CalculatorPage(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HistoryPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BottomMenuPage]
class BottomMenuRoute extends _i4.PageRouteInfo<void> {
  const BottomMenuRoute({List<_i4.PageRouteInfo>? children})
      : super(
          BottomMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomMenuRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CalculatorPage]
class CalculatorRoute extends _i4.PageRouteInfo<void> {
  const CalculatorRoute({List<_i4.PageRouteInfo>? children})
      : super(
          CalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalculatorRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HistoryPage]
class HistoryRoute extends _i4.PageRouteInfo<void> {
  const HistoryRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
