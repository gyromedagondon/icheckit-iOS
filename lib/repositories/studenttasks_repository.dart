import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../model/donetask_model.dart';
import '../model/enums/enums.dart';
import '../model/lol_recipient.model.dart';
import '../model/studenttask.model.dart';
import '../services/app_services.dart';

class StudentTasksRepository {
  StudentTasksRepository();

  final _service = FirestoreService.instance;

  Stream<List<StudentTask?>> getPendingTasksForSectionStudent(
    String section,
    String? studentEmail,
  ) =>
      _service.collectionStream<StudentTask?>(
        path: 'tasks',
        queryBuilder: (query) => query.where('scope', arrayContains: section).where(
              'status',
              isEqualTo: 'Pending',
            ),
        sortByField: 'deadline',
        sortDescending: true,
        builder: (data, documentID) {
          return StudentTask.fromJson(
            data
              ..addAll({
                'id': documentID,
                'uid': documentID,
                'taskId': documentID,
                'taskType': TaskType.regular.name,
              }),
          );
        },
      );

  Stream<List<StudentTask?>> getVerificationTasks() => _service.collectionStream<StudentTask?>(
        path: 'verificationTasks',
        builder: (data, documentID) {
          return StudentTask.fromJson(
            data
              ..addAll(
                {
                  'id': documentID,
                  'uid': documentID,
                  'taskId': documentID,
                  'taskType': TaskType.verification.name,
                },
              ),
          );
        },
      );

  Future<bool> submitTaskAttachment({
    required String forTask,
    required List<LolRecipientTask?> updatedTasks,
  }) async {
    try {
      await _service.setData(
        path: 'tasks'
            '/$forTask',
        data: {
          'recipients': updatedTasks.map((e) => e?.toJson()).toList(),
        },
        merge: true,
      );
      return true;
    } catch (e) {
      debugPrint('submitTaskAttachment err > $e');
      return false;
    }
  }

  Future<bool> removeUploadPathDoneTask({
    required String forTask,
    required List<LolRecipientTask?> updatedTasks,
  }) async {
    try {
      await _service.setData(
        path: 'tasks'
            '/$forTask',
        data: {
          'recipients': updatedTasks.map((e) => e?.toJson()).toList(),
        },
        merge: true,
      );
      return true;
    } catch (e) {
      debugPrint('removeUploadPathDoneTask err > $e');
      return false;
    }
  }

  // Future<bool> addUploadPathDoneTask(
  //   String taskId,
  //   String studentId,
  //   List<String> pathToAdd,
  // ) async {
  //   try {
  //     await _service.setData(
  //       path: '/tasks'
  //           '/$taskId',
  //       data: {'recipients': FieldValue.arrayUnion(pathToAdd)},
  //       merge: true,
  //     );
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future<bool> removeUploadPathDoneTask(
  //   String taskId,
  //   String studentId,
  //   List<String> pathToRemove,
  // ) async {
  //   try {
  //     await _service.setData(
  //       path: 'accomplished_tasks'
  //           '/${taskId}_$studentId',
  //       data: {'attachmentPaths': FieldValue.arrayRemove(pathToRemove)},
  //       merge: true,
  //     );
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  Future<bool> addRegistrationDoneTask(
    DoneTask task,
    String studentEmail,
  ) async {
    try {
      await _service.setData(
        path: 'registration_forms'
            '/$studentEmail',
        data: task.toJson(),
        merge: true,
      );
      return true;
    } catch (e) {
      debugPrint('addRegistrationDoneTask err > $e');
      return false;
    }
  }

  Future<bool> addRegistrationPathDoneTask(
    String studentEmail,
    String registrationUrl,
  ) async {
    try {
      await _service.setData(
        path: 'registration_forms'
            '/$studentEmail',
        data: {'regFormUrl': registrationUrl},
        merge: true,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<DoneTask?> getStudentRegistration(
    String studentEmail,
  ) {
    try {
      final regData = _service.documentStream<DoneTask?>(
        path: 'registration_forms'
            '/$studentEmail',
        builder: (data, documentID) => data == null
            ? null
            : DoneTask.fromJson(
                data..addAll({'id': documentID}),
              ),
      );
      return regData;
    } catch (e) {
      return Stream.value(null);
    }
  }

  Future<bool> removeRegistrationPathDoneTask(
    String studentEmail,
  ) async {
    try {
      await _service.setData(
        path: 'registration_forms'
            '/$studentEmail',
        data: {'regFormUrl': FieldValue.delete()},
        merge: true,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  // Future<bool> tempSetTaskAccepted(
  //   String taskId,
  //   String studentId,
  //   bool state,
  // ) async {
  //   try {
  //     await _service.setData(
  //       path: 'accomplished_tasks'
  //           '/${taskId}_$studentId',
  //       data: {'isAccepted': state},
  //       merge: true,
  //     );
  //     return true;
  //   } catch (e) {
  //     debugPrint('tempSetTaskAccepted > e > $e');
  //     return false;
  //   }
  // }

  Future<bool> tempSetPlusOneDayDeadline(
    String taskId,
    int days,
  ) async {
    try {
      await _service.setData(
        path: 'tasks'
            '/$taskId',
        data: {'deadline': DateTime.now().add(Duration(days: days)).millisecondsSinceEpoch},
        merge: true,
      );
      return true;
    } catch (e) {
      debugPrint('tempSetPlusOneDayDeadline > e > $e');
      return false;
    }
  }
}
