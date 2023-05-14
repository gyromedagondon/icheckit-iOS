// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'donetask_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DoneTask _$DoneTaskFromJson(Map<String, dynamic> json) {
  return _DoneTask.fromJson(json);
}

/// @nodoc
mixin _$DoneTask {
  String? get id => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;
  String get taskId => throw _privateConstructorUsedError;
  List<String?>? get attachmentPaths => throw _privateConstructorUsedError;
  String? get regFormUrl => throw _privateConstructorUsedError;
  @CustomDateTimeConverter()
  DateTime? get submittedAt => throw _privateConstructorUsedError;
  bool get isAccepted => throw _privateConstructorUsedError;
  String? get acceptedBy => throw _privateConstructorUsedError;
  @CustomDateTimeConverter()
  DateTime? get acceptedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoneTaskCopyWith<DoneTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoneTaskCopyWith<$Res> {
  factory $DoneTaskCopyWith(DoneTask value, $Res Function(DoneTask) then) =
      _$DoneTaskCopyWithImpl<$Res, DoneTask>;
  @useResult
  $Res call(
      {String? id,
      String studentId,
      String taskId,
      List<String?>? attachmentPaths,
      String? regFormUrl,
      @CustomDateTimeConverter() DateTime? submittedAt,
      bool isAccepted,
      String? acceptedBy,
      @CustomDateTimeConverter() DateTime? acceptedAt});
}

/// @nodoc
class _$DoneTaskCopyWithImpl<$Res, $Val extends DoneTask>
    implements $DoneTaskCopyWith<$Res> {
  _$DoneTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentId = null,
    Object? taskId = null,
    Object? attachmentPaths = freezed,
    Object? regFormUrl = freezed,
    Object? submittedAt = freezed,
    Object? isAccepted = null,
    Object? acceptedBy = freezed,
    Object? acceptedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      attachmentPaths: freezed == attachmentPaths
          ? _value.attachmentPaths
          : attachmentPaths // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      regFormUrl: freezed == regFormUrl
          ? _value.regFormUrl
          : regFormUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      submittedAt: freezed == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_DoneTaskCopyWith<$Res> implements $DoneTaskCopyWith<$Res> {
  factory _$$_DoneTaskCopyWith(
          _$_DoneTask value, $Res Function(_$_DoneTask) then) =
      __$$_DoneTaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String studentId,
      String taskId,
      List<String?>? attachmentPaths,
      String? regFormUrl,
      @CustomDateTimeConverter() DateTime? submittedAt,
      bool isAccepted,
      String? acceptedBy,
      @CustomDateTimeConverter() DateTime? acceptedAt});
}

/// @nodoc
class __$$_DoneTaskCopyWithImpl<$Res>
    extends _$DoneTaskCopyWithImpl<$Res, _$_DoneTask>
    implements _$$_DoneTaskCopyWith<$Res> {
  __$$_DoneTaskCopyWithImpl(
      _$_DoneTask _value, $Res Function(_$_DoneTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentId = null,
    Object? taskId = null,
    Object? attachmentPaths = freezed,
    Object? regFormUrl = freezed,
    Object? submittedAt = freezed,
    Object? isAccepted = null,
    Object? acceptedBy = freezed,
    Object? acceptedAt = freezed,
  }) {
    return _then(_$_DoneTask(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      attachmentPaths: freezed == attachmentPaths
          ? _value._attachmentPaths
          : attachmentPaths // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      regFormUrl: freezed == regFormUrl
          ? _value.regFormUrl
          : regFormUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      submittedAt: freezed == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$_DoneTask implements _DoneTask {
  const _$_DoneTask(
      {this.id,
      required this.studentId,
      required this.taskId,
      final List<String?>? attachmentPaths = const [],
      this.regFormUrl,
      @CustomDateTimeConverter() this.submittedAt,
      this.isAccepted = false,
      this.acceptedBy,
      @CustomDateTimeConverter() this.acceptedAt})
      : _attachmentPaths = attachmentPaths;

  factory _$_DoneTask.fromJson(Map<String, dynamic> json) =>
      _$$_DoneTaskFromJson(json);

  @override
  final String? id;
  @override
  final String studentId;
  @override
  final String taskId;
  final List<String?>? _attachmentPaths;
  @override
  @JsonKey()
  List<String?>? get attachmentPaths {
    final value = _attachmentPaths;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? regFormUrl;
  @override
  @CustomDateTimeConverter()
  final DateTime? submittedAt;
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
    return 'DoneTask(id: $id, studentId: $studentId, taskId: $taskId, attachmentPaths: $attachmentPaths, regFormUrl: $regFormUrl, submittedAt: $submittedAt, isAccepted: $isAccepted, acceptedBy: $acceptedBy, acceptedAt: $acceptedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DoneTask &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            const DeepCollectionEquality()
                .equals(other._attachmentPaths, _attachmentPaths) &&
            (identical(other.regFormUrl, regFormUrl) ||
                other.regFormUrl == regFormUrl) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
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
      studentId,
      taskId,
      const DeepCollectionEquality().hash(_attachmentPaths),
      regFormUrl,
      submittedAt,
      isAccepted,
      acceptedBy,
      acceptedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DoneTaskCopyWith<_$_DoneTask> get copyWith =>
      __$$_DoneTaskCopyWithImpl<_$_DoneTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DoneTaskToJson(
      this,
    );
  }
}

abstract class _DoneTask implements DoneTask {
  const factory _DoneTask(
      {final String? id,
      required final String studentId,
      required final String taskId,
      final List<String?>? attachmentPaths,
      final String? regFormUrl,
      @CustomDateTimeConverter() final DateTime? submittedAt,
      final bool isAccepted,
      final String? acceptedBy,
      @CustomDateTimeConverter() final DateTime? acceptedAt}) = _$_DoneTask;

  factory _DoneTask.fromJson(Map<String, dynamic> json) = _$_DoneTask.fromJson;

  @override
  String? get id;
  @override
  String get studentId;
  @override
  String get taskId;
  @override
  List<String?>? get attachmentPaths;
  @override
  String? get regFormUrl;
  @override
  @CustomDateTimeConverter()
  DateTime? get submittedAt;
  @override
  bool get isAccepted;
  @override
  String? get acceptedBy;
  @override
  @CustomDateTimeConverter()
  DateTime? get acceptedAt;
  @override
  @JsonKey(ignore: true)
  _$$_DoneTaskCopyWith<_$_DoneTask> get copyWith =>
      throw _privateConstructorUsedError;
}
