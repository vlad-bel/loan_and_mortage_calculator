import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculate_type.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculation_details_entity.dart';

part 'calculation_entity.freezed.dart';

@freezed
abstract class CalculationEntity with _$CalculationEntity {
  const factory CalculationEntity({
     double? annuityResult,
    required int sumOfCredit,
    required double totalPayment,
    required double interesedPercentage,
    required CalculateType calculateType,
    required List<CalculationDetailsEntity> details,
  }) = _CalculationEntity;
}
