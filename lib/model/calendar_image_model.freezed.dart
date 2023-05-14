// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalendarImage _$CalendarImageFromJson(Map<String, dynamic> json) {
  return _CalendarImage.fromJson(json);
}

/// @nodoc
mixin _$CalendarImage {
  String? get extension => throw _privateConstructorUsedError;
  String? get filename => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  int? get yearStart => throw _privateConstructorUsedError;
  int? get yearEnd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarImageCopyWith<CalendarImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarImageCopyWith<$Res> {
  factory $CalendarImageCopyWith(
          CalendarImage value, $Res Function(CalendarImage) then) =
      _$CalendarImageCopyWithImpl<$Res, CalendarImage>;
  @useResult
  $Res call(
      {String? extension,
      String? filename,
      String url,
      int? yearStart,
      int? yearEnd});
}

/// @nodoc
class _$CalendarImageCopyWithImpl<$Res, $Val extends CalendarImage>
    implements $CalendarImageCopyWith<$Res> {
  _$CalendarImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extension = freezed,
    Object? filename = freezed,
    Object? url = null,
    Object? yearStart = freezed,
    Object? yearEnd = freezed,
  }) {
    return _then(_value.copyWith(
      extension: freezed == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String?,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      yearStart: freezed == yearStart
          ? _value.yearStart
          : yearStart // ignore: cast_nullable_to_non_nullable
              as int?,
      yearEnd: freezed == yearEnd
          ? _value.yearEnd
          : yearEnd // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalendarImageCopyWith<$Res>
    implements $CalendarImageCopyWith<$Res> {
  factory _$$_CalendarImageCopyWith(
          _$_CalendarImage value, $Res Function(_$_CalendarImage) then) =
      __$$_CalendarImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? extension,
      String? filename,
      String url,
      int? yearStart,
      int? yearEnd});
}

/// @nodoc
class __$$_CalendarImageCopyWithImpl<$Res>
    extends _$CalendarImageCopyWithImpl<$Res, _$_CalendarImage>
    implements _$$_CalendarImageCopyWith<$Res> {
  __$$_CalendarImageCopyWithImpl(
      _$_CalendarImage _value, $Res Function(_$_CalendarImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extension = freezed,
    Object? filename = freezed,
    Object? url = null,
    Object? yearStart = freezed,
    Object? yearEnd = freezed,
  }) {
    return _then(_$_CalendarImage(
      extension: freezed == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String?,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      yearStart: freezed == yearStart
          ? _value.yearStart
          : yearStart // ignore: cast_nullable_to_non_nullable
              as int?,
      yearEnd: freezed == yearEnd
          ? _value.yearEnd
          : yearEnd // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CalendarImage implements _CalendarImage {
  const _$_CalendarImage(
      {this.extension,
      this.filename,
      required this.url,
      this.yearStart,
      this.yearEnd});

  factory _$_CalendarImage.fromJson(Map<String, dynamic> json) =>
      _$$_CalendarImageFromJson(json);

  @override
  final String? extension;
  @override
  final String? filename;
  @override
  final String url;
  @override
  final int? yearStart;
  @override
  final int? yearEnd;

  @override
  String toString() {
    return 'CalendarImage(extension: $extension, filename: $filename, url: $url, yearStart: $yearStart, yearEnd: $yearEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarImage &&
            (identical(other.extension, extension) ||
                other.extension == extension) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.yearStart, yearStart) ||
                other.yearStart == yearStart) &&
            (identical(other.yearEnd, yearEnd) || other.yearEnd == yearEnd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, extension, filename, url, yearStart, yearEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalendarImageCopyWith<_$_CalendarImage> get copyWith =>
      __$$_CalendarImageCopyWithImpl<_$_CalendarImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CalendarImageToJson(
      this,
    );
  }
}

abstract class _CalendarImage implements CalendarImage {
  const factory _CalendarImage(
      {final String? extension,
      final String? filename,
      required final String url,
      final int? yearStart,
      final int? yearEnd}) = _$_CalendarImage;

  factory _CalendarImage.fromJson(Map<String, dynamic> json) =
      _$_CalendarImage.fromJson;

  @override
  String? get extension;
  @override
  String? get filename;
  @override
  String get url;
  @override
  int? get yearStart;
  @override
  int? get yearEnd;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarImageCopyWith<_$_CalendarImage> get copyWith =>
      throw _privateConstructorUsedError;
}
