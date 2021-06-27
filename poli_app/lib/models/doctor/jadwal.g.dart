// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jadwal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Jadwal _$_$_JadwalFromJson(Map<String, dynamic> json) {
  return _$_Jadwal(
    hari: json['hari'] as String?,
    pukul: json['pukul'] == null
        ? null
        : Pukul.fromJson(json['pukul'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_JadwalToJson(_$_Jadwal instance) => <String, dynamic>{
      'hari': instance.hari,
      'pukul': instance.pukul,
    };
