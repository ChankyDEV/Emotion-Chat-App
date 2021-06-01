// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDTOAdapter extends TypeAdapter<UserDTO> {
  @override
  final int typeId = 0;

  @override
  UserDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDTO(
      uid: fields[0] as String,
      emailAddress: fields[2] as String,
      phoneNumber: fields[1] as String,
      profileImageUrl: fields[4] as String,
      name: fields[3] as String,
      gender: fields[5] as String,
      hasOwnImage: fields[6] as bool,
      contactUids: (fields[7] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserDTO obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.emailAddress)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.profileImageUrl)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.hasOwnImage)
      ..writeByte(7)
      ..write(obj.contactUids);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
