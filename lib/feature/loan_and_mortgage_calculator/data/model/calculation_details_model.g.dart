// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalculationDetailsModelAdapter
    extends TypeAdapter<CalculationDetailsModel> {
  @override
  final int typeId = 1;

  @override
  CalculationDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalculationDetailsModel(
      month: fields[0] as int,
      totalPayment: fields[1] as double,
      interestPayment: fields[2] as double,
      principalPayment: fields[3] as double,
      remainingPrincipal: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CalculationDetailsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.month)
      ..writeByte(1)
      ..write(obj.totalPayment)
      ..writeByte(2)
      ..write(obj.interestPayment)
      ..writeByte(3)
      ..write(obj.principalPayment)
      ..writeByte(4)
      ..write(obj.remainingPrincipal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculationDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
