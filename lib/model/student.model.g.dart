// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Student _$$_StudentFromJson(Map json) => _$_Student(
      uid: json['uid'] as String?,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      course: json['course'] as String,
      section: json['section'] as String,
      contactNumber: json['contactNumber'] as String,
      displayName: json['displayName'] as String?,
      photoUrl: json['photoUrl'] as String?,
      pushToken: json['pushToken'] as String?,
      role:
          $enumDecodeNullable(_$UserTypeEnumMap, json['role']) ?? UserType.student,
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['createdAt'], const CustomDateTimeConverter().fromJson),
      createdUsing: json['createdUsing'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$$_StudentToJson(_$_Student instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'course': instance.course,
      'section': instance.section,
      'contactNumber': instance.contactNumber,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'pushToken': instance.pushToken,
      'role': _$UserTypeEnumMap[instance.role],
      'createdAt': _$JsonConverterToJson<int, DateTime>(
          instance.createdAt, const CustomDateTimeConverter().toJson),
      'createdUsing': instance.createdUsing,
      'isVerified': instance.isVerified,
    };

const _$UserTypeEnumMap = {
  UserType.student: 'Student'
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
