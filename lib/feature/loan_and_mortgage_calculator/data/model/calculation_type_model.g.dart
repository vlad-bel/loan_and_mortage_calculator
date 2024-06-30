// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_type_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalculateTypeModelAdapter extends TypeAdapter<CalculateTypeModel> {
  @override
  final int typeId = 2;

  @override
  CalculateTypeModel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CalculateTypeModel.annuity;
      case 1:
        return CalculateTypeModel.differentiated;
      default:
        return CalculateTypeModel.annuity;
    }
  }

  @override
  void write(BinaryWriter writer, CalculateTypeModel obj) {
    switch (obj) {
      case CalculateTypeModel.annuity:
        writer.writeByte(0);
        break;
      case CalculateTypeModel.differentiated:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculateTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
