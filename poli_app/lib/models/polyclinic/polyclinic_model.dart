import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'polyclinic_model.g.dart';

@JsonSerializable()
class PolyclinicModel extends Equatable {
  @JsonKey(name: 'nama')
  final String? nama;
  @JsonKey(name: 'gambar')
  final String? gambar;

  const PolyclinicModel({this.nama, this.gambar});

  factory PolyclinicModel.fromJson(Map<String, dynamic> json) {
    return _$PolyclinicModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PolyclinicModelToJson(this);

  @override
  List<Object?> get props => [nama, gambar];
}
