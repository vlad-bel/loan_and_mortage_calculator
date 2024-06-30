// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalculationModelAdapter extends TypeAdapter<CalculationModel> {
  @override
  final int typeId = 0;

  @override
  CalculationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalculationModel(
      annuityResult: fields[0] as double?,
      sumOfCredit: fields[1] as int,
      totalPayment: fields[2] as double,
      interesedPercentage: fields[3] as double,
      calculateType: fields[4] as CalculateTypeModel,
      details: (fields[5] as List).cast<CalculationDetailsModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CalculationModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.annuityResult)
      ..writeByte(1)
      ..write(obj.sumOfCredit)
      ..writeByte(2)
      ..write(obj.totalPayment)
      ..writeByte(3)
      ..write(obj.interesedPercentage)
      ..writeByte(4)
      ..write(obj.calculateType)
      ..writeByte(5)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
