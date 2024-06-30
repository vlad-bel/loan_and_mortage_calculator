import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_and_mortgage_calculator/core/app/di/injection.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_styles.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_theme.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_values.dart';
import 'package:loan_and_mortgage_calculator/core/ui_kit/app_button/app_button.dart';
import 'package:loan_and_mortgage_calculator/core/ui_kit/modal/app_bottomsheet.dart';
import 'package:loan_and_mortgage_calculator/core/ui_kit/modal/app_snackbar.dart';
import 'package:loan_and_mortgage_calculator/core/util/formatted_text_editing_controller.dart';
import 'package:loan_and_mortgage_calculator/core/util/money_formatter.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculate_type.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/presentation/calculator_details_bottomsheet/calculator_details_bottomsheet.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/presentation/calculator_page/bloc/calculator_page_bloc.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/presentation/calculator_page/widget/calculator_field.dart';

@RoutePage()
class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final bloc = getIt<CalculatorPageBloc>();

  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppValues.kPageMargin),
          child: BlocConsumer<CalculatorPageBloc, CalculatorPageState>(
            bloc: bloc,
            listener: (context, state) {
              if (state.error != null) {
                AppSnackbar.show(
                  context: context,
                  titleText: state.error!,
                  error: true,
                );
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppValues.kPageMargin.h,
                  ),
                  Text(
                    "Ипотечный калькулятор",
                    style: AppStyles.titleL.copyWith(
                      color: context.theme.appColors.textPrimary,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: AppValues.kPageMargin,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: context.theme.appColors.widgetBackground,
                            borderRadius: BorderRadius.circular(
                              AppValues.kDefaultBorderRadius,
                            ),
                          ),
                          padding: const EdgeInsets.all(AppValues.kPageMargin),
                          child: Column(
                            children: [
                              CalculatorField(
                                title: "Стоимость недвижимости ₽",
                                hint: "Введите сумму",
                                controller: bloc.totalCostController,
                                currentSliderValue: state.currentSumm,
                                minSliderValue: state.minSum,
                                maxSliderValue: state.maxSum,
                                minliderDescr: MoneyFormatter.getFormattedValue(state.minSum),
                                maxSliderDescr: MoneyFormatter.getFormattedValue(state.maxSum),
                                sliderValueDescription: "руб",
                                onInputChange: (value) {
                                  if (value.isEmpty || value.startsWith("0")) {
                                    bloc.add(const CalculatorPageEvent.moneyNotValid());
                                  }
                                  if (value.isNotEmpty) {
                                    final currentValue = MoneyFormatter.getUnformattedValue(value);
                                    bloc.add(CalculatorPageEvent.updateMoney(currentValue: currentValue));
                                  }
                                },
                                onSliderChanged: (value) {
                                  bloc.add(CalculatorPageEvent.updateMoneySlider(currentValue: value));
                                },
                              ),
                              const SizedBox(
                                height: AppValues.kPageMargin,
                              ),
                              CalculatorField(
                                title: "Процентная ставка %",
                                hint: "Введите процент",
                                controller: bloc.percentController,
                                currentSliderValue: state.currentPercent.toDouble(),
                                minSliderValue: state.minPercent.toDouble(),
                                maxSliderValue: state.maxPercent.toDouble(),
                                sliderValueDescription: "%",
                                onSliderChanged: (value) {
                                  bloc.add(CalculatorPageEvent.updatePercentSlider(currentValue: value.toInt()));
                                },
                                onInputChange: (value) {
                                  if (value.isEmpty || value.startsWith("0")) {
                                    bloc.add(const CalculatorPageEvent.percentNotValid());
                                  }
                                  if (value.isNotEmpty) {
                                    bloc.add(CalculatorPageEvent.updatePercent(currentValue: int.parse(value)));
                                  }
                                },
                                minliderDescr: "${state.minPercent}",
                                maxSliderDescr: "${state.maxPercent}",
                              ),
                              const SizedBox(
                                height: AppValues.kPageMargin,
                              ),
                              CalculatorField(
                                title: "Срок ипотеки мес",
                                hint: "Введите срок",
                                controller: bloc.periodController,
                                currentSliderValue: state.currentPeriod.toDouble(),
                                minSliderValue: state.minPeriod.toDouble(),
                                maxSliderValue: state.maxPeriod.toDouble(),
                                sliderValueDescription: "мес",
                                onSliderChanged: (value) {
                                  bloc.add(CalculatorPageEvent.updatePeriodSlider(currentValue: value.toInt()));
                                },
                                onInputChange: (value) {
                                  if (value.isEmpty || value.startsWith("0")) {
                                    bloc.add(const CalculatorPageEvent.periodNotValid());
                                  }
                                  if (value.isNotEmpty) {
                                    bloc.add(CalculatorPageEvent.updatePeriod(currentValue: int.parse(value)));
                                  }
                                },
                                minliderDescr: "${state.minPeriod}",
                                maxSliderDescr: "${state.maxPeriod}",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppValues.kPageMargin.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppButton(
                                onTap: () {
                                  bloc.add(
                                    const CalculatorPageEvent.switchCalculationType(
                                      type: CalculateType.annuity,
                                    ),
                                  );
                                },
                                text: 'Аннуитетный',
                                isOutline: state.calculateType == CalculateType.differentiated ? true : false,
                              ),
                            ),
                            SizedBox(
                              width: AppValues.kSmallMargin.w,
                            ),
                            Expanded(
                              child: AppButton(
                                onTap: () {
                                  bloc.add(
                                    const CalculatorPageEvent.switchCalculationType(
                                      type: CalculateType.differentiated,
                                    ),
                                  );
                                },
                                text: 'Дифференцированный',
                                isOutline: state.calculateType == CalculateType.annuity ? true : false,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppValues.kPageMargin.h,
                        ),
                        AppButton(
                          onTap: state.percentIsValid && state.moneyIsValid && state.periodIsValid
                              ? () {
                                  bloc.add(
                                    CalculatorPageEvent.calculate(
                                      onCalculate: (calculation) {
                                        AppBottomSheet.show(
                                          context: context,
                                          child: CalculatorDetailsBottomsheet(
                                            calculationEntity: calculation,
                                          ),
                                          title:
                                              "${calculation.calculateType == CalculateType.annuity ? "Аннуитетный" : "Дифферинцированный"} расчет",
                                        );
                                      },
                                    ),
                                  );
                                }
                              : null,
                          text: 'Расчитать',
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
