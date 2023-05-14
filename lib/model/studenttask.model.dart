import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters/datetime_converter.dart';
import 'enums/enums.dart';
import 'lol_recipient.model.dart';

part 'studenttask.model.freezed.dart';
part 'studenttask.model.g.dart';

@freezed
class StudentTask with _$StudentTask {
  @JsonSerializable(explicitToJson: true)
  const factory StudentTask({
    String? id,
    String? uid,
    String? taskId,
    String? title,
    String? description,
    String? status,
    @Default([]) List<String?>? scope,
    @Default([]) List<LolRecipientTask?>? recipients,
    TaskType? taskType,

    // String? term,
    @Default(true) bool? isUrgent,
    @CustomDateTimeConverter() DateTime? createdAt,
    @CustomDateTimeConverter() DateTime? startsAt,
    String? uploadedBy,
    @CustomDateTimeConverter() DateTime? deadline,
    @Default(false) bool isAccepted,
    String? acceptedBy,
    @CustomDateTimeConverter() DateTime? acceptedAt,
  }) = _StudentTask;

  factory StudentTask.fromJson(Map<String, dynamic> json) => _$StudentTaskFromJson(json);
}
