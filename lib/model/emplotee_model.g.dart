// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emplotee_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeModelAdapter extends TypeAdapter<EmployeeModel> {
  @override
  final int typeId = 1;

  @override
  EmployeeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeModel(
      name: fields[0] as String?,
      date: fields[1] as DateTime,
      status: fields[2] as Status?,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StatusAdapter extends TypeAdapter<Status> {
  @override
  final int typeId = 2;

  @override
  Status read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Status.active;
      case 1:
        return Status.inactive;
      default:
        return Status.active;
    }
  }

  @override
  void write(BinaryWriter writer, Status obj) {
    switch (obj) {
      case Status.active:
        writer.writeByte(0);
        break;
      case Status.inactive:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
