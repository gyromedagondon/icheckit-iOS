// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lol_recipient.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LolRecipientTask _$LolRecipientTaskFromJson(Map<String, dynamic> json) {
  return _LolRecipientTask.fromJson(json);
}

/// @nodoc
mixin _$LolRecipientTask {
  @CustomDateTimeConverter()
  DateTime? get acceptedAt => throw _privateConstructorUsedError;
  String? get acceptedBy => throw _privateConstructorUsedError;
  int? get attemptsLeft => throw _privateConstructorUsedError;
  @CustomDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @CustomDateTimeConverter()
  DateTime? get deadline => throw _privateConstructorUsedError;
  int? get deadlineLimit => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  bool? get isAccepted =>
      throw _privateConstructorUsedError; //String? pushToken,
  String? get section => throw _privateConstructorUsedError;
  @CustomDateTimeConverter()
  DateTime? get startsAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get submissionLink => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get submittedAt => throw _privateConstructorUsedError;
  String? get taskId => throw _privateConstructorUsedError;
  String? get term => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError; // student uid?
  String? get uploadedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LolRecipientTaskCopyWith<LolRecipientTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LolRecipientTaskCopyWith<$Res> {
  factory $LolRecipientTaskCopyWith(
          LolRecipientTask value, $Res Function(LolRecipientTask) then) =
      _$LolRecipientTaskCopyWithImpl<$Res, LolRecipientTask>;
  @useResult
  $Res call(
      {@CustomDateTimeConverter() DateTime? acceptedAt,
      String? acceptedBy,
      int? attemptsLeft,
      @CustomDateTimeConverter() DateTime? createdAt,
      @CustomDateTimeConverter() DateTime? deadline,
      int? deadlineLimit,
      String? description,
      String? displayName,
      String? email,
      bool? isAccepted,
      String? section,
      @CustomDateTimeConverter() DateTime? startsAt,
      String? status,
      String? submissionLink,
      String? firstName,
      String? lastName,
      String? submittedAt,
      String? taskId,
      String? term,
      String? title,
      String? uid,
      String? uploadedBy});
}

/// @nodoc
class _$LolRecipientTaskCopyWithImpl<$Res, $Val extends LolRecipientTask>
    implements $LolRecipientTaskCopyWith<$Res> {
  _$LolRecipientTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptedAt = freezed,
    Object? acceptedBy = freezed,
    Object? attemptsLeft = freezed,
    Object? createdAt = freezed,
    Object? deadline = freezed,
    Object? deadlineLimit = freezed,
    Object? description = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? isAccepted = freezed,
    Object? section = freezed,
    Object? startsAt = freezed,
    Object? status = freezed,
    Object? submissionLink = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? submittedAt = freezed,
    Object? taskId = freezed,
    Object? term = freezed,
    Object? title = freezed,
    Object? uid = freezed,
    Object? uploadedBy = freezed,
  }) {
    return _then(_value.copyWith(
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      acceptedBy: freezed == acceptedBy
          ? _value.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      attemptsLeft: freezed == attemptsLeft
          ? _value.attemptsLeft
          : attemptsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deadlineLimit: freezed == deadlineLimit
          ? _value.deadlineLimit
          : deadlineLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isAccepted: freezed == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      section: freezed == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String?,
      startsAt: freezed == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      submissionLink: freezed == submissionLink
          ? _value.submissionLink
          : submissionLink // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      submittedAt: freezed == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      term: freezed == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedBy: freezed == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LolRecipientTaskCopyWith<$Res>
    implements $LolRecipientTaskCopyWith<$Res> {
  factory _$$_LolRecipientTaskCopyWith(
          _$_LolRecipientTask value, $Res Function(_$_LolRecipientTask) then) =
      __$$_LolRecipientTaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@CustomDateTimeConverter() DateTime? acceptedAt,
      String? acceptedBy,
      int? attemptsLeft,
      @CustomDateTimeConverter() DateTime? createdAt,
      @CustomDateTimeConverter() DateTime? deadline,
      int? deadlineLimit,
      String? description,
      String? displayName,
      String? email,
      bool? isAccepted,
      String? section,
      @CustomDateTimeConverter() DateTime? startsAt,
      String? status,
      String? submissionLink,
      String? firstName,
      String? lastName,
      String? submittedAt,
      String? taskId,
      String? term,
      String? title,
      String? uid,
      String? uploadedBy});
}

/// @nodoc
class __$$_LolRecipientTaskCopyWithImpl<$Res>
    extends _$LolRecipientTaskCopyWithImpl<$Res, _$_LolRecipientTask>
    implements _$$_LolRecipientTaskCopyWith<$Res> {
  __$$_LolRecipientTaskCopyWithImpl(
      _$_LolRecipientTask _value, $Res Function(_$_LolRecipientTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptedAt = freezed,
    Object? acceptedBy = freezed,
    Object? attemptsLeft = freezed,
    Object? createdAt = freezed,
    Object? deadline = freezed,
    Object? deadlineLimit = freezed,
    Object? description = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? isAccepted = freezed,
    Object? section = freezed,
    Object? startsAt = freezed,
    Object? status = freezed,
    Object? submissionLink = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? submittedAt = freezed,
    Object? taskId = freezed,
    Object? term = freezed,
    Object? title = freezed,
    Object? uid = freezed,
    Object? uploadedBy = freezed,
  }) {
    return _then(_$_LolRecipientTask(
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      acceptedBy: freezed == acceptedBy
          ? _value.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      attemptsLeft: freezed == attemptsLeft
          ? _value.attemptsLeft
          : attemptsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deadlineLimit: freezed == deadlineLimit
          ? _value.deadlineLimit
          : deadlineLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isAccepted: freezed == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      section: freezed == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String?,
      startsAt: freezed == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      submissionLink: freezed == submissionLink
          ? _value.submissionLink
          : submissionLink // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      submittedAt: freezed == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      term: freezed == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedBy: freezed == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_LolRecipientTask implements _LolRecipientTask {
  const _$_LolRecipientTask(
      {@CustomDateTimeConverter() this.acceptedAt,
      this.acceptedBy,
      this.attemptsLeft = 2,
      @CustomDateTimeConverter() this.createdAt,
      @CustomDateTimeConverter() this.deadline,
      this.deadlineLimit = 7,
      this.description,
      this.displayName,
      this.email,
      this.isAccepted = false,
      this.section,
      @CustomDateTimeConverter() this.startsAt,
      this.status,
      this.submissionLink,
      this.firstName,
      this.lastName,
      this.submittedAt,
      this.taskId,
      this.term = '',
      this.title,
      this.uid,
      this.uploadedBy});

  factory _$_LolRecipientTask.fromJson(Map<String, dynamic> json) =>
      _$$_LolRecipientTaskFromJson(json);

  @override
  @CustomDateTimeConverter()
  final DateTime? acceptedAt;
  @override
  final String? acceptedBy;
  @override
  @JsonKey()
  final int? attemptsLeft;
  @override
  @CustomDateTimeConverter()
  final DateTime? createdAt;
  @override
  @CustomDateTimeConverter()
  final DateTime? deadline;
  @override
  @JsonKey()
  final int? deadlineLimit;
  @override
  final String? description;
  @override
  final String? displayName;
  @override
  final String? email;
  @override
  @JsonKey()
  final bool? isAccepted;
//String? pushToken,
  @override
  final String? section;
  @override
  @CustomDateTimeConverter()
  final DateTime? startsAt;
  @override
  final String? status;
  @override
  final String? submissionLink;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? submittedAt;
  @override
  final String? taskId;
  @override
  @JsonKey()
  final String? term;
  @override
  final String? title;
  @override
  final String? uid;
// student uid?
  @override
  final String? uploadedBy;

  @override
  String toString() {
    return 'LolRecipientTask(acceptedAt: $acceptedAt, acceptedBy: $acceptedBy, attemptsLeft: $attemptsLeft, createdAt: $createdAt, deadline: $deadline, deadlineLimit: $deadlineLimit, description: $description, displayName: $displayName, email: $email, isAccepted: $isAccepted, section: $section, startsAt: $startsAt, status: $status, submissionLink: $submissionLink, firstName: $firstName, lastName: $lastName, submittedAt: $submittedAt, taskId: $taskId, term: $term, title: $title, uid: $uid, uploadedBy: $uploadedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LolRecipientTask &&
            (identical(other.acceptedAt, acceptedAt) ||
                other.acceptedAt == acceptedAt) &&
            (identical(other.acceptedBy, acceptedBy) ||
                other.acceptedBy == acceptedBy) &&
            (identical(other.attemptsLeft, attemptsLeft) ||
                other.attemptsLeft == attemptsLeft) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.deadlineLimit, deadlineLimit) ||
                other.deadlineLimit == deadlineLimit) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isAccepted, isAccepted) ||
                other.isAccepted == isAccepted) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.submissionLink, submissionLink) ||
                other.submissionLink == submissionLink) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.term, term) || other.term == term) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.uploadedBy, uploadedBy) ||
                other.uploadedBy == uploadedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        acceptedAt,
        acceptedBy,
        attemptsLeft,
        createdAt,
        deadline,
        deadlineLimit,
        description,
        displayName,
        email,
        isAccepted,
        section,
        startsAt,
        status,
        submissionLink,
        firstName,
        lastName,
        submittedAt,
        taskId,
        term,
        title,
        uid,
        uploadedBy
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LolRecipientTaskCopyWith<_$_LolRecipientTask> get copyWith =>
      __$$_LolRecipientTaskCopyWithImpl<_$_LolRecipientTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LolRecipientTaskToJson(
      this,
    );
  }
}

abstract class _LolRecipientTask implements LolRecipientTask {
  const factory _LolRecipientTask(
      {@CustomDateTimeConverter() final DateTime? acceptedAt,
      final String? acceptedBy,
      final int? attemptsLeft,
      @CustomDateTimeConverter() final DateTime? createdAt,
      @CustomDateTimeConverter() final DateTime? deadline,
      final int? deadlineLimit,
      final String? description,
      final String? displayName,
      final String? email,
      final bool? isAccepted,
      final String? section,
      @CustomDateTimeConverter() final DateTime? startsAt,
      final String? status,
      final String? submissionLink,
      final String? firstName,
      final String? lastName,
      final String? submittedAt,
      final String? taskId,
      final String? term,
      final String? title,
      final String? uid,
      final String? uploadedBy}) = _$_LolRecipientTask;

  factory _LolRecipientTask.fromJson(Map<String, dynamic> json) =
      _$_LolRecipientTask.fromJson;

  @override
  @CustomDateTimeConverter()
  DateTime? get acceptedAt;
  @override
  String? get acceptedBy;
  @override
  int? get attemptsLeft;
  @override
  @CustomDateTimeConverter()
  DateTime? get createdAt;
  @override
  @CustomDateTimeConverter()
  DateTime? get deadline;
  @override
  int? get deadlineLimit;
  @override
  String? get description;
  @override
  String? get displayName;
  @override
  String? get email;
  @override
  bool? get isAccepted;
  @override //String? pushToken,
  String? get section;
  @override
  @CustomDateTimeConverter()
  DateTime? get startsAt;
  @override
  String? get status;
  @override
  String? get submissionLink;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get submittedAt;
  @override
  String? get taskId;
  @override
  String? get term;
  @override
  String? get title;
  @override
  String? get uid;
  @override // student uid?
  String? get uploadedBy;
  @override
  @JsonKey(ignore: true)
  _$$_LolRecipientTaskCopyWith<_$_LolRecipientTask> get copyWith =>
      throw _privateConstructorUsedError;
}
