// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalculationDetailsEntity {
  int get month => throw _privateConstructorUsedError;
  double get totalPayment => throw _privateConstructorUsedError;
  double get interestPayment => throw _privateConstructorUsedError;
  double get principalPayment => throw _privateConstructorUsedError;
  double get remainingPrincipal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalculationDetailsEntityCopyWith<CalculationDetailsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculationDetailsEntityCopyWith<$Res> {
  factory $CalculationDetailsEntityCopyWith(CalculationDetailsEntity value,
          $Res Function(CalculationDetailsEntity) then) =
      _$CalculationDetailsEntityCopyWithImpl<$Res, CalculationDetailsEntity>;
  @useResult
  $Res call(
      {int month,
      double totalPayment,
      double interestPayment,
      double principalPayment,
      double remainingPrincipal});
}

/// @nodoc
class _$CalculationDetailsEntityCopyWithImpl<$Res,
        $Val extends CalculationDetailsEntity>
    implements $CalculationDetailsEntityCopyWith<$Res> {
  _$CalculationDetailsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? totalPayment = null,
    Object? interestPayment = null,
    Object? principalPayment = null,
    Object? remainingPrincipal = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      totalPayment: null == totalPayment
          ? _value.totalPayment
          : totalPayment // ignore: cast_nullable_to_non_nullable
              as double,
      interestPayment: null == interestPayment
          ? _value.interestPayment
          : interestPayment // ignore: cast_nullable_to_non_nullable
              as double,
      principalPayment: null == principalPayment
          ? _value.principalPayment
          : principalPayment // ignore: cast_nullable_to_non_nullable
              as double,
      remainingPrincipal: null == remainingPrincipal
          ? _value.remainingPrincipal
          : remainingPrincipal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculationDetailsEntityImplCopyWith<$Res>
    implements $CalculationDetailsEntityCopyWith<$Res> {
  factory _$$CalculationDetailsEntityImplCopyWith(
          _$CalculationDetailsEntityImpl value,
          $Res Function(_$CalculationDetailsEntityImpl) then) =
      __$$CalculationDetailsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int month,
      double totalPayment,
      double interestPayment,
      double principalPayment,
      double remainingPrincipal});
}

/// @nodoc
class __$$CalculationDetailsEntityImplCopyWithImpl<$Res>
    extends _$CalculationDetailsEntityCopyWithImpl<$Res,
        _$CalculationDetailsEntityImpl>
    implements _$$CalculationDetailsEntityImplCopyWith<$Res> {
  __$$CalculationDetailsEntityImplCopyWithImpl(
      _$CalculationDetailsEntityImpl _value,
      $Res Function(_$CalculationDetailsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? totalPayment = null,
    Object? interestPayment = null,
    Object? principalPayment = null,
    Object? remainingPrincipal = null,
  }) {
    return _then(_$CalculationDetailsEntityImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      totalPayment: null == totalPayment
          ? _value.totalPayment
          : totalPayment // ignore: cast_nullable_to_non_nullable
              as double,
      interestPayment: null == interestPayment
          ? _value.interestPayment
          : interestPayment // ignore: cast_nullable_to_non_nullable
              as double,
      principalPayment: null == principalPayment
          ? _value.principalPayment
          : principalPayment // ignore: cast_nullable_to_non_nullable
              as double,
      remainingPrincipal: null == remainingPrincipal
          ? _value.remainingPrincipal
          : remainingPrincipal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CalculationDetailsEntityImpl implements _CalculationDetailsEntity {
  const _$CalculationDetailsEntityImpl(
      {required this.month,
      required this.totalPayment,
      required this.interestPayment,
      required this.principalPayment,
      required this.remainingPrincipal});

  @override
  final int month;
  @override
  final double totalPayment;
  @override
  final double interestPayment;
  @override
  final double principalPayment;
  @override
  final double remainingPrincipal;

  @override
  String toString() {
    return 'CalculationDetailsEntity(month: $month, totalPayment: $totalPayment, interestPayment: $interestPayment, principalPayment: $principalPayment, remainingPrincipal: $remainingPrincipal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculationDetailsEntityImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.totalPayment, totalPayment) ||
                other.totalPayment == totalPayment) &&
            (identical(other.interestPayment, interestPayment) ||
                other.interestPayment == interestPayment) &&
            (identical(other.principalPayment, principalPayment) ||
                other.principalPayment == principalPayment) &&
            (identical(other.remainingPrincipal, remainingPrincipal) ||
                other.remainingPrincipal == remainingPrincipal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, totalPayment,
      interestPayment, principalPayment, remainingPrincipal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculationDetailsEntityImplCopyWith<_$CalculationDetailsEntityImpl>
      get copyWith => __$$CalculationDetailsEntityImplCopyWithImpl<
          _$CalculationDetailsEntityImpl>(this, _$identity);
}

abstract class _CalculationDetailsEntity implements CalculationDetailsEntity {
  const factory _CalculationDetailsEntity(
          {required final int month,
          required final double totalPayment,
          required final double interestPayment,
          required final double principalPayment,
          required final double remainingPrincipal}) =
      _$CalculationDetailsEntityImpl;

  @override
  int get month;
  @override
  double get totalPayment;
  @override
  double get interestPayment;
  @override
  double get principalPayment;
  @override
  double get remainingPrincipal;
  @override
  @JsonKey(ignore: true)
  _$$CalculationDetailsEntityImplCopyWith<_$CalculationDetailsEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
