// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Update value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Update value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryPageEventCopyWith<$Res> {
  factory $HistoryPageEventCopyWith(
          HistoryPageEvent value, $Res Function(HistoryPageEvent) then) =
      _$HistoryPageEventCopyWithImpl<$Res, HistoryPageEvent>;
}

/// @nodoc
class _$HistoryPageEventCopyWithImpl<$Res, $Val extends HistoryPageEvent>
    implements $HistoryPageEventCopyWith<$Res> {
  _$HistoryPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$HistoryPageEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl();

  @override
  String toString() {
    return 'HistoryPageEvent.update()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() update,
  }) {
    return update();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? update,
  }) {
    return update?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Update value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Update value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements HistoryPageEvent {
  const factory _Update() = _$UpdateImpl;
}

/// @nodoc
mixin _$HistoryPageState {
  List<CalculationEntity> get calculationList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryPageStateCopyWith<HistoryPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryPageStateCopyWith<$Res> {
  factory $HistoryPageStateCopyWith(
          HistoryPageState value, $Res Function(HistoryPageState) then) =
      _$HistoryPageStateCopyWithImpl<$Res, HistoryPageState>;
  @useResult
  $Res call({List<CalculationEntity> calculationList});
}

/// @nodoc
class _$HistoryPageStateCopyWithImpl<$Res, $Val extends HistoryPageState>
    implements $HistoryPageStateCopyWith<$Res> {
  _$HistoryPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculationList = null,
  }) {
    return _then(_value.copyWith(
      calculationList: null == calculationList
          ? _value.calculationList
          : calculationList // ignore: cast_nullable_to_non_nullable
              as List<CalculationEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryPageStateImplCopyWith<$Res>
    implements $HistoryPageStateCopyWith<$Res> {
  factory _$$HistoryPageStateImplCopyWith(_$HistoryPageStateImpl value,
          $Res Function(_$HistoryPageStateImpl) then) =
      __$$HistoryPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CalculationEntity> calculationList});
}

/// @nodoc
class __$$HistoryPageStateImplCopyWithImpl<$Res>
    extends _$HistoryPageStateCopyWithImpl<$Res, _$HistoryPageStateImpl>
    implements _$$HistoryPageStateImplCopyWith<$Res> {
  __$$HistoryPageStateImplCopyWithImpl(_$HistoryPageStateImpl _value,
      $Res Function(_$HistoryPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculationList = null,
  }) {
    return _then(_$HistoryPageStateImpl(
      calculationList: null == calculationList
          ? _value._calculationList
          : calculationList // ignore: cast_nullable_to_non_nullable
              as List<CalculationEntity>,
    ));
  }
}

/// @nodoc

class _$HistoryPageStateImpl implements _HistoryPageState {
  const _$HistoryPageStateImpl(
      {required final List<CalculationEntity> calculationList})
      : _calculationList = calculationList;

  final List<CalculationEntity> _calculationList;
  @override
  List<CalculationEntity> get calculationList {
    if (_calculationList is EqualUnmodifiableListView) return _calculationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calculationList);
  }

  @override
  String toString() {
    return 'HistoryPageState(calculationList: $calculationList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryPageStateImpl &&
            const DeepCollectionEquality()
                .equals(other._calculationList, _calculationList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_calculationList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryPageStateImplCopyWith<_$HistoryPageStateImpl> get copyWith =>
      __$$HistoryPageStateImplCopyWithImpl<_$HistoryPageStateImpl>(
          this, _$identity);
}

abstract class _HistoryPageState implements HistoryPageState {
  const factory _HistoryPageState(
          {required final List<CalculationEntity> calculationList}) =
      _$HistoryPageStateImpl;

  @override
  List<CalculationEntity> get calculationList;
  @override
  @JsonKey(ignore: true)
  _$$HistoryPageStateImplCopyWith<_$HistoryPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
