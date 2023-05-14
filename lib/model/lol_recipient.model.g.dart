// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lol_recipient.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LolRecipientTask _$$_LolRecipientTaskFromJson(Map json) =>
    _$_LolRecipientTask(
      acceptedAt: _$JsonConverterFromJson<int, DateTime>(
          json['acceptedAt'], const CustomDateTimeConverter().fromJson),
      acceptedBy: json['acceptedBy'] as String?,
      attemptsLeft: json['attemptsLeft'] as int? ?? 2,
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['createdAt'], const CustomDateTimeConverter().fromJson),
      deadline: _$JsonConverterFromJson<int, DateTime>(
          json['deadline'], const CustomDateTimeConverter().fromJson),
      deadlineLimit: json['deadlineLimit'] as int? ?? 7,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      isAccepted: json['isAccepted'] as bool? ?? false,
      section: json['section'] as String?,
      startsAt: _$JsonConverterFromJson<int, DateTime>(
          json['startsAt'], const CustomDateTimeConverter().fromJson),
      status: json['status'] as String?,
      submissionLink: json['submissionLink'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      submittedAt: json['submittedAt'] as String?,
      taskId: json['taskId'] as String?,
      term: json['term'] as String? ?? '',
      title: json['title'] as String?,
      uid: json['uid'] as String?,
      uploadedBy: json['uploadedBy'] as String?,
    );

Map<String, dynamic> _$$_LolRecipientTaskToJson(_$_LolRecipientTask instance) =>
    <String, dynamic>{
      'acceptedAt': _$JsonConverterToJson<int, DateTime>(
          instance.acceptedAt, const CustomDateTimeConverter().toJson),
      'acceptedBy': instance.acceptedBy,
      'attemptsLeft': instance.attemptsLeft,
      'createdAt': _$JsonConverterToJson<int, DateTime>(
          instance.createdAt, const CustomDateTimeConverter().toJson),
      'deadline': _$JsonConverterToJson<int, DateTime>(
          instance.deadline, const CustomDateTimeConverter().toJson),
      'deadlineLimit': instance.deadlineLimit,
      'description': instance.description,
      'displayName': instance.displayName,
      'email': instance.email,
      'isAccepted': instance.isAccepted,
      'section': instance.section,
      'startsAt': _$JsonConverterToJson<int, DateTime>(
          instance.startsAt, const CustomDateTimeConverter().toJson),
      'status': instance.status,
      'submissionLink': instance.submissionLink,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'submittedAt': instance.submittedAt,
      'taskId': instance.taskId,
      'term': instance.term,
      'title': instance.title,
      'uid': instance.uid,
      'uploadedBy': instance.uploadedBy,
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
