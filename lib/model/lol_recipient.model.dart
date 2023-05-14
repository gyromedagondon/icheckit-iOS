import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters/datetime_converter.dart';

part 'lol_recipient.model.freezed.dart';
part 'lol_recipient.model.g.dart';

@freezed
class LolRecipientTask with _$LolRecipientTask {
  @JsonSerializable(explicitToJson: true)
  const factory LolRecipientTask({
    @CustomDateTimeConverter() DateTime? acceptedAt,
    String? acceptedBy,
    @Default(2) int? attemptsLeft,
    @CustomDateTimeConverter() DateTime? createdAt,
    @CustomDateTimeConverter() DateTime? deadline,
    @Default(7) int? deadlineLimit,
    String? description,
    String? displayName,
    String? email,
    @Default(false) bool? isAccepted,
    //String? pushToken,
    String? section,
    @CustomDateTimeConverter() DateTime? startsAt,
    String? status,
    String? submissionLink,
    String? firstName,
    String? lastName,
    String? submittedAt,
    String? taskId,
    @Default('') String? term,
    String? title,
    String? uid, // student uid?
    String? uploadedBy,
  }) = _LolRecipientTask;

  factory LolRecipientTask.fromJson(Map<String, dynamic> json) => _$LolRecipientTaskFromJson(json);
}
