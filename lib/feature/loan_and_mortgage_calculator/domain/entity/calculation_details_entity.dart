

import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculation_details_entity.freezed.dart';

@freezed
abstract class CalculationDetailsEntity with _$CalculationDetailsEntity {
  const factory CalculationDetailsEntity({
    required int month,
    required double totalPayment,
    required double interestPayment,
    required double principalPayment,
    required double remainingPrincipal,
}) = _CalculationDetailsEntity;
}