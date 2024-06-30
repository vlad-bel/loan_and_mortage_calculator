part of 'calculator_page_bloc.dart';

@freezed
class CalculatorPageEvent with _$CalculatorPageEvent {
  const factory CalculatorPageEvent.updateMoney({required double currentValue}) = _UpdateMoney;

  const factory CalculatorPageEvent.updateMoneySlider({required double currentValue}) = _UpdateMoneySlider;

  const factory CalculatorPageEvent.moneyNotValid() = _MoneyNotValid;

  const factory CalculatorPageEvent.updatePercent({required int currentValue}) = _UpdatePercent;

  const factory CalculatorPageEvent.percentNotValid() = _PercentNotValid;

  const factory CalculatorPageEvent.updatePercentSlider({required int currentValue}) = _UpdatePercentSlider;

  const factory CalculatorPageEvent.updatePeriod({required int currentValue}) = _UpdatePeriod;

  const factory CalculatorPageEvent.updatePeriodSlider({required int currentValue}) = _UpdatePeriodSlider;

  const factory CalculatorPageEvent.periodNotValid() = _PeriodNotValid;

  const factory CalculatorPageEvent.switchCalculationType({required CalculateType type}) = _SwitchCalculationType;

  const factory CalculatorPageEvent.calculate({required Function(CalculationEntity) onCalculate}) = _Calculate;
}
