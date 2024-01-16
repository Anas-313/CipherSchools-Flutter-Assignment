// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BalanceModelAdapter extends TypeAdapter<BalanceModel> {
  @override
  final int typeId = 1;

  @override
  BalanceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BalanceModel(
      total: fields[0] as double,
      income: fields[1] as double,
      expense: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BalanceModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.income)
      ..writeByte(2)
      ..write(obj.expense);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BalanceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
