// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'jadwal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Jadwal _$JadwalFromJson(Map<String, dynamic> json) {
  return _Jadwal.fromJson(json);
}

/// @nodoc
class _$JadwalTearOff {
  const _$JadwalTearOff();

  _Jadwal call(
      {@JsonKey(name: 'hari') String? hari,
      @JsonKey(name: 'pukul') Pukul? pukul}) {
    return _Jadwal(
      hari: hari,
      pukul: pukul,
    );
  }

  Jadwal fromJson(Map<String, Object> json) {
    return Jadwal.fromJson(json);
  }
}

/// @nodoc
const $Jadwal = _$JadwalTearOff();

/// @nodoc
mixin _$Jadwal {
  @JsonKey(name: 'hari')
  String? get hari => throw _privateConstructorUsedError;
  @JsonKey(name: 'pukul')
  Pukul? get pukul => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JadwalCopyWith<Jadwal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JadwalCopyWith<$Res> {
  factory $JadwalCopyWith(Jadwal value, $Res Function(Jadwal) then) =
      _$JadwalCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'hari') String? hari,
      @JsonKey(name: 'pukul') Pukul? pukul});

  $PukulCopyWith<$Res>? get pukul;
}

/// @nodoc
class _$JadwalCopyWithImpl<$Res> implements $JadwalCopyWith<$Res> {
  _$JadwalCopyWithImpl(this._value, this._then);

  final Jadwal _value;
  // ignore: unused_field
  final $Res Function(Jadwal) _then;

  @override
  $Res call({
    Object? hari = freezed,
    Object? pukul = freezed,
  }) {
    return _then(_value.copyWith(
      hari: hari == freezed
          ? _value.hari
          : hari // ignore: cast_nullable_to_non_nullable
              as String?,
      pukul: pukul == freezed
          ? _value.pukul
          : pukul // ignore: cast_nullable_to_non_nullable
              as Pukul?,
    ));
  }

  @override
  $PukulCopyWith<$Res>? get pukul {
    if (_value.pukul == null) {
      return null;
    }

    return $PukulCopyWith<$Res>(_value.pukul!, (value) {
      return _then(_value.copyWith(pukul: value));
    });
  }
}

/// @nodoc
abstract class _$JadwalCopyWith<$Res> implements $JadwalCopyWith<$Res> {
  factory _$JadwalCopyWith(_Jadwal value, $Res Function(_Jadwal) then) =
      __$JadwalCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'hari') String? hari,
      @JsonKey(name: 'pukul') Pukul? pukul});

  @override
  $PukulCopyWith<$Res>? get pukul;
}

/// @nodoc
class __$JadwalCopyWithImpl<$Res> extends _$JadwalCopyWithImpl<$Res>
    implements _$JadwalCopyWith<$Res> {
  __$JadwalCopyWithImpl(_Jadwal _value, $Res Function(_Jadwal) _then)
      : super(_value, (v) => _then(v as _Jadwal));

  @override
  _Jadwal get _value => super._value as _Jadwal;

  @override
  $Res call({
    Object? hari = freezed,
    Object? pukul = freezed,
  }) {
    return _then(_Jadwal(
      hari: hari == freezed
          ? _value.hari
          : hari // ignore: cast_nullable_to_non_nullable
              as String?,
      pukul: pukul == freezed
          ? _value.pukul
          : pukul // ignore: cast_nullable_to_non_nullable
              as Pukul?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Jadwal implements _Jadwal {
  _$_Jadwal(
      {@JsonKey(name: 'hari') this.hari, @JsonKey(name: 'pukul') this.pukul});

  factory _$_Jadwal.fromJson(Map<String, dynamic> json) =>
      _$_$_JadwalFromJson(json);

  @override
  @JsonKey(name: 'hari')
  final String? hari;
  @override
  @JsonKey(name: 'pukul')
  final Pukul? pukul;

  @override
  String toString() {
    return 'Jadwal(hari: $hari, pukul: $pukul)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Jadwal &&
            (identical(other.hari, hari) ||
                const DeepCollectionEquality().equals(other.hari, hari)) &&
            (identical(other.pukul, pukul) ||
                const DeepCollectionEquality().equals(other.pukul, pukul)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hari) ^
      const DeepCollectionEquality().hash(pukul);

  @JsonKey(ignore: true)
  @override
  _$JadwalCopyWith<_Jadwal> get copyWith =>
      __$JadwalCopyWithImpl<_Jadwal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_JadwalToJson(this);
  }
}

abstract class _Jadwal implements Jadwal {
  factory _Jadwal(
      {@JsonKey(name: 'hari') String? hari,
      @JsonKey(name: 'pukul') Pukul? pukul}) = _$_Jadwal;

  factory _Jadwal.fromJson(Map<String, dynamic> json) = _$_Jadwal.fromJson;

  @override
  @JsonKey(name: 'hari')
  String? get hari => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'pukul')
  Pukul? get pukul => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$JadwalCopyWith<_Jadwal> get copyWith => throw _privateConstructorUsedError;
}
