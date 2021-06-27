import 'package:freezed_annotation/freezed_annotation.dart';

part 'polyclinic_model.freezed.dart';
part 'polyclinic_model.g.dart';

@freezed
class PolyclinicModel with _$PolyclinicModel {
  factory PolyclinicModel({
    @JsonKey(name: 'nama') String? nama,
    @JsonKey(name: 'gambar') String? gambar,
  }) = _PolyclinicModel;

  factory PolyclinicModel.fromJson(Map<String, dynamic> json) =>
      _$PolyclinicModelFromJson(json);
}
