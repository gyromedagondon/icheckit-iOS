import 'package:freezed_annotation/freezed_annotation.dart';

part 'lite_notification.model.freezed.dart';
part 'lite_notification.model.g.dart';

@freezed
class LiteNotification with _$LiteNotification {
  @JsonSerializable(explicitToJson: true)
  const factory LiteNotification({
    required String title,
    required String body,
  }) = _LiteNotification;

  factory LiteNotification.fromJson(Map<String, dynamic> json) => _$LiteNotificationFromJson(json);
}
