import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/core/auth/auth.dart';
import 'package:icheckit_final/model/student.model.dart';
import 'package:icheckit_final/repositories/user_repository.dart';

final studentRepoProvider = Provider<UserRepository?>((ref) {
  final auth = ref.watch(authStateChangesProvider);

  if (auth.asData?.value != null && auth.asData?.value?.uid != null) {
    return UserRepository(useruid: auth.asData!.value!.uid);
  } else {
    return null;
  }
});

final studentProfileProvider = StreamProvider<Student?>((ref) {
  final auth = ref.watch(authStateChangesProvider);
  final tasksrepo = ref.watch(studentRepoProvider);
  if (auth.asData?.value?.uid != null && tasksrepo != null) {
    return tasksrepo.getStudentProfile(auth.asData!.value!.uid);
  }
  return Stream.value(null);
});




//STUDENT DART