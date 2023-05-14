// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalendarImage _$$_CalendarImageFromJson(Map json) => _$_CalendarImage(
      extension: json['extension'] as String?,
      filename: json['filename'] as String?,
      url: json['url'] as String,
      yearStart: json['yearStart'] as int?,
      yearEnd: json['yearEnd'] as int?,
    );

Map<String, dynamic> _$$_CalendarImageToJson(_$_CalendarImage instance) =>
    <String, dynamic>{
      'extension': instance.extension,
      'filename': instance.filename,
      'url': instance.url,
      'yearStart': instance.yearStart,
      'yearEnd': instance.yearEnd,
    };
