import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/model/enums/enums.dart';
import 'package:icheckit_final/reusable%20widgets/reusable_widgets.dart';
import 'package:icheckit_final/states/student.dart';
import 'package:icheckit_final/states/studenttasks.dart';
import 'package:icheckit_final/utils/check_task_state.dart';

class AllTasksScreen extends HookConsumerWidget {
  const AllTasksScreen({
    super.key,
    required this.title,
  });
  final String title;

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
                children: [
                  Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
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

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: combinedTasks.length,
                  itemBuilder: (context, index) {
                    final thistask = combinedTasks[index]!;
                    final taskState = getStateFromCombined(
                      acceptedSubmissions,
                      thistask,
                      studentProfile,
                      regformsubmission,
                    );

                    return TaskCard(
                      key: Key(thistask.id!),
                      task: thistask,
                      isEnabled: stu.isVerified || thistask.taskType == TaskType.verification,
                      useremail: stu.email,
                      taskState: taskState,
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
