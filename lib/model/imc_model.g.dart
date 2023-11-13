// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImcModelAdapter extends TypeAdapter<ImcModel> {
  @override
  final int typeId = 0;

  @override
  ImcModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImcModel()
      ..descricao = fields[0] as String
      ..data = fields[1] as DateTime?
      ..peso = fields[2] as double
      ..altura = fields[3] as double
      ..imc = fields[4] as double
      ..classificacaoIMC = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, ImcModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.descricao)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.peso)
      ..writeByte(3)
      ..write(obj.altura)
      ..writeByte(4)
      ..write(obj.imc)
      ..writeByte(5)
      ..write(obj.classificacaoIMC);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImcModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
