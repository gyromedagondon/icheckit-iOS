import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_image_model.freezed.dart';
part 'calendar_image_model.g.dart';

@freezed
class CalendarImage with _$CalendarImage {
  const factory CalendarImage({
    String? extension,
    String? filename,
    required String url,
    int? yearStart,
    int? yearEnd,
  }) = _CalendarImage;

  factory CalendarImage.fromJson(Map<String, dynamic> json) => _$CalendarImageFromJson(json);
}
