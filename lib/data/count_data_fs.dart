import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'count_data_fs.freezed.dart';
part 'count_data_fs.g.dart';

@freezed
class CountDataFs with _$CountDataFs {
  const factory CountDataFs({
    required DateTime dateTime,
    required int count,
  }) = _CountDataFs;

  factory CountDataFs.fromJson(Map<String, dynamic> json) =>
      _$CountDataFsFromJson(json);
}
