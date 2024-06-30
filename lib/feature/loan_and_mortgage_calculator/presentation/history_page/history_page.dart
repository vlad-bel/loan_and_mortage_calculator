import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_and_mortgage_calculator/core/app/di/injection.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_styles.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_theme.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_values.dart';
import 'package:loan_and_mortgage_calculator/core/ui_kit/app_input/app_bottomsheet.dart';
import 'package:loan_and_mortgage_calculator/core/util/money_formatter.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculate_type.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/presentation/calculator_details_bottomsheet/calculator_details_bottomsheet.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/presentation/history_page/bloc/history_page_bloc.dart';

@RoutePage()
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppValues.kPageMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppValues.kPageMargin.h,
              ),
              Text(
                "История расчетов",
                style: AppStyles.titleL.copyWith(
                  color: context.theme.appColors.textPrimary,
                ),
              ),
              BlocBuilder<HistoryPageBloc, HistoryPageState>(
                bloc: getIt<HistoryPageBloc>(),
                builder: (context, state) {
                  if (state.calculationList.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          "История пуста",
                          style: AppStyles.titleL.copyWith(
                            color: context.theme.appColors.textPrimary,
                          ),
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView(
                      children: [
                        for (var i = 0; i < state.calculationList.length; i++) ...{
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppValues.kSmallMargin,
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(
                                AppValues.kDefaultBorderRadius.r,
                              ),
                              child: InkWell(
                                onTap: () {
                                  AppBottomSheet.show(
                                    context: context,
                                    child: CalculatorDetailsBottomsheet(calculationEntity: state.calculationList[i]),
                                    title:
                                        "${state.calculationList[i].calculateType == CalculateType.annuity ? "Аннуитетный" : "Дифферинцированный"} расчет",
                                  );
                                },
                                borderRadius: BorderRadius.circular(
                                  AppValues.kDefaultBorderRadius.r,
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: context.theme.appColors.widgetBackground,
                                    borderRadius: BorderRadius.circular(
                                      AppValues.kDefaultBorderRadius,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(
                                    AppValues.kPageMargin,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Расчет $i:",
                                        style: AppStyles.buttons.copyWith(
                                          color: context.theme.appColors.textPrimary,
                                        ),
                                      ),
                                      Text(
                                        "Тип: ${switch (state.calculationList[i].calculateType) {
                                          // TODO: Handle this case.
                                          CalculateType.annuity => "Аннуитетный",
                                          // TODO: Handle this case.
                                          CalculateType.differentiated => "Дифференцированный",
                                        }}",
                                        style: AppStyles.body.copyWith(
                                          color: context.theme.appColors.textPrimary,
                                        ),
                                      ),
                                      Text(
                                        "Сумма кредита: ${MoneyFormatter.getFormattedValue(state.calculationList[i].sumOfCredit.toDouble())} руб",
                                        style: AppStyles.body.copyWith(
                                          color: context.theme.appColors.textPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        },
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
