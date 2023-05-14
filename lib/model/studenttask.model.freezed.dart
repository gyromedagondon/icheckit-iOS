// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'studenttask.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StudentTask _$StudentTaskFromJson(Map<String, dynamic> json) {
  return _StudentTask.fromJson(json);
}

/// @nodoc
mixin _$StudentTask {
  String? get id => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  String? get taskId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  List<String?>? get scope => throw _privateConstructorUsedError;
  List<LolRecipientTask?>? get recipients => throw _privateConstructorUsedError;
  TaskType? get taskType => throw _privateConstructorUsedError; // String? term,
  bool? get isUrgent => throw _privateConstructorUsedError;
  @CustomDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @CustomDateTimeConverter()
  DateTime? get startsAt => throw _privateConstructorUsedError;
  String? get uploadedBy => throw _privateConstructorUsedError;
  @CustomDateTimeConverter()
  DateTime? get deadline => throw _privateConstructorUsedError;
  bool get isAccepted => throw _privateConstructorUsedError;
  String? get acceptedBy => throw _privateConstructorUsedError;
  @CustomDateTimeConverter()
  DateTime? get acceptedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentTaskCopyWith<StudentTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentTaskCopyWith<$Res> {
  factory $StudentTaskCopyWith(
          StudentTask value, $Res Function(StudentTask) then) =
      _$StudentTaskCopyWithImpl<$Res, StudentTask>;
  @useResult
  $Res call(
      {String? id,
      String? uid,
      String? taskId,
      String? title,
      String? description,
      String? status,
      List<String?>? scope,
      List<LolRecipientTask?>? recipients,
      TaskType? taskType,
      bool? isUrgent,
      @CustomDateTimeConverter() DateTime? createdAt,
      @CustomDateTimeConverter() DateTime? startsAt,
      String? uploadedBy,
      @CustomDateTimeConverter() DateTime? deadline,
      bool isAccepted,
      String? acceptedBy,
      @CustomDateTimeConverter() DateTime? acceptedAt});
}

/// @nodoc
class _$StudentTaskCopyWithImpl<$Res, $Val extends StudentTask>
    implements $StudentTaskCopyWith<$Res> {
  _$StudentTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? taskId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? scope = freezed,
    Object? recipients = freezed,
    Object? taskType = freezed,
    Object? isUrgent = freezed,
    Object? createdAt = freezed,
    Object? startsAt = freezed,
    Object? uploadedBy = freezed,
    Object? deadline = freezed,
    Object? isAccepted = null,
    Object? acceptedBy = freezed,
    Object? acceptedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      recipients: freezed == recipients
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<LolRecipientTask?>?,
      taskType: freezed == taskType
          ? _value.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as TaskType?,
      isUrgent: freezed == isUrgent
          ? _value.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startsAt: freezed == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uploadedBy: freezed == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isAccepted: null == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptedBy: freezed == acceptedBy
          ? _value.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StudentTaskCopyWith<$Res>
    implements $StudentTaskCopyWith<$Res> {
  factory _$$_StudentTaskCopyWith(
          _$_StudentTask value, $Res Function(_$_StudentTask) then) =
      __$$_StudentTaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? uid,
      String? taskId,
      String? title,
      String? description,
      String? status,
      List<String?>? scope,
      List<LolRecipientTask?>? recipients,
      TaskType? taskType,
      bool? isUrgent,
      @CustomDateTimeConverter() DateTime? createdAt,
      @CustomDateTimeConverter() DateTime? startsAt,
      String? uploadedBy,
      @CustomDateTimeConverter() DateTime? deadline,
      bool isAccepted,
      String? acceptedBy,
      @CustomDateTimeConverter() DateTime? acceptedAt});
}

/// @nodoc
class __$$_StudentTaskCopyWithImpl<$Res>
    extends _$StudentTaskCopyWithImpl<$Res, _$_StudentTask>
    implements _$$_StudentTaskCopyWith<$Res> {
  __$$_StudentTaskCopyWithImpl(
      _$_StudentTask _value, $Res Function(_$_StudentTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? taskId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? scope = freezed,
    Object? recipients = freezed,
    Object? taskType = freezed,
    Object? isUrgent = freezed,
    Object? createdAt = freezed,
    Object? startsAt = freezed,
    Object? uploadedBy = freezed,
    Object? deadline = freezed,
    Object? isAccepted = null,
    Object? acceptedBy = freezed,
    Object? acceptedAt = freezed,
  }) {
    return _then(_$_StudentTask(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value._scope
          : scope // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      recipients: freezed == recipients
          ? _value._recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<LolRecipientTask?>?,
      taskType: freezed == taskType
          ? _value.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as TaskType?,
      isUrgent: freezed == isUrgent
          ? _value.isUrgent
          : isUrgent // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startsAt: freezed == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uploadedBy: freezed == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isAccepted: null == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptedBy: freezed == acceptedBy
          ? _value.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_StudentTask implements _StudentTask {
  const _$_StudentTask(
      {this.id,
      this.uid,
      this.taskId,
      this.title,
      this.description,
      this.status,
      final List<String?>? scope = const [],
      final List<LolRecipientTask?>? recipients = const [],
      this.taskType,
      this.isUrgent = true,
      @CustomDateTimeConverter() this.createdAt,
      @CustomDateTimeConverter() this.startsAt,
      this.uploadedBy,
      @CustomDateTimeConverter() this.deadline,
      this.isAccepted = false,
      this.acceptedBy,
      @CustomDateTimeConverter() this.acceptedAt})
      : _scope = scope,
        _recipients = recipients;

  factory _$_StudentTask.fromJson(Map<String, dynamic> json) =>
      _$$_StudentTaskFromJson(json);

  @override
  final String? id;
  @override
  final String? uid;
  @override
  final String? taskId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? status;
  final List<String?>? _scope;
  @override
  @JsonKey()
  List<String?>? get scope {
    final value = _scope;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<LolRecipientTask?>? _recipients;
  @override
  @JsonKey()
  List<LolRecipientTask?>? get recipients {
    final value = _recipients;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TaskType? taskType;
// String? term,
  @override
  @JsonKey()
  final bool? isUrgent;
  @override
  @CustomDateTimeConverter()
  final DateTime? createdAt;
  @override
  @CustomDateTimeConverter()
  final DateTime? startsAt;
  @override
  final String? uploadedBy;
  @override
  @CustomDateTimeConverter()
  final DateTime? deadline;
  @override
  @JsonKey()
  final bool isAccepted;
  @override
  final String? acceptedBy;
  @override
  @CustomDateTimeConverter()
  final DateTime? acceptedAt;

  @override
  String toString() {
    return 'StudentTask(id: $id, uid: $uid, taskId: $taskId, title: $title, description: $description, status: $status, scope: $scope, recipients: $recipients, taskType: $taskType, isUrgent: $isUrgent, createdAt: $createdAt, startsAt: $startsAt, uploadedBy: $uploadedBy, deadline: $deadline, isAccepted: $isAccepted, acceptedBy: $acceptedBy, acceptedAt: $acceptedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StudentTask &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._scope, _scope) &&
            const DeepCollectionEquality()
                .equals(other._recipients, _recipients) &&
            (identical(other.taskType, taskType) ||
                other.taskType == taskType) &&
            (identical(other.isUrgent, isUrgent) ||
                other.isUrgent == isUrgent) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.uploadedBy, uploadedBy) ||
                other.uploadedBy == uploadedBy) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.isAccepted, isAccepted) ||
                other.isAccepted == isAccepted) &&
            (identical(other.acceptedBy, acceptedBy) ||
                other.acceptedBy == acceptedBy) &&
            (identical(other.acceptedAt, acceptedAt) ||
                other.acceptedAt == acceptedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uid,
      taskId,
      title,
      description,
      status,
      const DeepCollectionEquality().hash(_scope),
      const DeepCollectionEquality().hash(_recipients),
      taskType,
      isUrgent,
      createdAt,
      startsAt,
      uploadedBy,
      deadline,
      isAccepted,
      acceptedBy,
      acceptedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StudentTaskCopyWith<_$_StudentTask> get copyWith =>
      __$$_StudentTaskCopyWithImpl<_$_StudentTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StudentTaskToJson(
      this,
    );
  }
}

abstract class _StudentTask implements StudentTask {
  const factory _StudentTask(
      {final String? id,
      final String? uid,
      final String? taskId,
      final String? title,
      final String? description,
      final String? status,
      final List<String?>? scope,
      final List<LolRecipientTask?>? recipients,
      final TaskType? taskType,
      final bool? isUrgent,
      @CustomDateTimeConverter() final DateTime? createdAt,
      @CustomDateTimeConverter() final DateTime? startsAt,
      final String? uploadedBy,
      @CustomDateTimeConverter() final DateTime? deadline,
      final bool isAccepted,
      final String? acceptedBy,
      @CustomDateTimeConverter() final DateTime? acceptedAt}) = _$_StudentTask;

  factory _StudentTask.fromJson(Map<String, dynamic> json) =
      _$_StudentTask.fromJson;

  @override
  String? get id;
  @override
  String? get uid;
  @override
  String? get taskId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get status;
  @override
  List<String?>? get scope;
  @override
  List<LolRecipientTask?>? get recipients;
  @override
  TaskType? get taskType;
  @override // String? term,
  bool? get isUrgent;
  @override
  @CustomDateTimeConverter()
  DateTime? get createdAt;
  @override
  @CustomDateTimeConverter()
  DateTime? get startsAt;
  @override
  String? get uploadedBy;
  @override
  @CustomDateTimeConverter()
  DateTime? get deadline;
  @override
  bool get isAccepted;
  @override
  String? get acceptedBy;
  @override
  @CustomDateTimeConverter()
  DateTime? get acceptedAt;
  @override
  @JsonKey(ignore: true)
  _$$_StudentTaskCopyWith<_$_StudentTask> get copyWith =>
      throw _privateConstructorUsedError;
}
