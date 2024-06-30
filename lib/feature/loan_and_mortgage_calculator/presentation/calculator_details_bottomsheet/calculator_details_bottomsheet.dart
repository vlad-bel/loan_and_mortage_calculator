import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_styles.dart';
import 'package:loan_and_mortgage_calculator/core/app/theme/app_values.dart';
import 'package:loan_and_mortgage_calculator/core/util/money_formatter.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculation_entity.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/presentation/calculator_details_bottomsheet/payment_chart.dart';

class CalculatorDetailsBottomsheet extends StatelessWidget {
  const CalculatorDetailsBottomsheet({
    super.key,
    required this.calculationEntity,
  });

  final CalculationEntity calculationEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppValues.kBigMargin.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppValues.kPageMargin.h,
          ),
          const Text(
            "Сумма кредита",
            style: AppStyles.titleS,
          ),
          Text(
            "${MoneyFormatter.getFormattedValue(calculationEntity.sumOfCredit.toDouble())} руб",
            style: AppStyles.body,
          ),
          SizedBox(
            height: AppValues.kPageMargin.h,
          ),
          const Text(
            "Долг + проценты",
            style: AppStyles.titleS,
          ),
          Text(
            "${MoneyFormatter.getFormattedValue(calculationEntity.totalPayment)} руб",
            style: AppStyles.body,
          ),
          SizedBox(
            height: AppValues.kPageMargin.h,
          ),
          const Text(
            "Начислено процентов",
            style: AppStyles.titleS,
          ),
          Text(
            "${calculationEntity.interesedPercentage.toInt()} %",
            style: AppStyles.body,
          ),
          SizedBox(
            height: AppValues.kPageMargin.h,
          ),
          const Text(
            "Ежемесячный платеж",
            style: AppStyles.titleS,
          ),
          if (calculationEntity.annuityResult != null) ...{
            Text(
              "${MoneyFormatter.getFormattedValue(calculationEntity.annuityResult!)} руб",
              style: AppStyles.body,
            ),
          },
          if (calculationEntity.annuityResult == null) ...{
            Text(
              "${MoneyFormatter.getFormattedValue(calculationEntity.details.first.totalPayment)}...${MoneyFormatter.getFormattedValue(calculationEntity.details.last.totalPayment)} руб",
              style: AppStyles.body,
            ),
          },
          SizedBox(
            height: AppValues.kPageMargin.h,
          ),
          const Text(
            "График платежей",
            style: AppStyles.titleS,
          ),
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: AppValues.kPageMargin.h,
                ),
                PaymentChart(data: calculationEntity.details,),
                for (var detail in calculationEntity.details) ...{
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Месяц ${detail.month}",
                        style: AppStyles.titleS,
                      ),
                      Text(
                        "Платеж: ${MoneyFormatter.getFormattedValue(detail.totalPayment)} ₽\n"
                        "Проценты: ${MoneyFormatter.getFormattedValue(detail.interestPayment)} ₽\n"
                        "Основной долг: ${MoneyFormatter.getFormattedValue(detail.principalPayment)} ₽\n"
                        "Остаток: ${MoneyFormatter.getFormattedValue(detail.remainingPrincipal)} ₽",
                        style: AppStyles.body,
                      ),
                      SizedBox(
                        height: AppValues.kPageMargin.h,
                      ),
                    ],
                  ),
                },
              ],
            ),
          ),
        ],
      ),
    );
  }
}
