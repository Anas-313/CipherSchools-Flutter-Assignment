// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class incomeModelAdapter extends TypeAdapter<IncomeModel> {
  @override
  final int typeId = 0;

  @override
  IncomeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IncomeModel(
      desc: fields[0] as String,
      category: fields[1] as String,
      amount: fields[3] as double,
      wallet: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, IncomeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.desc)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.wallet)
      ..writeByte(3)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is incomeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
