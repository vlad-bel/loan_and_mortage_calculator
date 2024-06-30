import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculate_type.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculation_details_entity.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculation_entity.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/repository/calculator_repository.dart';

@singleton
class CalculatorUsecase {
  final CalculatorRepository repository;

  CalculatorUsecase({required this.repository});

  CalculationEntity calculateAnnuity(
    double sum,
    int percent,
    int period,
  ) {
    final principal = sum;
    final annualRate = percent / 100;
    final monthlyRate = annualRate / 12;
    final months = period;

    final annuityCoefficient = (monthlyRate * pow(1 + monthlyRate, months)) / (pow(1 + monthlyRate, months) - 1);
    final annuityPayment = principal * annuityCoefficient;

    double remainingPrincipal = principal;
    double totalInterest = 0.0;
    List<CalculationDetailsEntity> details = [];

    for (int i = 0; i < months; i++) {
      double interestPayment = remainingPrincipal * monthlyRate;
      double principalPayment = annuityPayment - interestPayment;
      remainingPrincipal -= principalPayment;

      totalInterest += interestPayment;

      details.add(CalculationDetailsEntity(
        month: i + 1,
        totalPayment: annuityPayment,
        interestPayment: interestPayment,
        principalPayment: principalPayment,
        remainingPrincipal: remainingPrincipal,
      ));
    }

    return CalculationEntity(
      annuityResult: annuityPayment,
      sumOfCredit: sum.toInt(),
      totalPayment: annuityPayment * months,
      interesedPercentage: (totalInterest / (principal + totalInterest)) * 100,
      details: details,
      calculateType: CalculateType.annuity,
    );
  }

  CalculationEntity calculateDifferentiated(double sum, int percent, int period) {
    final principal = sum;
    final annualRate = percent / 100;
    final monthlyRate = annualRate / 12;
    final months = period;

    List<CalculationDetailsEntity> details = [];
    double remainingPrincipal = principal;
    double totalInterest = 0.0;
    double totalPayment = 0.0;

    for (int i = 0; i < months; i++) {
      double principalPayment = principal / months;
      double interestPayment = remainingPrincipal * monthlyRate;
      double totalMonthlyPayment = principalPayment + interestPayment;
      remainingPrincipal -= principalPayment;

      totalInterest += interestPayment;
      totalPayment += totalMonthlyPayment;

      details.add(CalculationDetailsEntity(
        month: i + 1,
        totalPayment: totalMonthlyPayment,
        interestPayment: interestPayment,
        principalPayment: principalPayment,
        remainingPrincipal: remainingPrincipal,
      ));
    }

    return CalculationEntity(
      sumOfCredit: sum.toInt(),
      totalPayment: totalPayment,
      interesedPercentage: (totalInterest / (principal + totalInterest)) * 100,
      details: details,
      annuityResult: null,
      calculateType: CalculateType.differentiated,
    );
  }

  Future<Either<String, List<CalculationEntity>>> getCalculations() {
    return repository.getCalculations();
  }

  Future<Either<String, void>> addCalculation({required CalculationEntity calculation}) {
    return repository.addCalculation(calculation: calculation);
  }
}
