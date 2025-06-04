// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContainerItemAdapter extends TypeAdapter<ContainerItem> {
  @override
  final int typeId = 0;

  @override
  ContainerItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContainerItem(
      id: fields[0] as String,
      name: fields[1] as String,
      expirationDate: fields[2] as DateTime,
      scannedDate: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ContainerItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.expirationDate)
      ..writeByte(3)
      ..write(obj.scannedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContainerItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
