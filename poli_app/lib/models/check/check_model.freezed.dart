// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'check_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckModel _$CheckModelFromJson(Map<String, dynamic> json) {
  return _CheckModel.fromJson(json);
}

/// @nodoc
class _$CheckModelTearOff {
  const _$CheckModelTearOff();

  _CheckModel call(
      {@JsonKey(name: 'pasien') Pasien? pasien,
      @JsonKey(name: 'pembayaran') String? pembayaran,
      @JsonKey(name: 'tanggal_periksa') String? tanggalPeriksa,
      @JsonKey(name: 'dokter') String? dokter}) {
    return _CheckModel(
      pasien: pasien,
      pembayaran: pembayaran,
      tanggalPeriksa: tanggalPeriksa,
      dokter: dokter,
    );
  }

  CheckModel fromJson(Map<String, Object> json) {
    return CheckModel.fromJson(json);
  }
}

/// @nodoc
const $CheckModel = _$CheckModelTearOff();

/// @nodoc
mixin _$CheckModel {
  @JsonKey(name: 'pasien')
  Pasien? get pasien => throw _privateConstructorUsedError;
  @JsonKey(name: 'pembayaran')
  String? get pembayaran => throw _privateConstructorUsedError;
  @JsonKey(name: 'tanggal_periksa')
  String? get tanggalPeriksa => throw _privateConstructorUsedError;
  @JsonKey(name: 'dokter')
  String? get dokter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckModelCopyWith<CheckModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckModelCopyWith<$Res> {
  factory $CheckModelCopyWith(
          CheckModel value, $Res Function(CheckModel) then) =
      _$CheckModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'pasien') Pasien? pasien,
      @JsonKey(name: 'pembayaran') String? pembayaran,
      @JsonKey(name: 'tanggal_periksa') String? tanggalPeriksa,
      @JsonKey(name: 'dokter') String? dokter});

  $PasienCopyWith<$Res>? get pasien;
}

/// @nodoc
class _$CheckModelCopyWithImpl<$Res> implements $CheckModelCopyWith<$Res> {
  _$CheckModelCopyWithImpl(this._value, this._then);

  final CheckModel _value;
  // ignore: unused_field
  final $Res Function(CheckModel) _then;

  @override
  $Res call({
    Object? pasien = freezed,
    Object? pembayaran = freezed,
    Object? tanggalPeriksa = freezed,
    Object? dokter = freezed,
  }) {
    return _then(_value.copyWith(
      pasien: pasien == freezed
          ? _value.pasien
          : pasien // ignore: cast_nullable_to_non_nullable
              as Pasien?,
      pembayaran: pembayaran == freezed
          ? _value.pembayaran
          : pembayaran // ignore: cast_nullable_to_non_nullable
              as String?,
      tanggalPeriksa: tanggalPeriksa == freezed
          ? _value.tanggalPeriksa
          : tanggalPeriksa // ignore: cast_nullable_to_non_nullable
              as String?,
      dokter: dokter == freezed
          ? _value.dokter
          : dokter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $PasienCopyWith<$Res>? get pasien {
    if (_value.pasien == null) {
      return null;
    }

    return $PasienCopyWith<$Res>(_value.pasien!, (value) {
      return _then(_value.copyWith(pasien: value));
    });
  }
}

/// @nodoc
abstract class _$CheckModelCopyWith<$Res> implements $CheckModelCopyWith<$Res> {
  factory _$CheckModelCopyWith(
          _CheckModel value, $Res Function(_CheckModel) then) =
      __$CheckModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'pasien') Pasien? pasien,
      @JsonKey(name: 'pembayaran') String? pembayaran,
      @JsonKey(name: 'tanggal_periksa') String? tanggalPeriksa,
      @JsonKey(name: 'dokter') String? dokter});

  @override
  $PasienCopyWith<$Res>? get pasien;
}

/// @nodoc
class __$CheckModelCopyWithImpl<$Res> extends _$CheckModelCopyWithImpl<$Res>
    implements _$CheckModelCopyWith<$Res> {
  __$CheckModelCopyWithImpl(
      _CheckModel _value, $Res Function(_CheckModel) _then)
      : super(_value, (v) => _then(v as _CheckModel));

  @override
  _CheckModel get _value => super._value as _CheckModel;

  @override
  $Res call({
    Object? pasien = freezed,
    Object? pembayaran = freezed,
    Object? tanggalPeriksa = freezed,
    Object? dokter = freezed,
  }) {
    return _then(_CheckModel(
      pasien: pasien == freezed
          ? _value.pasien
          : pasien // ignore: cast_nullable_to_non_nullable
              as Pasien?,
      pembayaran: pembayaran == freezed
          ? _value.pembayaran
          : pembayaran // ignore: cast_nullable_to_non_nullable
              as String?,
      tanggalPeriksa: tanggalPeriksa == freezed
          ? _value.tanggalPeriksa
          : tanggalPeriksa // ignore: cast_nullable_to_non_nullable
              as String?,
      dokter: dokter == freezed
          ? _value.dokter
          : dokter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckModel implements _CheckModel {
  _$_CheckModel(
      {@JsonKey(name: 'pasien') this.pasien,
      @JsonKey(name: 'pembayaran') this.pembayaran,
      @JsonKey(name: 'tanggal_periksa') this.tanggalPeriksa,
      @JsonKey(name: 'dokter') this.dokter});

  factory _$_CheckModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CheckModelFromJson(json);

  @override
  @JsonKey(name: 'pasien')
  final Pasien? pasien;
  @override
  @JsonKey(name: 'pembayaran')
  final String? pembayaran;
  @override
  @JsonKey(name: 'tanggal_periksa')
  final String? tanggalPeriksa;
  @override
  @JsonKey(name: 'dokter')
  final String? dokter;

  @override
  String toString() {
    return 'CheckModel(pasien: $pasien, pembayaran: $pembayaran, tanggalPeriksa: $tanggalPeriksa, dokter: $dokter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CheckModel &&
            (identical(other.pasien, pasien) ||
                const DeepCollectionEquality().equals(other.pasien, pasien)) &&
            (identical(other.pembayaran, pembayaran) ||
                const DeepCollectionEquality()
                    .equals(other.pembayaran, pembayaran)) &&
            (identical(other.tanggalPeriksa, tanggalPeriksa) ||
                const DeepCollectionEquality()
                    .equals(other.tanggalPeriksa, tanggalPeriksa)) &&
            (identical(other.dokter, dokter) ||
                const DeepCollectionEquality().equals(other.dokter, dokter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pasien) ^
      const DeepCollectionEquality().hash(pembayaran) ^
      const DeepCollectionEquality().hash(tanggalPeriksa) ^
      const DeepCollectionEquality().hash(dokter);

  @JsonKey(ignore: true)
  @override
  _$CheckModelCopyWith<_CheckModel> get copyWith =>
      __$CheckModelCopyWithImpl<_CheckModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CheckModelToJson(this);
  }
}

abstract class _CheckModel implements CheckModel {
  factory _CheckModel(
      {@JsonKey(name: 'pasien') Pasien? pasien,
      @JsonKey(name: 'pembayaran') String? pembayaran,
      @JsonKey(name: 'tanggal_periksa') String? tanggalPeriksa,
      @JsonKey(name: 'dokter') String? dokter}) = _$_CheckModel;

  factory _CheckModel.fromJson(Map<String, dynamic> json) =
      _$_CheckModel.fromJson;

  @override
  @JsonKey(name: 'pasien')
  Pasien? get pasien => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'pembayaran')
  String? get pembayaran => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'tanggal_periksa')
  String? get tanggalPeriksa => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dokter')
  String? get dokter => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CheckModelCopyWith<_CheckModel> get copyWith =>
      throw _privateConstructorUsedError;
}
