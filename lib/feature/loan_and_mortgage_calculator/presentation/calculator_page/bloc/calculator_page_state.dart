part of 'calculator_page_bloc.dart';

@freezed
class CalculatorPageState with _$CalculatorPageState {
  const factory CalculatorPageState({
    required double minSum,
    required double maxSum,
    required double currentSumm,
    required int minPercent,
    required int maxPercent,
    required int currentPercent,
    required int minPeriod,
    required int maxPeriod,
    required int currentPeriod,
    required CalculateType calculateType,
    required bool moneyIsValid,
    required bool percentIsValid,
    required bool periodIsValid,
    String? error,
  }) = _CalculatorPageState;
}
