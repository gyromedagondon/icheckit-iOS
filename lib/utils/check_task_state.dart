import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/reusable%20widgets/reusable_widgets.dart';

import '../model/donetask_model.dart';
import '../model/enums/enums.dart';
import '../model/student.model.dart';
import '../model/studenttask.model.dart';

StudentTaskState checktaskstate(
  bool isAccepted,
  bool hasSubmission,
  DateTime? deadline,
) {
  return isAccepted // ((lolRect?.isAccepted ?? false) || task.isAccepted)
      ? StudentTaskState.done
      : hasSubmission // lolRect != null && lolRect.submissionLink != null && lolRect.submissionLink!.isNotEmpty
          ? StudentTaskState.pending
          : dateDiffFromNow(deadline) >= -daysConsideredUrgent &&
                  dateDiffFromNow(deadline) <= daysConsideredLate
              ? StudentTaskState.urgent
              : deadline != null && dateDiffFromNow(deadline) > 0
                  ? StudentTaskState.late
                  : StudentTaskState.recent;
}

const daysConsideredUrgent = 2; //48 hours
const daysConsideredLate = 1;

StudentTaskState getStateFromCombined(
  List<String?> acceptedSubmissions,
  StudentTask? thistask,
  AsyncValue<Student?> studentProfile,
  DoneTask? regformsubmission,
) =>
    checktaskstate(
      thistask?.taskType == TaskType.verification
          ? acceptedSubmissions.contains(thistask?.id) ||
              (studentProfile.value?.isVerified ?? false)
          : (thistask?.recipients
                  ?.where((rec) =>
                      (rec?.isAccepted ?? false) &&
                      rec?.submissionLink != null &&
                      rec?.email == studentProfile.value?.email)
                  .isNotEmpty ??
              false),
      thistask?.taskType == TaskType.regular
          ? thistask?.recipients
                  ?.where(
                    (rec) =>
                        rec?.email == studentProfile.value?.email &&
                        rec?.submissionLink != null &&
                        (rec?.submissionLink?.isNotEmpty ?? false),
                  )
                  .isNotEmpty ??
              false
          : regformsubmission?.regFormUrl != null && regformsubmission!.regFormUrl!.isNotEmpty,
      thistask?.deadline,
    );
