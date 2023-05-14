// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donetask_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DoneTask _$$_DoneTaskFromJson(Map json) => _$_DoneTask(
      id: json['id'] as String?,
      studentId: json['studentId'] as String,
      taskId: json['taskId'] as String,
      attachmentPaths: (json['attachmentPaths'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      regFormUrl: json['regFormUrl'] as String?,
      submittedAt: _$JsonConverterFromJson<int, DateTime>(
          json['submittedAt'], const CustomDateTimeConverter().fromJson),
      isAccepted: json['isAccepted'] as bool? ?? false,
      acceptedBy: json['acceptedBy'] as String?,
      acceptedAt: _$JsonConverterFromJson<int, DateTime>(
          json['acceptedAt'], const CustomDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$_DoneTaskToJson(_$_DoneTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'taskId': instance.taskId,
      'attachmentPaths': instance.attachmentPaths,
      'regFormUrl': instance.regFormUrl,
      'submittedAt': _$JsonConverterToJson<int, DateTime>(
          instance.submittedAt, const CustomDateTimeConverter().toJson),
      'isAccepted': instance.isAccepted,
      'acceptedBy': instance.acceptedBy,
      'acceptedAt': _$JsonConverterToJson<int, DateTime>(
          instance.acceptedAt, const CustomDateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
