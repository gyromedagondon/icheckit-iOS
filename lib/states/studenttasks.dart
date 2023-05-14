import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/core/auth/auth.dart';
import 'package:icheckit_final/model/donetask_model.dart';
import 'package:icheckit_final/model/studenttask.model.dart';
import 'package:icheckit_final/repositories/studenttasks_repository.dart';
import 'package:icheckit_final/services/app_services.dart';
import 'package:icheckit_final/states/student.dart';

final tasksRepoProvider = Provider<StudentTasksRepository?>((ref) => StudentTasksRepository());

// final combinedTasksProvider = Provider.autoDispose<List<StudentTask?>>(
//   (ref) {
//     final allTasks = ref.watch(allTasksProvider);
//     final verificationTasks = ref.watch(verificationTasksProvider);

//     return [
//       ...(verificationTasks.value ?? []),
//       ...(allTasks.value ?? []),
//     ];
//   },
// );
final allTasksProvider = StreamProvider<List<StudentTask?>>((ref) {
  final auth = ref.watch(authStateChangesProvider);
  final tasksrepo = ref.watch(tasksRepoProvider);
  final profile = ref.watch(studentProfileProvider);

  if (auth.asData?.value?.uid != null && tasksrepo != null && profile.asData?.value != null) {
    return tasksrepo.getPendingTasksForSectionStudent(
      profile.asData!.value!.section,
      auth.value!.email,
    );
  }
  return Stream.value([]);
});

//
final userRegistrationSubmiTaskProvider = StreamProvider<DoneTask?>((ref) {
  final auth = ref.watch(authStateChangesProvider);
  final tasksrepo = ref.watch(tasksRepoProvider);

  if (auth.value!.email != null && tasksrepo != null) {
    return tasksrepo.getStudentRegistration(
      auth.value!.email!,
    );
  }
  return Stream.value(null);
});

// docs in `verificationTasks` collection
final verificationTasksProvider = StreamProvider<List<StudentTask?>>((ref) {
  final auth = ref.watch(authStateChangesProvider);
  final tasksrepo = ref.watch(tasksRepoProvider);

  if (auth.asData?.value?.uid != null && tasksrepo != null) {
    return tasksrepo.getVerificationTasks();
  }
  return Stream.value([]);
});

final combinedTasksProvider = StreamProvider.autoDispose<List<StudentTask?>>((ref) {
  final alltasks = ref.watch(allTasksProvider).value ?? [];
  final verification = ref.watch(verificationTasksProvider).value ?? [];
  final studentprofile = ref.watch(studentProfileProvider);

  return Stream.value([
    if (!(studentprofile.value?.isVerified ?? false)) ...verification,
    ...alltasks,
  ]);
});

// final doneTasksProvider = StreamProvider<List<DoneTask?>>((ref) {
//   final auth = ref.watch(authStateChangesProvider);
//   final tasksrepo = ref.watch(tasksRepoProvider);

//   if (auth.asData?.value?.uid != null && tasksrepo != null) {
//     return tasksrepo.getAccomplishedTasksByStudent(auth.asData!.value!.uid);
//   }
//   return Stream.value([]);
// });

final doneTaskUploadsProvider = FutureProvider.family.autoDispose<ListResult?, String>(
  (ref, taskId) async {
    final auth = ref.watch(authStateChangesProvider);
    if (auth.asData?.value?.uid != null) {
      return StorageService.getFilesInFolder(
        '/studentuploads'
        '/${auth.asData?.value?.uid}'
        '/$taskId',
      );
    }
    return null;
  },
);
final regFormUploadsProvider = FutureProvider.autoDispose<ListResult?>(
  (ref) async {
    final auth = ref.watch(authStateChangesProvider);
    if (auth.asData?.value?.uid != null) {
      debugPrint(auth.value!.email);
      return StorageService.getFilesInFolder(
        '/registration_forms'
        '/${auth.value!.email}',
      );
    }
    return null;
  },
);
