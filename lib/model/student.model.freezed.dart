// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'student.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Student _$StudentFromJson(Map<String, dynamic> json) {
  return _Student.fromJson(json);
}

/// @nodoc
mixin _$Student {
// String? id, // this is firebase auth user uid
  String? get uid =>
      throw _privateConstructorUsedError; // this is firebase auth user uid``
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get course => throw _privateConstructorUsedError;
  String get section => throw _privateConstructorUsedError;
  String get contactNumber => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get pushToken => throw _privateConstructorUsedError;
  UserType? get role =>
      throw _privateConstructorUsedError; // @Default(UserType.student) UserType? userType,
  @CustomDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get createdUsing =>
      throw _privateConstructorUsedError; // @CustomDateTimeConverter() DateTime? updatedAt,
// String? updatedBy,
  bool get isVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentCopyWith<Student> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentCopyWith<$Res> {
  factory $StudentCopyWith(Student value, $Res Function(Student) then) =
      _$StudentCopyWithImpl<$Res, Student>;
  @useResult
  $Res call(
      {String? uid,
      String email,
      String firstName,
      String lastName,
      String course,
      String section,
      String contactNumber,
      String? displayName,
      String? photoUrl,
      String? pushToken,
      UserType? role,
      @CustomDateTimeConverter() DateTime? createdAt,
      String? createdUsing,
      bool isVerified});
}

/// @nodoc
class _$StudentCopyWithImpl<$Res, $Val extends Student>
    implements $StudentCopyWith<$Res> {
  _$StudentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? course = null,
    Object? section = null,
    Object? contactNumber = null,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
    Object? pushToken = freezed,
    Object? role = freezed,
    Object? createdAt = freezed,
    Object? createdUsing = freezed,
    Object? isVerified = null,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String,
      section: null == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pushToken: freezed == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserType?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdUsing: freezed == createdUsing
          ? _value.createdUsing
          : createdUsing // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StudentCopyWith<$Res> implements $StudentCopyWith<$Res> {
  factory _$$_StudentCopyWith(
          _$_Student value, $Res Function(_$_Student) then) =
      __$$_StudentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String email,
      String firstName,
      String lastName,
      String course,
      String section,
      String contactNumber,
      String? displayName,
      String? photoUrl,
      String? pushToken,
      UserType? role,
      @CustomDateTimeConverter() DateTime? createdAt,
      String? createdUsing,
      bool isVerified});
}

/// @nodoc
class __$$_StudentCopyWithImpl<$Res>
    extends _$StudentCopyWithImpl<$Res, _$_Student>
    implements _$$_StudentCopyWith<$Res> {
  __$$_StudentCopyWithImpl(_$_Student _value, $Res Function(_$_Student) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? course = null,
    Object? section = null,
    Object? contactNumber = null,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
    Object? pushToken = freezed,
    Object? role = freezed,
    Object? createdAt = freezed,
    Object? createdUsing = freezed,
    Object? isVerified = null,
  }) {
    return _then(_$_Student(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String,
      section: null == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pushToken: freezed == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserType?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdUsing: freezed == createdUsing
          ? _value.createdUsing
          : createdUsing // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Student implements _Student {
  const _$_Student(
      {this.uid,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.course,
      required this.section,
      required this.contactNumber,
      this.displayName,
      this.photoUrl,
      this.pushToken,
      this.role = UserType.student,
      @CustomDateTimeConverter() this.createdAt,
      this.createdUsing,
      this.isVerified = false});

  factory _$_Student.fromJson(Map<String, dynamic> json) =>
      _$$_StudentFromJson(json);

// String? id, // this is firebase auth user uid
  @override
  final String? uid;
// this is firebase auth user uid``
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String course;
  @override
  final String section;
  @override
  final String contactNumber;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? pushToken;
  @override
  @JsonKey()
  final UserType? role;
// @Default(UserType.student) UserType? userType,
  @override
  @CustomDateTimeConverter()
  final DateTime? createdAt;
  @override
  final String? createdUsing;
// @CustomDateTimeConverter() DateTime? updatedAt,
// String? updatedBy,
  @override
  @JsonKey()
  final bool isVerified;

  @override
  String toString() {
    return 'Student(uid: $uid, email: $email, firstName: $firstName, lastName: $lastName, course: $course, section: $section, contactNumber: $contactNumber, displayName: $displayName, photoUrl: $photoUrl, pushToken: $pushToken, role: $role, createdAt: $createdAt, createdUsing: $createdUsing, isVerified: $isVerified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Student &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.pushToken, pushToken) ||
                other.pushToken == pushToken) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdUsing, createdUsing) ||
                other.createdUsing == createdUsing) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      email,
      firstName,
      lastName,
      course,
      section,
      contactNumber,
      displayName,
      photoUrl,
      pushToken,
      role,
      createdAt,
      createdUsing,
      isVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StudentCopyWith<_$_Student> get copyWith =>
      __$$_StudentCopyWithImpl<_$_Student>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StudentToJson(
      this,
    );
  }
}

abstract class _Student implements Student {
  const factory _Student(
      {final String? uid,
      required final String email,
      required final String firstName,
      required final String lastName,
      required final String course,
      required final String section,
      required final String contactNumber,
      final String? displayName,
      final String? photoUrl,
      final String? pushToken,
      final UserType? role,
      @CustomDateTimeConverter() final DateTime? createdAt,
      final String? createdUsing,
      final bool isVerified}) = _$_Student;

  factory _Student.fromJson(Map<String, dynamic> json) = _$_Student.fromJson;

  @override // String? id, // this is firebase auth user uid
  String? get uid;
  @override // this is firebase auth user uid``
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get course;
  @override
  String get section;
  @override
  String get contactNumber;
  @override
  String? get displayName;
  @override
  String? get photoUrl;
  @override
  String? get pushToken;
  @override
  UserType? get role;
  @override // @Default(UserType.student) UserType? userType,
  @CustomDateTimeConverter()
  DateTime? get createdAt;
  @override
  String? get createdUsing;
  @override // @CustomDateTimeConverter() DateTime? updatedAt,
// String? updatedBy,
  bool get isVerified;
  @override
  @JsonKey(ignore: true)
  _$$_StudentCopyWith<_$_Student> get copyWith =>
      throw _privateConstructorUsedError;
}
