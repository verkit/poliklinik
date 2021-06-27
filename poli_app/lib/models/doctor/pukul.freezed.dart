// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pukul.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pukul _$PukulFromJson(Map<String, dynamic> json) {
  return _Pukul.fromJson(json);
}

/// @nodoc
class _$PukulTearOff {
  const _$PukulTearOff();

  _Pukul call(
      {@JsonKey(name: 'buka') String? buka,
      @JsonKey(name: 'tutup') String? tutup}) {
    return _Pukul(
      buka: buka,
      tutup: tutup,
    );
  }

  Pukul fromJson(Map<String, Object> json) {
    return Pukul.fromJson(json);
  }
}

/// @nodoc
const $Pukul = _$PukulTearOff();

/// @nodoc
mixin _$Pukul {
  @JsonKey(name: 'buka')
  String? get buka => throw _privateConstructorUsedError;
  @JsonKey(name: 'tutup')
  String? get tutup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PukulCopyWith<Pukul> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PukulCopyWith<$Res> {
  factory $PukulCopyWith(Pukul value, $Res Function(Pukul) then) =
      _$PukulCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'buka') String? buka,
      @JsonKey(name: 'tutup') String? tutup});
}

/// @nodoc
class _$PukulCopyWithImpl<$Res> implements $PukulCopyWith<$Res> {
  _$PukulCopyWithImpl(this._value, this._then);

  final Pukul _value;
  // ignore: unused_field
  final $Res Function(Pukul) _then;

  @override
  $Res call({
    Object? buka = freezed,
    Object? tutup = freezed,
  }) {
    return _then(_value.copyWith(
      buka: buka == freezed
          ? _value.buka
          : buka // ignore: cast_nullable_to_non_nullable
              as String?,
      tutup: tutup == freezed
          ? _value.tutup
          : tutup // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PukulCopyWith<$Res> implements $PukulCopyWith<$Res> {
  factory _$PukulCopyWith(_Pukul value, $Res Function(_Pukul) then) =
      __$PukulCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'buka') String? buka,
      @JsonKey(name: 'tutup') String? tutup});
}

/// @nodoc
class __$PukulCopyWithImpl<$Res> extends _$PukulCopyWithImpl<$Res>
    implements _$PukulCopyWith<$Res> {
  __$PukulCopyWithImpl(_Pukul _value, $Res Function(_Pukul) _then)
      : super(_value, (v) => _then(v as _Pukul));

  @override
  _Pukul get _value => super._value as _Pukul;

  @override
  $Res call({
    Object? buka = freezed,
    Object? tutup = freezed,
  }) {
    return _then(_Pukul(
      buka: buka == freezed
          ? _value.buka
          : buka // ignore: cast_nullable_to_non_nullable
              as String?,
      tutup: tutup == freezed
          ? _value.tutup
          : tutup // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Pukul implements _Pukul {
  _$_Pukul(
      {@JsonKey(name: 'buka') this.buka, @JsonKey(name: 'tutup') this.tutup});

  factory _$_Pukul.fromJson(Map<String, dynamic> json) =>
      _$_$_PukulFromJson(json);

  @override
  @JsonKey(name: 'buka')
  final String? buka;
  @override
  @JsonKey(name: 'tutup')
  final String? tutup;

  @override
  String toString() {
    return 'Pukul(buka: $buka, tutup: $tutup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Pukul &&
            (identical(other.buka, buka) ||
                const DeepCollectionEquality().equals(other.buka, buka)) &&
            (identical(other.tutup, tutup) ||
                const DeepCollectionEquality().equals(other.tutup, tutup)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(buka) ^
      const DeepCollectionEquality().hash(tutup);

  @JsonKey(ignore: true)
  @override
  _$PukulCopyWith<_Pukul> get copyWith =>
      __$PukulCopyWithImpl<_Pukul>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PukulToJson(this);
  }
}

abstract class _Pukul implements Pukul {
  factory _Pukul(
      {@JsonKey(name: 'buka') String? buka,
      @JsonKey(name: 'tutup') String? tutup}) = _$_Pukul;

  factory _Pukul.fromJson(Map<String, dynamic> json) = _$_Pukul.fromJson;

  @override
  @JsonKey(name: 'buka')
  String? get buka => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'tutup')
  String? get tutup => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PukulCopyWith<_Pukul> get copyWith => throw _privateConstructorUsedError;
}
