import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/entity/calculation_entity.dart';
import 'package:loan_and_mortgage_calculator/feature/loan_and_mortgage_calculator/domain/usecase/calculator_usecase.dart';

part 'history_page_bloc.freezed.dart';

part 'history_page_event.dart';

part 'history_page_state.dart';

@singleton
class HistoryPageBloc extends Bloc<HistoryPageEvent, HistoryPageState> {
  HistoryPageBloc(this.usecase) : super(const HistoryPageState(calculationList: [])) {
    on<_Update>(_onUpdate);
  }

  final CalculatorUsecase usecase;

  FutureOr<void> _onUpdate(
    _Update event,
    Emitter<HistoryPageState> emit,
  ) async {
    final response = await usecase.getCalculations();

    response.fold(
      (l) {},
      (r) {
        emit(state.copyWith(calculationList: r));
      },
    );
  }
}
