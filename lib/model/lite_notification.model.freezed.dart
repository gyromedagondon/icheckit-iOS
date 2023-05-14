// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lite_notification.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LiteNotification _$LiteNotificationFromJson(Map<String, dynamic> json) {
  return _LiteNotification.fromJson(json);
}

/// @nodoc
mixin _$LiteNotification {
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiteNotificationCopyWith<LiteNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiteNotificationCopyWith<$Res> {
  factory $LiteNotificationCopyWith(
          LiteNotification value, $Res Function(LiteNotification) then) =
      _$LiteNotificationCopyWithImpl<$Res, LiteNotification>;
  @useResult
  $Res call({String title, String body});
}

/// @nodoc
class _$LiteNotificationCopyWithImpl<$Res, $Val extends LiteNotification>
    implements $LiteNotificationCopyWith<$Res> {
  _$LiteNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LiteNotificationCopyWith<$Res>
    implements $LiteNotificationCopyWith<$Res> {
  factory _$$_LiteNotificationCopyWith(
          _$_LiteNotification value, $Res Function(_$_LiteNotification) then) =
      __$$_LiteNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String body});
}

/// @nodoc
class __$$_LiteNotificationCopyWithImpl<$Res>
    extends _$LiteNotificationCopyWithImpl<$Res, _$_LiteNotification>
    implements _$$_LiteNotificationCopyWith<$Res> {
  __$$_LiteNotificationCopyWithImpl(
      _$_LiteNotification _value, $Res Function(_$_LiteNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
  }) {
    return _then(_$_LiteNotification(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_LiteNotification implements _LiteNotification {
  const _$_LiteNotification({required this.title, required this.body});

  factory _$_LiteNotification.fromJson(Map<String, dynamic> json) =>
      _$$_LiteNotificationFromJson(json);

  @override
  final String title;
  @override
  final String body;

  @override
  String toString() {
    return 'LiteNotification(title: $title, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LiteNotification &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LiteNotificationCopyWith<_$_LiteNotification> get copyWith =>
      __$$_LiteNotificationCopyWithImpl<_$_LiteNotification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LiteNotificationToJson(
      this,
    );
  }
}

abstract class _LiteNotification implements LiteNotification {
  const factory _LiteNotification(
      {required final String title,
      required final String body}) = _$_LiteNotification;

  factory _LiteNotification.fromJson(Map<String, dynamic> json) =
      _$_LiteNotification.fromJson;

  @override
  String get title;
  @override
  String get body;
  @override
  @JsonKey(ignore: true)
  _$$_LiteNotificationCopyWith<_$_LiteNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
