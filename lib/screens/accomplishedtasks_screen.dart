import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/model/enums/enums.dart';
import 'package:icheckit_final/reusable%20widgets/reusable_widgets.dart';
import 'package:icheckit_final/states/student.dart';
import 'package:icheckit_final/states/studenttasks.dart';

import '../utils/check_task_state.dart';

class AccomplishedTasksScreen extends HookConsumerWidget {
  const AccomplishedTasksScreen({super.key});

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
          padding: const EdgeInsets.only(bottom: 24),
          physics: const BouncingScrollPhysics(),
          children: [
            Stack(alignment: Alignment.bottomCenter, children: [
              buildCoverImage(),
              Column(
                children: const [
                  Center(
                    child: Text(
                      'Accomplished Tasks',
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
                  if (stu.isVerified || (regformsubmission?.isAccepted ?? false))
                    regformsubmission?.taskId,
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
                        StudentTaskState.done,
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
                      taskState: StudentTaskState.done,
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
            // verificationTask.when(
            //   data: (tasks) {
            //     if (tasks.isEmpty) return const SizedBox.shrink();

            //     final submission = userRegistrationTask.value;

            //     final acceptedSubmissions = <String?>[
            //       if (submission?.isAccepted ?? false) submission?.taskId,
            //     ];

            //     final filteredList = List.of(tasks)
            //       ..removeWhere((ts) => !acceptedSubmissions.contains(ts?.taskId));

            //     if (filteredList.isEmpty) return const SizedBox.shrink();

            //     return ListView.builder(
            //       shrinkWrap: true,
            //       physics: const ClampingScrollPhysics(),
            //       itemCount: filteredList.length,
            //       itemBuilder: (context, index) {
            //         final thistask = filteredList[index]!;

            //         return RegistrationTaskCard(
            //           key: Key(thistask.id!),
            //           task: thistask,
            //           isEnabled: true,
            //           useremail: stu.email,
            //           taskState: StudentTaskState.done,
            //         );
            //       },
            //     );
            //   },
            //   error: (err, __) => ErrorIndicator(error: err.toString()),
            //   loading: () => const LoadingIndicator(),
            // ),
            // alltasks.when(
            //   data: (tasks) {
            //     if (tasks.isEmpty) return const EmptyIndicator();

            //     final allPendingTasks = tasks
            //         .where(
            //           (donetasky) =>
            //               donetasky?.recipients
            //                   ?.where((rec) =>
            //                       (rec?.isAccepted ?? false) &&
            //                       rec?.email == studentProfile.value?.email)
            //                   .isNotEmpty ??
            //               false,
            //         )
            //         .toList();

            //     return ListView.builder(
            //       shrinkWrap: true,
            //       physics: const ClampingScrollPhysics(),
            //       itemCount: allPendingTasks.length,
            //       itemBuilder: (context, index) {
            //         final thistask = allPendingTasks[index]!;

            //         return TaskCard(
            //           key: Key(thistask.id!),
            //           task: thistask,
            //           isEnabled: stu.isVerified,
            //           useremail: stu.email,
            //           isForRegistration: false,
            //           taskState: StudentTaskState.done,
            //         );
            //       },
            //     );
            //   },
            //   error: (err, __) => ErrorIndicator(error: err.toString()),
            //   loading: () => const LoadingIndicator(),
            // ),
          ],
        );
      },
      error: (error, stackTrace) => ErrorIndicator(error: error.toString()),
      loading: () => const LoadingIndicator(),
    ));
  }
}
