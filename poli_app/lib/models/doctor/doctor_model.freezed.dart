// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'doctor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) {
  return _DoctorModel.fromJson(json);
}

/// @nodoc
class _$DoctorModelTearOff {
  const _$DoctorModelTearOff();

  _DoctorModel call(
      {@JsonKey(name: 'nama') String? nama,
      @JsonKey(name: 'dokter') String? dokter,
      @JsonKey(name: 'jenis_kelamin') String? jenisKelamin,
      @JsonKey(name: 'jadwal') List<Jadwal>? jadwal}) {
    return _DoctorModel(
      nama: nama,
      dokter: dokter,
      jenisKelamin: jenisKelamin,
      jadwal: jadwal,
    );
  }

  DoctorModel fromJson(Map<String, Object> json) {
    return DoctorModel.fromJson(json);
  }
}

/// @nodoc
const $DoctorModel = _$DoctorModelTearOff();

/// @nodoc
mixin _$DoctorModel {
  @JsonKey(name: 'nama')
  String? get nama => throw _privateConstructorUsedError;
  @JsonKey(name: 'dokter')
  String? get dokter => throw _privateConstructorUsedError;
  @JsonKey(name: 'jenis_kelamin')
  String? get jenisKelamin => throw _privateConstructorUsedError;
  @JsonKey(name: 'jadwal')
  List<Jadwal>? get jadwal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoctorModelCopyWith<DoctorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorModelCopyWith<$Res> {
  factory $DoctorModelCopyWith(
          DoctorModel value, $Res Function(DoctorModel) then) =
      _$DoctorModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'nama') String? nama,
      @JsonKey(name: 'dokter') String? dokter,
      @JsonKey(name: 'jenis_kelamin') String? jenisKelamin,
      @JsonKey(name: 'jadwal') List<Jadwal>? jadwal});
}

/// @nodoc
class _$DoctorModelCopyWithImpl<$Res> implements $DoctorModelCopyWith<$Res> {
  _$DoctorModelCopyWithImpl(this._value, this._then);

  final DoctorModel _value;
  // ignore: unused_field
  final $Res Function(DoctorModel) _then;

  @override
  $Res call({
    Object? nama = freezed,
    Object? dokter = freezed,
    Object? jenisKelamin = freezed,
    Object? jadwal = freezed,
  }) {
    return _then(_value.copyWith(
      nama: nama == freezed
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      dokter: dokter == freezed
          ? _value.dokter
          : dokter // ignore: cast_nullable_to_non_nullable
              as String?,
      jenisKelamin: jenisKelamin == freezed
          ? _value.jenisKelamin
          : jenisKelamin // ignore: cast_nullable_to_non_nullable
              as String?,
      jadwal: jadwal == freezed
          ? _value.jadwal
          : jadwal // ignore: cast_nullable_to_non_nullable
              as List<Jadwal>?,
    ));
  }
}

/// @nodoc
abstract class _$DoctorModelCopyWith<$Res>
    implements $DoctorModelCopyWith<$Res> {
  factory _$DoctorModelCopyWith(
          _DoctorModel value, $Res Function(_DoctorModel) then) =
      __$DoctorModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'nama') String? nama,
      @JsonKey(name: 'dokter') String? dokter,
      @JsonKey(name: 'jenis_kelamin') String? jenisKelamin,
      @JsonKey(name: 'jadwal') List<Jadwal>? jadwal});
}

/// @nodoc
class __$DoctorModelCopyWithImpl<$Res> extends _$DoctorModelCopyWithImpl<$Res>
    implements _$DoctorModelCopyWith<$Res> {
  __$DoctorModelCopyWithImpl(
      _DoctorModel _value, $Res Function(_DoctorModel) _then)
      : super(_value, (v) => _then(v as _DoctorModel));

  @override
  _DoctorModel get _value => super._value as _DoctorModel;

  @override
  $Res call({
    Object? nama = freezed,
    Object? dokter = freezed,
    Object? jenisKelamin = freezed,
    Object? jadwal = freezed,
  }) {
    return _then(_DoctorModel(
      nama: nama == freezed
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      dokter: dokter == freezed
          ? _value.dokter
          : dokter // ignore: cast_nullable_to_non_nullable
              as String?,
      jenisKelamin: jenisKelamin == freezed
          ? _value.jenisKelamin
          : jenisKelamin // ignore: cast_nullable_to_non_nullable
              as String?,
      jadwal: jadwal == freezed
          ? _value.jadwal
          : jadwal // ignore: cast_nullable_to_non_nullable
              as List<Jadwal>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DoctorModel implements _DoctorModel {
  _$_DoctorModel(
      {@JsonKey(name: 'nama') this.nama,
      @JsonKey(name: 'dokter') this.dokter,
      @JsonKey(name: 'jenis_kelamin') this.jenisKelamin,
      @JsonKey(name: 'jadwal') this.jadwal});

  factory _$_DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$_$_DoctorModelFromJson(json);

  @override
  @JsonKey(name: 'nama')
  final String? nama;
  @override
  @JsonKey(name: 'dokter')
  final String? dokter;
  @override
  @JsonKey(name: 'jenis_kelamin')
  final String? jenisKelamin;
  @override
  @JsonKey(name: 'jadwal')
  final List<Jadwal>? jadwal;

  @override
  String toString() {
    return 'DoctorModel(nama: $nama, dokter: $dokter, jenisKelamin: $jenisKelamin, jadwal: $jadwal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DoctorModel &&
            (identical(other.nama, nama) ||
                const DeepCollectionEquality().equals(other.nama, nama)) &&
            (identical(other.dokter, dokter) ||
                const DeepCollectionEquality().equals(other.dokter, dokter)) &&
            (identical(other.jenisKelamin, jenisKelamin) ||
                const DeepCollectionEquality()
                    .equals(other.jenisKelamin, jenisKelamin)) &&
            (identical(other.jadwal, jadwal) ||
                const DeepCollectionEquality().equals(other.jadwal, jadwal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nama) ^
      const DeepCollectionEquality().hash(dokter) ^
      const DeepCollectionEquality().hash(jenisKelamin) ^
      const DeepCollectionEquality().hash(jadwal);

  @JsonKey(ignore: true)
  @override
  _$DoctorModelCopyWith<_DoctorModel> get copyWith =>
      __$DoctorModelCopyWithImpl<_DoctorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DoctorModelToJson(this);
  }
}

abstract class _DoctorModel implements DoctorModel {
  factory _DoctorModel(
      {@JsonKey(name: 'nama') String? nama,
      @JsonKey(name: 'dokter') String? dokter,
      @JsonKey(name: 'jenis_kelamin') String? jenisKelamin,
      @JsonKey(name: 'jadwal') List<Jadwal>? jadwal}) = _$_DoctorModel;

  factory _DoctorModel.fromJson(Map<String, dynamic> json) =
      _$_DoctorModel.fromJson;

  @override
  @JsonKey(name: 'nama')
  String? get nama => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dokter')
  String? get dokter => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'jenis_kelamin')
  String? get jenisKelamin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'jadwal')
  List<Jadwal>? get jadwal => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DoctorModelCopyWith<_DoctorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
