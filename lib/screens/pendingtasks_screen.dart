import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/enums/enums.dart';
import '../reusable%20widgets/reusable_widgets.dart';
import '../states/student.dart';
import '../states/studenttasks.dart';
import '../utils/check_task_state.dart';

class PendingTasksScreen extends HookConsumerWidget {
  const PendingTasksScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final studentProfile = ref.watch(studentProfileProvider);
    final userRegistrationTask = ref.watch(userRegistrationSubmiTaskProvider);
    final combinedTasksProv = ref.watch(combinedTasksProvider);

    return Scaffold(
        body: studentProfile.when(
      data: (stu) {
        if (stu == null) return const EmptyIndicator();
        return ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 24),
          children: [
            Stack(alignment: Alignment.bottomCenter, children: [
              buildCoverImage(),
              Column(
                children: const [
                  Center(
                    child: Text(
                      'Pending Tasks',
                      style:
                          TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ]),
            const SizedBox(height: 8),
            combinedTasksProv.when(
              data: (combinedTasks) {
                if (combinedTasks.isEmpty) return const EmptyIndicator();

                final regformsubmission = userRegistrationTask.value;

                final acceptedSubmissions = <String?>[
                  if (regformsubmission?.isAccepted ?? false) regformsubmission?.taskId,
                ];

                final filteredList = List.of(combinedTasks)
                  ..removeWhere(
                    (thistask) =>
                        getStateFromCombined(
                          acceptedSubmissions,
                          thistask,
                          studentProfile,
                          regformsubmission,
                        ) !=
                        StudentTaskState.pending,
                  );

                if (filteredList.isEmpty) return const EmptyIndicator();

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final thistask = filteredList[index]!;

                    return TaskCard(
                      key: Key(thistask.id!),
                      task: thistask,
                      isEnabled: stu.isVerified || thistask.taskType == TaskType.verification,
                      useremail: stu.email,
                      taskState: StudentTaskState.pending,
                    );
                  },
                );
              },
              error: (err, st) {
                debugPrint('verificationTask err');
                return ErrorIndicator(error: err.toString());
              },
              loading: () => const LoadingIndicator(),
            ),
          ],
        );
      },
      error: (error, stackTrace) => ErrorIndicator(error: error.toString()),
      loading: () => const LoadingIndicator(),
    ));
  }
}
/*SizedBox(height: 30.0),

              RedTaskCard(),
              RedTaskCard(),
              YellowTaskCard(),
              YellowTaskCard(),
              YellowTaskCard()*/
