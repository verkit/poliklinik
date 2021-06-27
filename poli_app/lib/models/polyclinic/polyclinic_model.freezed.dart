// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'polyclinic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PolyclinicModel _$PolyclinicModelFromJson(Map<String, dynamic> json) {
  return _PolyclinicModel.fromJson(json);
}

/// @nodoc
class _$PolyclinicModelTearOff {
  const _$PolyclinicModelTearOff();

  _PolyclinicModel call(
      {@JsonKey(name: 'nama') String? nama,
      @JsonKey(name: 'gambar') String? gambar}) {
    return _PolyclinicModel(
      nama: nama,
      gambar: gambar,
    );
  }

  PolyclinicModel fromJson(Map<String, Object> json) {
    return PolyclinicModel.fromJson(json);
  }
}

/// @nodoc
const $PolyclinicModel = _$PolyclinicModelTearOff();

/// @nodoc
mixin _$PolyclinicModel {
  @JsonKey(name: 'nama')
  String? get nama => throw _privateConstructorUsedError;
  @JsonKey(name: 'gambar')
  String? get gambar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PolyclinicModelCopyWith<PolyclinicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PolyclinicModelCopyWith<$Res> {
  factory $PolyclinicModelCopyWith(
          PolyclinicModel value, $Res Function(PolyclinicModel) then) =
      _$PolyclinicModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'nama') String? nama,
      @JsonKey(name: 'gambar') String? gambar});
}

/// @nodoc
class _$PolyclinicModelCopyWithImpl<$Res>
    implements $PolyclinicModelCopyWith<$Res> {
  _$PolyclinicModelCopyWithImpl(this._value, this._then);

  final PolyclinicModel _value;
  // ignore: unused_field
  final $Res Function(PolyclinicModel) _then;

  @override
  $Res call({
    Object? nama = freezed,
    Object? gambar = freezed,
  }) {
    return _then(_value.copyWith(
      nama: nama == freezed
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      gambar: gambar == freezed
          ? _value.gambar
          : gambar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PolyclinicModelCopyWith<$Res>
    implements $PolyclinicModelCopyWith<$Res> {
  factory _$PolyclinicModelCopyWith(
          _PolyclinicModel value, $Res Function(_PolyclinicModel) then) =
      __$PolyclinicModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'nama') String? nama,
      @JsonKey(name: 'gambar') String? gambar});
}

/// @nodoc
class __$PolyclinicModelCopyWithImpl<$Res>
    extends _$PolyclinicModelCopyWithImpl<$Res>
    implements _$PolyclinicModelCopyWith<$Res> {
  __$PolyclinicModelCopyWithImpl(
      _PolyclinicModel _value, $Res Function(_PolyclinicModel) _then)
      : super(_value, (v) => _then(v as _PolyclinicModel));

  @override
  _PolyclinicModel get _value => super._value as _PolyclinicModel;

  @override
  $Res call({
    Object? nama = freezed,
    Object? gambar = freezed,
  }) {
    return _then(_PolyclinicModel(
      nama: nama == freezed
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      gambar: gambar == freezed
          ? _value.gambar
          : gambar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PolyclinicModel implements _PolyclinicModel {
  _$_PolyclinicModel(
      {@JsonKey(name: 'nama') this.nama, @JsonKey(name: 'gambar') this.gambar});

  factory _$_PolyclinicModel.fromJson(Map<String, dynamic> json) =>
      _$_$_PolyclinicModelFromJson(json);

  @override
  @JsonKey(name: 'nama')
  final String? nama;
  @override
  @JsonKey(name: 'gambar')
  final String? gambar;

  @override
  String toString() {
    return 'PolyclinicModel(nama: $nama, gambar: $gambar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PolyclinicModel &&
            (identical(other.nama, nama) ||
                const DeepCollectionEquality().equals(other.nama, nama)) &&
            (identical(other.gambar, gambar) ||
                const DeepCollectionEquality().equals(other.gambar, gambar)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nama) ^
      const DeepCollectionEquality().hash(gambar);

  @JsonKey(ignore: true)
  @override
  _$PolyclinicModelCopyWith<_PolyclinicModel> get copyWith =>
      __$PolyclinicModelCopyWithImpl<_PolyclinicModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PolyclinicModelToJson(this);
  }
}

abstract class _PolyclinicModel implements PolyclinicModel {
  factory _PolyclinicModel(
      {@JsonKey(name: 'nama') String? nama,
      @JsonKey(name: 'gambar') String? gambar}) = _$_PolyclinicModel;

  factory _PolyclinicModel.fromJson(Map<String, dynamic> json) =
      _$_PolyclinicModel.fromJson;

  @override
  @JsonKey(name: 'nama')
  String? get nama => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'gambar')
  String? get gambar => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PolyclinicModelCopyWith<_PolyclinicModel> get copyWith =>
      throw _privateConstructorUsedError;
}
