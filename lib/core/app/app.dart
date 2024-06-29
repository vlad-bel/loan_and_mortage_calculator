import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_and_mortgage_calculator/core/app/di/injection.dart';
import 'package:loan_and_mortgage_calculator/core/app/router/router.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_theme.dart';

class LoanAndMortgageApp extends StatefulWidget {
  const LoanAndMortgageApp({super.key});

  @override
  State<LoanAndMortgageApp> createState() => _LoanAndMortgageAppState();
}

class _LoanAndMortgageAppState extends State<LoanAndMortgageApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 795),
      minTextAdapt: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Кредитный калькулятор",
        theme: light,
        routerConfig: getIt<AppRouter>().config(),
      ),
    );
  }
}
