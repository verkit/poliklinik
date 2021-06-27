import 'package:freezed_annotation/freezed_annotation.dart';

import 'jadwal.dart';

part 'doctor_model.freezed.dart';
part 'doctor_model.g.dart';

@freezed
class DoctorModel with _$DoctorModel {
  factory DoctorModel({
    @JsonKey(name: 'nama') String? nama,
    @JsonKey(name: 'dokter') String? dokter,
    @JsonKey(name: 'jenis_kelamin') String? jenisKelamin,
    @JsonKey(name: 'jadwal') List<Jadwal>? jadwal,
  }) = _DoctorModel;

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);
}
