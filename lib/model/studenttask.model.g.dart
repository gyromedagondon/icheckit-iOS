// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studenttask.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StudentTask _$$_StudentTaskFromJson(Map json) => _$_StudentTask(
      id: json['id'] as String?,
      uid: json['uid'] as String?,
      taskId: json['taskId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      scope: (json['scope'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      recipients: (json['recipients'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : LolRecipientTask.fromJson(
                      Map<String, dynamic>.from(e as Map)))
              .toList() ??
          const [],
      taskType: $enumDecodeNullable(_$TaskTypeEnumMap, json['taskType']),
      isUrgent: json['isUrgent'] as bool? ?? true,
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['createdAt'], const CustomDateTimeConverter().fromJson),
      startsAt: _$JsonConverterFromJson<int, DateTime>(
          json['startsAt'], const CustomDateTimeConverter().fromJson),
      uploadedBy: json['uploadedBy'] as String?,
      deadline: _$JsonConverterFromJson<int, DateTime>(
          json['deadline'], const CustomDateTimeConverter().fromJson),
      isAccepted: json['isAccepted'] as bool? ?? false,
      acceptedBy: json['acceptedBy'] as String?,
      acceptedAt: _$JsonConverterFromJson<int, DateTime>(
          json['acceptedAt'], const CustomDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$_StudentTaskToJson(_$_StudentTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'taskId': instance.taskId,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'scope': instance.scope,
      'recipients': instance.recipients?.map((e) => e?.toJson()).toList(),
      'taskType': _$TaskTypeEnumMap[instance.taskType],
      'isUrgent': instance.isUrgent,
      'createdAt': _$JsonConverterToJson<int, DateTime>(
          instance.createdAt, const CustomDateTimeConverter().toJson),
      'startsAt': _$JsonConverterToJson<int, DateTime>(
          instance.startsAt, const CustomDateTimeConverter().toJson),
      'uploadedBy': instance.uploadedBy,
      'deadline': _$JsonConverterToJson<int, DateTime>(
          instance.deadline, const CustomDateTimeConverter().toJson),
      'isAccepted': instance.isAccepted,
      'acceptedBy': instance.acceptedBy,
      'acceptedAt': _$JsonConverterToJson<int, DateTime>(
          instance.acceptedAt, const CustomDateTimeConverter().toJson),
    };

const _$TaskTypeEnumMap = {
  TaskType.verification: 'verification',
  TaskType.regular: 'regular',
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
