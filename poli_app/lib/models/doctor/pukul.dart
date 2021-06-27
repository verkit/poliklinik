import 'package:freezed_annotation/freezed_annotation.dart';

part 'pukul.freezed.dart';
part 'pukul.g.dart';

@freezed
class Pukul with _$Pukul {
  factory Pukul({
    @JsonKey(name: 'buka') String? buka,
    @JsonKey(name: 'tutup') String? tutup,
  }) = _Pukul;

  factory Pukul.fromJson(Map<String, dynamic> json) => _$PukulFromJson(json);
}
