import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:loan_and_mortgage_calculator/core/util/formatted_text_editing_controller.dart';
import 'package:loan_and_mortgage_calculator/core/util/money_formatter.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculate_type.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculation_entity.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/usecase/calculator_usecase.dart';

part 'calculator_page_bloc.freezed.dart';

part 'calculator_page_event.dart';

part 'calculator_page_state.dart';

@singleton
class CalculatorPageBloc extends Bloc<CalculatorPageEvent, CalculatorPageState> {
  CalculatorPageBloc(this.usecase)
      : super(const CalculatorPageState(
          minSum: 500000,
          maxSum: 10000000,
          currentSumm: 500000,
          minPercent: 1,
          maxPercent: 100,
          currentPercent: 5,
          minPeriod: 1,
          maxPeriod: 120,
          currentPeriod: 1,
          calculateType: CalculateType.annuity,
          percentIsValid: false,
          moneyIsValid: false,
          periodIsValid: false,
        )) {
    on<_UpdateMoney>(_onUpdateMoney);
    on<_UpdateMoneySlider>(_onUpdateMoneySlider);
    on<_UpdatePercent>(_onUpdatePercent);
    on<_UpdatePercentSlider>(_onUpdatePercentSlider);
    on<_UpdatePeriod>(_onUpdatePeriod);
    on<_UpdatePeriodSlider>(_onUpdatePeriodSlider);
    on<_SwitchCalculationType>(_onSwitchCalculationType);
    on<_Calculate>(_onCalculate);
    on<_PercentNotValid>(_onPercentNotValid);
    on<_MoneyNotValid>(_onMoneyNotValid);
    on<_PeriodNotValid>(_onPeriodNotValid);
  }

  final CalculatorUsecase usecase;

  final moneyFormatter = MoneyFormatter();
  late FormattedTextEditingController totalCostController;
  late TextEditingController percentController;
  late TextEditingController periodController;

  void init() {
    totalCostController = FormattedTextEditingController(
      formatter: moneyFormatter,
    );

    percentController = TextEditingController();

    periodController = TextEditingController();
  }

  void dispose() {
    totalCostController.dispose();
    percentController.dispose();
    periodController.dispose();
  }

  FutureOr<void> _onUpdateMoney(
    _UpdateMoney event,
    Emitter<CalculatorPageState> emit,
  ) async {
    emit(state.copyWith(
      maxSum: 100000000,
      error: null,
      moneyIsValid: true,
    ));

    if (event.currentValue >= state.minSum) {
      if (event.currentValue >= state.maxSum) {
        emit(state.copyWith(currentSumm: event.currentValue, maxSum: event.currentValue));
      } else {
        emit(state.copyWith(currentSumm: event.currentValue));
      }
    }
  }

  FutureOr<void> _onUpdateMoneySlider(
    _UpdateMoneySlider event,
    Emitter<CalculatorPageState> emit,
  ) async {
    totalCostController.value = TextEditingValue(
      text: event.currentValue.toStringAsFixed(2),
      selection: TextSelection.collapsed(
        offset: event.currentValue.toStringAsFixed(2).length,
      ),
    );
    emit(state.copyWith(
      currentSumm: event.currentValue,
      moneyIsValid: true,
      error: null,
    ));
  }

  FutureOr<void> _onUpdatePercent(
    _UpdatePercent event,
    Emitter<CalculatorPageState> emit,
  ) async {
    emit(state.copyWith(
      maxPercent: 100,
      error: null,
    ));

    if (event.currentValue >= state.minPercent) {
      if (event.currentValue >= state.maxPercent) {
        emit(state.copyWith(
          currentPercent: event.currentValue,
          maxPercent: event.currentValue,
          percentIsValid: true,
        ));
      } else {
        emit(state.copyWith(
          currentPercent: event.currentValue,
          percentIsValid: true,
        ));
      }
    }
  }

  FutureOr<void> _onUpdatePercentSlider(
    _UpdatePercentSlider event,
    Emitter<CalculatorPageState> emit,
  ) async {
    percentController.value = TextEditingValue(
      text: event.currentValue.toString(),
    );
    emit(state.copyWith(
      currentPercent: event.currentValue,
      percentIsValid: true,
      error: null,
    ));
  }

  FutureOr<void> _onUpdatePeriod(
    _UpdatePeriod event,
    Emitter<CalculatorPageState> emit,
  ) async {
    emit(state.copyWith(
      maxPeriod: 120,
      periodIsValid: true,
      error: null,
    ));

    if (event.currentValue >= state.minPeriod) {
      if (event.currentValue >= state.maxPeriod) {
        emit(state.copyWith(
          currentPeriod: event.currentValue,
          maxPeriod: event.currentValue,
        ));
      } else {
        emit(state.copyWith(currentPeriod: event.currentValue));
      }
    }
  }

  FutureOr<void> _onUpdatePeriodSlider(
    _UpdatePeriodSlider event,
    Emitter<CalculatorPageState> emit,
  ) async {
    periodController.value = TextEditingValue(
      text: event.currentValue.toString(),
      selection: TextSelection.collapsed(
        offset: event.currentValue.toString().length,
      ),
    );
    emit(state.copyWith(
      currentPeriod: event.currentValue,
      periodIsValid: true,
      error: null,
    ));
  }

  FutureOr<void> _onSwitchCalculationType(
    _SwitchCalculationType event,
    Emitter<CalculatorPageState> emit,
  ) async {
    emit(state.copyWith(calculateType: event.type));
  }

  FutureOr<void> _onCalculate(
    _Calculate event,
    Emitter<CalculatorPageState> emit,
  ) async {
    if (state.calculateType == CalculateType.annuity) {
      final annuity = usecase.calculateAnnuity(
        state.currentSumm,
        state.currentPercent,
        state.currentPeriod,
      );
      event.onCalculate(annuity);
      await usecase.addCalculation(calculation: annuity);
    } else {
      final differentiated = usecase.calculateDifferentiated(
        state.currentSumm,
        state.currentPercent,
        state.currentPeriod,
      );
      event.onCalculate(differentiated);
      await usecase.addCalculation(calculation: differentiated);
    }
  }

  FutureOr<void> _onPercentNotValid(
    _PercentNotValid event,
    Emitter<CalculatorPageState> emit,
  ) {
    emit(state.copyWith(
      percentIsValid: false,
      error: "Введите проценты корректно",
    ));
  }

  FutureOr<void> _onMoneyNotValid(
    _MoneyNotValid event,
    Emitter<CalculatorPageState> emit,
  ) {
    emit(state.copyWith(
      moneyIsValid: false,
      error: "Введите сумму корректно",
    ));
  }

  FutureOr<void> _onPeriodNotValid(
    _PeriodNotValid event,
    Emitter<CalculatorPageState> emit,
  ) {
    emit(state.copyWith(
      periodIsValid: false,
      error: "Введите срок ипотеки корректно",
    ));
  }
}
