// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalculationEntity {
  double? get annuityResult => throw _privateConstructorUsedError;
  int get sumOfCredit => throw _privateConstructorUsedError;
  double get totalPayment => throw _privateConstructorUsedError;
  double get interesedPercentage => throw _privateConstructorUsedError;
  CalculateType get calculateType => throw _privateConstructorUsedError;
  List<CalculationDetailsEntity> get details =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalculationEntityCopyWith<CalculationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculationEntityCopyWith<$Res> {
  factory $CalculationEntityCopyWith(
          CalculationEntity value, $Res Function(CalculationEntity) then) =
      _$CalculationEntityCopyWithImpl<$Res, CalculationEntity>;
  @useResult
  $Res call(
      {double? annuityResult,
      int sumOfCredit,
      double totalPayment,
      double interesedPercentage,
      CalculateType calculateType,
      List<CalculationDetailsEntity> details});
}

/// @nodoc
class _$CalculationEntityCopyWithImpl<$Res, $Val extends CalculationEntity>
    implements $CalculationEntityCopyWith<$Res> {
  _$CalculationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? annuityResult = freezed,
    Object? sumOfCredit = null,
    Object? totalPayment = null,
    Object? interesedPercentage = null,
    Object? calculateType = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      annuityResult: freezed == annuityResult
          ? _value.annuityResult
          : annuityResult // ignore: cast_nullable_to_non_nullable
              as double?,
      sumOfCredit: null == sumOfCredit
          ? _value.sumOfCredit
          : sumOfCredit // ignore: cast_nullable_to_non_nullable
              as int,
      totalPayment: null == totalPayment
          ? _value.totalPayment
          : totalPayment // ignore: cast_nullable_to_non_nullable
              as double,
      interesedPercentage: null == interesedPercentage
          ? _value.interesedPercentage
          : interesedPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      calculateType: null == calculateType
          ? _value.calculateType
          : calculateType // ignore: cast_nullable_to_non_nullable
              as CalculateType,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<CalculationDetailsEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculationEntityImplCopyWith<$Res>
    implements $CalculationEntityCopyWith<$Res> {
  factory _$$CalculationEntityImplCopyWith(_$CalculationEntityImpl value,
          $Res Function(_$CalculationEntityImpl) then) =
      __$$CalculationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? annuityResult,
      int sumOfCredit,
      double totalPayment,
      double interesedPercentage,
      CalculateType calculateType,
      List<CalculationDetailsEntity> details});
}

/// @nodoc
class __$$CalculationEntityImplCopyWithImpl<$Res>
    extends _$CalculationEntityCopyWithImpl<$Res, _$CalculationEntityImpl>
    implements _$$CalculationEntityImplCopyWith<$Res> {
  __$$CalculationEntityImplCopyWithImpl(_$CalculationEntityImpl _value,
      $Res Function(_$CalculationEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? annuityResult = freezed,
    Object? sumOfCredit = null,
    Object? totalPayment = null,
    Object? interesedPercentage = null,
    Object? calculateType = null,
    Object? details = null,
  }) {
    return _then(_$CalculationEntityImpl(
      annuityResult: freezed == annuityResult
          ? _value.annuityResult
          : annuityResult // ignore: cast_nullable_to_non_nullable
              as double?,
      sumOfCredit: null == sumOfCredit
          ? _value.sumOfCredit
          : sumOfCredit // ignore: cast_nullable_to_non_nullable
              as int,
      totalPayment: null == totalPayment
          ? _value.totalPayment
          : totalPayment // ignore: cast_nullable_to_non_nullable
              as double,
      interesedPercentage: null == interesedPercentage
          ? _value.interesedPercentage
          : interesedPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      calculateType: null == calculateType
          ? _value.calculateType
          : calculateType // ignore: cast_nullable_to_non_nullable
              as CalculateType,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<CalculationDetailsEntity>,
    ));
  }
}

/// @nodoc

class _$CalculationEntityImpl implements _CalculationEntity {
  const _$CalculationEntityImpl(
      {this.annuityResult,
      required this.sumOfCredit,
      required this.totalPayment,
      required this.interesedPercentage,
      required this.calculateType,
      required final List<CalculationDetailsEntity> details})
      : _details = details;

  @override
  final double? annuityResult;
  @override
  final int sumOfCredit;
  @override
  final double totalPayment;
  @override
  final double interesedPercentage;
  @override
  final CalculateType calculateType;
  final List<CalculationDetailsEntity> _details;
  @override
  List<CalculationDetailsEntity> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'CalculationEntity(annuityResult: $annuityResult, sumOfCredit: $sumOfCredit, totalPayment: $totalPayment, interesedPercentage: $interesedPercentage, calculateType: $calculateType, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculationEntityImpl &&
            (identical(other.annuityResult, annuityResult) ||
                other.annuityResult == annuityResult) &&
            (identical(other.sumOfCredit, sumOfCredit) ||
                other.sumOfCredit == sumOfCredit) &&
            (identical(other.totalPayment, totalPayment) ||
                other.totalPayment == totalPayment) &&
            (identical(other.interesedPercentage, interesedPercentage) ||
                other.interesedPercentage == interesedPercentage) &&
            (identical(other.calculateType, calculateType) ||
                other.calculateType == calculateType) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      annuityResult,
      sumOfCredit,
      totalPayment,
      interesedPercentage,
      calculateType,
      const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculationEntityImplCopyWith<_$CalculationEntityImpl> get copyWith =>
      __$$CalculationEntityImplCopyWithImpl<_$CalculationEntityImpl>(
          this, _$identity);
}

abstract class _CalculationEntity implements CalculationEntity {
  const factory _CalculationEntity(
          {final double? annuityResult,
          required final int sumOfCredit,
          required final double totalPayment,
          required final double interesedPercentage,
          required final CalculateType calculateType,
          required final List<CalculationDetailsEntity> details}) =
      _$CalculationEntityImpl;

  @override
  double? get annuityResult;
  @override
  int get sumOfCredit;
  @override
  double get totalPayment;
  @override
  double get interesedPercentage;
  @override
  CalculateType get calculateType;
  @override
  List<CalculationDetailsEntity> get details;
  @override
  @JsonKey(ignore: true)
  _$$CalculationEntityImplCopyWith<_$CalculationEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
