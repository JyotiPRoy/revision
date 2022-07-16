// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sheet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sheet _$SheetFromJson(Map<String, dynamic> json) {
  return _Sheet.fromJson(json);
}

/// @nodoc
mixin _$Sheet {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SheetCopyWith<Sheet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SheetCopyWith<$Res> {
  factory $SheetCopyWith(Sheet value, $Res Function(Sheet) then) =
      _$SheetCopyWithImpl<$Res>;
  $Res call({String id, String title});
}

/// @nodoc
class _$SheetCopyWithImpl<$Res> implements $SheetCopyWith<$Res> {
  _$SheetCopyWithImpl(this._value, this._then);

  final Sheet _value;
  // ignore: unused_field
  final $Res Function(Sheet) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SheetCopyWith<$Res> implements $SheetCopyWith<$Res> {
  factory _$$_SheetCopyWith(_$_Sheet value, $Res Function(_$_Sheet) then) =
      __$$_SheetCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title});
}

/// @nodoc
class __$$_SheetCopyWithImpl<$Res> extends _$SheetCopyWithImpl<$Res>
    implements _$$_SheetCopyWith<$Res> {
  __$$_SheetCopyWithImpl(_$_Sheet _value, $Res Function(_$_Sheet) _then)
      : super(_value, (v) => _then(v as _$_Sheet));

  @override
  _$_Sheet get _value => super._value as _$_Sheet;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_Sheet(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sheet implements _Sheet {
  _$_Sheet({required this.id, required this.title});

  factory _$_Sheet.fromJson(Map<String, dynamic> json) =>
      _$$_SheetFromJson(json);

  @override
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'Sheet(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sheet &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$$_SheetCopyWith<_$_Sheet> get copyWith =>
      __$$_SheetCopyWithImpl<_$_Sheet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SheetToJson(this);
  }
}

abstract class _Sheet implements Sheet {
  factory _Sheet({required final String id, required final String title}) =
      _$_Sheet;

  factory _Sheet.fromJson(Map<String, dynamic> json) = _$_Sheet.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_SheetCopyWith<_$_Sheet> get copyWith =>
      throw _privateConstructorUsedError;
}
