import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters/datetime_converter.dart';

part 'donetask_model.freezed.dart';
part 'donetask_model.g.dart';

@freezed
class DoneTask with _$DoneTask {
  const factory DoneTask({
    String? id,
    required String studentId,
    required String taskId,
    @Default([]) List<String?>? attachmentPaths,
    String? regFormUrl,
    @CustomDateTimeConverter() DateTime? submittedAt,
    @Default(false) bool isAccepted,
    String? acceptedBy,
    @CustomDateTimeConverter() DateTime? acceptedAt,
  }) = _DoneTask;

  factory DoneTask.fromJson(Map<String, dynamic> json) => _$DoneTaskFromJson(json);
}
