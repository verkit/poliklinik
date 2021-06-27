import 'package:freezed_annotation/freezed_annotation.dart';

import 'pukul.dart';

part 'jadwal.freezed.dart';
part 'jadwal.g.dart';

@freezed
class Jadwal with _$Jadwal {
  factory Jadwal({
    @JsonKey(name: 'hari') String? hari,
    @JsonKey(name: 'pukul') Pukul? pukul,
  }) = _Jadwal;

  factory Jadwal.fromJson(Map<String, dynamic> json) => _$JadwalFromJson(json);
}
