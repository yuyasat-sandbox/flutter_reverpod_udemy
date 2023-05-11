// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_data_fs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountDataFs _$$_CountDataFsFromJson(Map<String, dynamic> json) =>
    _$_CountDataFs(
      dateTime: DateTime.parse(json['dateTime'] as String),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_CountDataFsToJson(_$_CountDataFs instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'count': instance.count,
    };
