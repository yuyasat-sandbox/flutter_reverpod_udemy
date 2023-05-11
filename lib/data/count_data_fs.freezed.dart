// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'count_data_fs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountDataFs _$CountDataFsFromJson(Map<String, dynamic> json) {
  return _CountDataFs.fromJson(json);
}

/// @nodoc
mixin _$CountDataFs {
  DateTime get dateTime => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountDataFsCopyWith<CountDataFs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountDataFsCopyWith<$Res> {
  factory $CountDataFsCopyWith(
          CountDataFs value, $Res Function(CountDataFs) then) =
      _$CountDataFsCopyWithImpl<$Res, CountDataFs>;
  @useResult
  $Res call({DateTime dateTime, int count});
}

/// @nodoc
class _$CountDataFsCopyWithImpl<$Res, $Val extends CountDataFs>
    implements $CountDataFsCopyWith<$Res> {
  _$CountDataFsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountDataFsCopyWith<$Res>
    implements $CountDataFsCopyWith<$Res> {
  factory _$$_CountDataFsCopyWith(
          _$_CountDataFs value, $Res Function(_$_CountDataFs) then) =
      __$$_CountDataFsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime dateTime, int count});
}

/// @nodoc
class __$$_CountDataFsCopyWithImpl<$Res>
    extends _$CountDataFsCopyWithImpl<$Res, _$_CountDataFs>
    implements _$$_CountDataFsCopyWith<$Res> {
  __$$_CountDataFsCopyWithImpl(
      _$_CountDataFs _value, $Res Function(_$_CountDataFs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? count = null,
  }) {
    return _then(_$_CountDataFs(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountDataFs with DiagnosticableTreeMixin implements _CountDataFs {
  const _$_CountDataFs({required this.dateTime, required this.count});

  factory _$_CountDataFs.fromJson(Map<String, dynamic> json) =>
      _$$_CountDataFsFromJson(json);

  @override
  final DateTime dateTime;
  @override
  final int count;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CountDataFs(dateTime: $dateTime, count: $count)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CountDataFs'))
      ..add(DiagnosticsProperty('dateTime', dateTime))
      ..add(DiagnosticsProperty('count', count));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountDataFs &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateTime, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountDataFsCopyWith<_$_CountDataFs> get copyWith =>
      __$$_CountDataFsCopyWithImpl<_$_CountDataFs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountDataFsToJson(
      this,
    );
  }
}

abstract class _CountDataFs implements CountDataFs {
  const factory _CountDataFs(
      {required final DateTime dateTime,
      required final int count}) = _$_CountDataFs;

  factory _CountDataFs.fromJson(Map<String, dynamic> json) =
      _$_CountDataFs.fromJson;

  @override
  DateTime get dateTime;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_CountDataFsCopyWith<_$_CountDataFs> get copyWith =>
      throw _privateConstructorUsedError;
}
