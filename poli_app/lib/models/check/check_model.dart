import 'package:freezed_annotation/freezed_annotation.dart';

import 'pasien.dart';

part 'check_model.freezed.dart';
part 'check_model.g.dart';

@freezed
class CheckModel with _$CheckModel {
  factory CheckModel({
    @JsonKey(name: 'pasien') Pasien? pasien,
    @JsonKey(name: 'pembayaran') String? pembayaran,
    @JsonKey(name: 'tanggal_periksa') String? tanggalPeriksa,
    @JsonKey(name: 'dokter') String? dokter,
  }) = _CheckModel;

  factory CheckModel.fromJson(Map<String, dynamic> json) =>
      _$CheckModelFromJson(json);
}
