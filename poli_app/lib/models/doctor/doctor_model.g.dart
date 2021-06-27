// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DoctorModel _$_$_DoctorModelFromJson(Map<String, dynamic> json) {
  return _$_DoctorModel(
    nama: json['nama'] as String?,
    dokter: json['dokter'] as String?,
    jenisKelamin: json['jenis_kelamin'] as String?,
    jadwal: (json['jadwal'] as List<dynamic>?)
        ?.map((e) => Jadwal.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_DoctorModelToJson(_$_DoctorModel instance) =>
    <String, dynamic>{
      'nama': instance.nama,
      'dokter': instance.dokter,
      'jenis_kelamin': instance.jenisKelamin,
      'jadwal': instance.jadwal,
    };
