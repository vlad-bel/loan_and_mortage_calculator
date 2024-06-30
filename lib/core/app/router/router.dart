import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: BottomMenuRoute.page,
          path: '/',
          children: [
            AutoRoute(page: CalculatorRoute.page, path: 'calculator'),
            AutoRoute(page: HistoryRoute.page, path: 'history'),
          ],
        ),
      ];
}
