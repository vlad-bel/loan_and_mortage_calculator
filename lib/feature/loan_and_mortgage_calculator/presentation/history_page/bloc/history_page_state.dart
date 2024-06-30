part of 'history_page_bloc.dart';

@freezed
class HistoryPageState with _$HistoryPageState {
  const factory HistoryPageState({
    required List<CalculationEntity> calculationList,
  }) = _HistoryPageState;
}
