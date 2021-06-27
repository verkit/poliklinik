import 'package:freezed_annotation/freezed_annotation.dart';

part 'pasien.freezed.dart';
part 'pasien.g.dart';

@freezed
class Pasien with _$Pasien {
  factory Pasien({
    @JsonKey(name: 'nama') String? nama,
    @JsonKey(name: 'tempat_lahir') String? tempatLahir,
    @JsonKey(name: 'tanggal_lahir') String? tanggalLahir,
    @JsonKey(name: 'umur') String? umur,
    @JsonKey(name: 'jenis') String? jenis,
    @JsonKey(name: 'kelamin') String? kelamin,
    @JsonKey(name: 'agama') String? agama,
    @JsonKey(name: 'alamat') String? alamat,
    @JsonKey(name: 'kelurahan') String? kelurahan,
    @JsonKey(name: 'kecamatan') String? kecamatan,
    @JsonKey(name: 'kabupaten') String? kabupaten,
    @JsonKey(name: 'provinsi') String? provinsi,
    @JsonKey(name: 'no_telp') String? noTelp,
    @JsonKey(name: 'nik') String? nik,
  }) = _Pasien;

  factory Pasien.fromJson(Map<String, dynamic> json) => _$PasienFromJson(json);
}
