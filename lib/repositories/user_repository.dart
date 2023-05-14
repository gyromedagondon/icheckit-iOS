import '../model/student.model.dart';
import '../services/app_services.dart';

class UserRepository {
  UserRepository({required this.useruid});

  final String useruid;
  final _service = FirestoreService.instance;

  Future<void> updateProfile(
    String userUid,
    Student details, [
    bool merge = true,
  ]) async =>
      await _service.setData(
        path: 'users'
            '/$userUid',
        data: details.toJson(),
        merge: merge,
      );
  Future<void> updateToken(
    String userUid,
    String token, [
    bool merge = true,
  ]) async =>
      await _service.setData(
        path: 'users'
            '/$userUid',
        data: {'pushToken': token},
        merge: merge,
      );

  Stream<Student?> getStudentProfile(String userUid) => _service.documentStream<Student?>(
        path: 'users/$useruid',
        builder: (data, documentID) => data == null
            ? null
            : Student.fromJson(
                data..addAll({'id': documentID}),
              ),
      );
}
