// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'count_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountData _$CountDataFromJson(Map<String, dynamic> json) {
  return _CountData.fromJson(json);
}

/// @nodoc
mixin _$CountData {
  int get count => throw _privateConstructorUsedError;
  int get countUp => throw _privateConstructorUsedError;
  int get countDown => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountDataCopyWith<CountData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountDataCopyWith<$Res> {
  factory $CountDataCopyWith(CountData value, $Res Function(CountData) then) =
      _$CountDataCopyWithImpl<$Res, CountData>;
  @useResult
  $Res call({int count, int countUp, int countDown});
}

/// @nodoc
class _$CountDataCopyWithImpl<$Res, $Val extends CountData>
    implements $CountDataCopyWith<$Res> {
  _$CountDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? countUp = null,
    Object? countDown = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      countUp: null == countUp
          ? _value.countUp
          : countUp // ignore: cast_nullable_to_non_nullable
              as int,
      countDown: null == countDown
          ? _value.countDown
          : countDown // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountDataCopyWith<$Res> implements $CountDataCopyWith<$Res> {
  factory _$$_CountDataCopyWith(
          _$_CountData value, $Res Function(_$_CountData) then) =
      __$$_CountDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, int countUp, int countDown});
}

/// @nodoc
class __$$_CountDataCopyWithImpl<$Res>
    extends _$CountDataCopyWithImpl<$Res, _$_CountData>
    implements _$$_CountDataCopyWith<$Res> {
  __$$_CountDataCopyWithImpl(
      _$_CountData _value, $Res Function(_$_CountData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? countUp = null,
    Object? countDown = null,
  }) {
    return _then(_$_CountData(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      countUp: null == countUp
          ? _value.countUp
          : countUp // ignore: cast_nullable_to_non_nullable
              as int,
      countDown: null == countDown
          ? _value.countDown
          : countDown // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountData with DiagnosticableTreeMixin implements _CountData {
  const _$_CountData(
      {required this.count, required this.countUp, required this.countDown});

  factory _$_CountData.fromJson(Map<String, dynamic> json) =>
      _$$_CountDataFromJson(json);

  @override
  final int count;
  @override
  final int countUp;
  @override
  final int countDown;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CountData(count: $count, countUp: $countUp, countDown: $countDown)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CountData'))
      ..add(DiagnosticsProperty('count', count))
      ..add(DiagnosticsProperty('countUp', countUp))
      ..add(DiagnosticsProperty('countDown', countDown));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountData &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.countUp, countUp) || other.countUp == countUp) &&
            (identical(other.countDown, countDown) ||
                other.countDown == countDown));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, countUp, countDown);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountDataCopyWith<_$_CountData> get copyWith =>
      __$$_CountDataCopyWithImpl<_$_CountData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountDataToJson(
      this,
    );
  }
}

abstract class _CountData implements CountData {
  const factory _CountData(
      {required final int count,
      required final int countUp,
      required final int countDown}) = _$_CountData;

  factory _CountData.fromJson(Map<String, dynamic> json) =
      _$_CountData.fromJson;

  @override
  int get count;
  @override
  int get countUp;
  @override
  int get countDown;
  @override
  @JsonKey(ignore: true)
  _$$_CountDataCopyWith<_$_CountData> get copyWith =>
      throw _privateConstructorUsedError;
}
