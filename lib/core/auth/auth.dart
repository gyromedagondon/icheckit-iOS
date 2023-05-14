import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/model/student.model.dart';
import 'package:icheckit_final/repositories/user_repository.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authStateChangesProvider =
    StreamProvider<User?>((ref) => ref.watch(firebaseAuthProvider).authStateChanges());

/// a provider for firestore that requires that the user should be auth'd
final userRepositoryProvider = Provider<UserRepository?>((ref) {
  final auth = ref.watch(authStateChangesProvider);

  if (auth.asData?.value != null && auth.asData?.value?.uid != null) {
    return UserRepository(useruid: auth.asData!.value!.uid);
  } else {
    return null;
  }
});

final userIsVerifiedProvider = StreamProvider<bool>((ref) {
  final thisUser = ref.watch(authStateChangesProvider);
  if (thisUser.asData == null || thisUser.asData?.value == null) return Stream.value(false);
  return Stream.value(thisUser.asData!.value!.emailVerified);
});
