// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheckModel _$_$_CheckModelFromJson(Map<String, dynamic> json) {
  return _$_CheckModel(
    pasien: json['pasien'] == null
        ? null
        : Pasien.fromJson(json['pasien'] as Map<String, dynamic>),
    pembayaran: json['pembayaran'] as String?,
    tanggalPeriksa: json['tanggal_periksa'] as String?,
    dokter: json['dokter'] as String?,
  );
}

Map<String, dynamic> _$_$_CheckModelToJson(_$_CheckModel instance) =>
    <String, dynamic>{
      'pasien': instance.pasien,
      'pembayaran': instance.pembayaran,
      'tanggal_periksa': instance.tanggalPeriksa,
      'dokter': instance.dokter,
    };
