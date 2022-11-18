// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sitioslocal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SitioLocalAdapter extends TypeAdapter<SitioLocal> {
  @override
  final int typeId = 0;

  @override
  SitioLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SitioLocal()
      ..id = fields[0] as String?
      ..nombre = fields[1] as String?
      ..departamento = fields[2] as String?
      ..descripcion = fields[3] as String?
      ..clima = fields[4] as String?
      ..linkimage = fields[5] as String?
      ..region = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, SitioLocal obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.departamento)
      ..writeByte(3)
      ..write(obj.descripcion)
      ..writeByte(4)
      ..write(obj.clima)
      ..writeByte(5)
      ..write(obj.linkimage)
      ..writeByte(6)
      ..write(obj.region);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SitioLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
