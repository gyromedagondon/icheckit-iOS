import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/core/auth/auth.dart';
import 'package:icheckit_final/model/donetask_model.dart';
import 'package:icheckit_final/model/enums/enums.dart';
import 'package:icheckit_final/model/lol_recipient.model.dart';
import 'package:icheckit_final/model/studenttask.model.dart';
import 'package:icheckit_final/repositories/studenttasks_repository.dart';
import 'package:icheckit_final/reusable%20widgets/reusable_widgets.dart';
import 'package:icheckit_final/services/app_services.dart';
import 'package:icheckit_final/states/studenttasks.dart';
import 'package:icheckit_final/utils/check_task_state.dart';
import 'package:icheckit_final/utils/get_mime_type.dart';

import '../states/student.dart';

class SpecificTaskScreen extends HookConsumerWidget {
  const SpecificTaskScreen(
    this.taskinput, {
    Key? key,
  }) : super(key: key);

  final StudentTask taskinput;

  @override
  Widget build(BuildContext context, ref) {
    final combinedtasks = ref.watch(combinedTasksProvider);
    final task = combinedtasks.value?.firstWhere(
      (element) => element?.taskId == taskinput.taskId,
      orElse: () => null,
    );

    if (task == null) return const Center(child: EmptyIndicator());

    final isForRegistration = task.taskType == TaskType.verification;
    final isUploading = useState<bool>(false);

    final fileslist = useState<Set<String?>?>(null);
    final mainScrollCtr = useScrollController();
    final regFormUploaded = isForRegistration ? ref.watch(regFormUploadsProvider) : null;
    final studentProfile = ref.watch(studentProfileProvider);

    final uploadeds = isForRegistration
        ? ref.watch(regFormUploadsProvider)
        : ref.watch(doneTaskUploadsProvider(task.id!));

    final isAccepted = task.recipients
            ?.where(
                (rec) => (rec?.isAccepted ?? false) && rec?.email == studentProfile.value?.email)
            .isNotEmpty ??
        false;

    final userRegistrationTask = ref.watch(userRegistrationSubmiTaskProvider);
    final regformsubmission = userRegistrationTask.value;

    final acceptedSubmissions = <String?>[
      if (regformsubmission?.isAccepted ?? false) regformsubmission?.taskId,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Details',
          style: TextStyle(color: Colors.white),
        ),
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: ListView(
        controller: mainScrollCtr,
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              buildCoverImage(),
              Column(
                children: [
                  Center(
                    child: Text(
                      task.title ?? '<Title not specified>',
                      style: const TextStyle(
                          color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          TaskInfo(description: task.description),
          TaskStateWidget(
            deadline: task.deadline,
            taskstate: getStateFromCombined(
              acceptedSubmissions,
              task,
              studentProfile,
              regformsubmission,
            ),
          ),
          const SizedBox(height: 27),
          Column(
            children: [
              const SizedBox(height: 30),
              const Text('Attach File:', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 3),
              Consumer(
                builder: (context, ref, child) {
                  final user = ref.watch(authStateChangesProvider);

                  return FileAttachmentButton(
                    onTap: (task.recipients
                                    ?.where((rec) =>
                                        (rec?.isAccepted ?? false) &&
                                        rec?.email == studentProfile.value?.email)
                                    .isNotEmpty ??
                                false) ||
                            (regFormUploaded?.isLoading ?? false) ||
                            (uploadeds.value?.items.isNotEmpty ?? false) ||
                            (isForRegistration &&
                                ((fileslist.value?.isNotEmpty ?? false) ||
                                    (regFormUploaded?.value?.items.isNotEmpty ?? false)))
                        ? null
                        : user.maybeWhen(
                            orElse: () => null,
                            data: (data) {
                              if (data == null) return null;
                              return () async {
                                try {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                                    withData: true,
                                    type: FileType.custom,
                                    allowMultiple: false,
                                    allowedExtensions: [
                                      'png',
                                      'jpg',
                                      'jpeg',
                                      'bmp',
                                      'webp',
                                      'pdf',
                                      'doc',
                                      'docx',
                                      'ppt',
                                      'pptx',
                                      'xlsx',
                                      'xls'
                                    ],
                                  );

                                  if (result != null && result.files.isNotEmpty) {
                                    fileslist.value = {result.files.first.path};

                                    SchedulerBinding.instance.addPostFrameCallback((_) {
                                      mainScrollCtr.animateTo(
                                        mainScrollCtr.position.maxScrollExtent,
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.easeOut,
                                      );
                                    });
                                  }
                                } catch (e) {
                                  EasyLoading.showError('An error occured\n$e');
                                }
                              };
                            },
                          ),
                  );
                },
              ),
            ],
          ),
          if (fileslist.value != null && fileslist.value!.isNotEmpty) ...[
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38.0),
              child: Row(
                children: [
                  const Center(child: Text('To be uploaded:')),
                  const Spacer(),
                  TextButton(onPressed: () => fileslist.value = {}, child: const Text('Clear')),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(height: 7),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: fileslist.value!.length,
              itemBuilder: (context, index) {
                final rawfilepath = fileslist.value!.elementAt(index);

                if (rawfilepath == null) return const SizedBox.shrink();
                final filepath = rawfilepath.substring(rawfilepath.lastIndexOf('/') + 1);
                if (filepath.isEmpty) return const SizedBox.shrink();

                return ListTile(
                  key: Key(filepath),
                  tileColor: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  title: Text(filepath),
                  trailing: IconButton(
                    onPressed: isAccepted
                        ? null
                        : () {
                            fileslist.value = {}; // Set.of(fileslist.value!)..remove(rawfilepath);
                          },
                    icon: const Icon(Icons.delete_forever),
                    color: Colors.red,
                  ),
                );
              },
            ),
          ],

          // shows the uploaded files to Firebase Cloud Storage
          Consumer(
            builder: (context, ref, child) {
              return uploadeds.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loading: () => const LoadingIndicator(),
                data: (data) {
                  if (data?.items == null || (data?.items.isEmpty ?? true)) {
                    return const SizedBox.shrink();
                  }

                  final uploadedFiles = data!.items;

                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Divider(
                        indent: 24,
                        endIndent: 24,
                        color: Colors.red.shade300,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38.0),
                        child: Row(
                          children: [
                            const Text('Uploaded files'),
                            const Spacer(),
                            TextButton(
                              onPressed: uploadeds.isRefreshing
                                  ? null
                                  : () {
                                      if (isForRegistration) {}
                                      ref.invalidate(regFormUploadsProvider);
                                      ref.invalidate(doneTaskUploadsProvider(task.id!));
                                    },
                              child: const Text('Refresh'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (uploadeds.isRefreshing)
                        const Padding(
                          padding: EdgeInsets.all(24.0),
                          child: LoadingIndicator(),
                        )
                      else ...[
                        ListView.separated(
                          separatorBuilder: (_, __) => const SizedBox(height: 7),
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: uploadedFiles.length,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemBuilder: (context, index) {
                            final thisitem = uploadedFiles.elementAt(index);

                            return ListTile(
                              key: Key(thisitem.fullPath),
                              tileColor: Colors.grey.shade200,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              title: Text(thisitem.name),
                              trailing: IconButton(
                                onPressed: isAccepted
                                    ? null
                                    : () async {
                                        try {
                                          EasyLoading.show(
                                              status: 'Deleting',
                                              maskType: EasyLoadingMaskType.black);
                                          final user = ref.read(authStateChangesProvider).value;

                                          await thisitem.delete();
                                          ref.invalidate(doneTaskUploadsProvider(task.id!));

                                          if (isForRegistration) {
                                            ref.invalidate(regFormUploadsProvider);
                                            await StudentTasksRepository()
                                                .removeRegistrationPathDoneTask(user!.email!);
                                          } else {
                                            var currentRecipients =
                                                List<LolRecipientTask?>.of(task.recipients ?? []);

                                            if (currentRecipients.isNotEmpty) {
                                              final auth = ref.read(authStateChangesProvider).value;
                                              currentRecipients.removeWhere(
                                                (rec) => rec?.email == auth?.email,
                                              );
                                            }

                                            await StudentTasksRepository().removeUploadPathDoneTask(
                                              forTask: task.id!,
                                              updatedTasks: currentRecipients,
                                            );
                                          }

                                          EasyLoading.showSuccess('Deleted');
                                          SchedulerBinding.instance.addPostFrameCallback((_) {
                                            mainScrollCtr.animateTo(
                                              mainScrollCtr.position.maxScrollExtent,
                                              duration: const Duration(milliseconds: 300),
                                              curve: Curves.easeOut,
                                            );
                                          });
                                        } catch (e) {
                                          debugPrint('Deleting uploaded file error: $e');
                                          EasyLoading.showError('Failed');
                                        }
                                      },
                                icon: const Icon(Icons.delete_forever),
                                color: Colors.red,
                              ),
                            );
                          },
                        ),
                      ],
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(height: 40),

          Consumer(
            builder: (context, ref, child) {
              final user = ref.watch(authStateChangesProvider);

              return SubmitTaskButton(
                onTap: isAccepted ||
                        isUploading.value ||
                        (fileslist.value?.isEmpty ?? true) ||
                        (uploadeds.value?.items.isNotEmpty ?? true)
                    ? null
                    : user.maybeWhen(
                        orElse: () => null,
                        data: (userAuthData) {
                          if (userAuthData == null) return null;
                          return () async {
                            try {
                              isUploading.value = true;
                              EasyLoading.show(
                                  status: 'Uploading', maskType: EasyLoadingMaskType.black);

                              final auth = ref.read(authStateChangesProvider).value;

                              // simple way to not hit the 1write/sec limit of firestore
                              await Future.delayed(const Duration(seconds: 1));

                              var uploadedurls = <String>{};

                              for (var i = 0; i < fileslist.value!.length; i++) {
                                final rawfilepath = fileslist.value!.elementAt(i);
                                if (rawfilepath != null) {
                                  final filenameandex =
                                      rawfilepath.substring(rawfilepath.lastIndexOf('/') + 1);
                                  final filetoup = File(rawfilepath);
                                  final filebytes = filetoup.readAsBytesSync();

                                  final storagePath = isForRegistration
                                      ? '/registration_forms'
                                          '/${userAuthData.email ?? auth?.email}'
                                      : '/studentuploads'
                                          '/${userAuthData.uid}'
                                          '/${task.taskId ?? task.uid ?? task.id}';

                                  final upload = StorageService.uploadFileAsBytesWithMetadata(
                                      storagePath,
                                      filenameandex,
                                      filebytes,
                                      getMimeType(
                                          rawfilepath.substring(rawfilepath.lastIndexOf('.') + 1)),
                                      {'filename': filenameandex});

                                  if (upload != null) {
                                    await upload.then((snapshot) async {
                                      final url = await snapshot.ref.getDownloadURL();
                                      debugPrint('url for $filenameandex :: $url');

                                      if (url.isNotEmpty) uploadedurls.add(url);

                                      EasyLoading.showToast('Uploaded $filenameandex');
                                      await Future.delayed(const Duration(seconds: 1));
                                    });
                                  }
                                }
                              }

                              if (uploadedurls.isNotEmpty) {
                                if (!isForRegistration) {
                                  final userProfile = ref.read(studentProfileProvider).value;

                                  final newRecipientData = LolRecipientTask.fromJson({
                                    ...task.toJson(),
                                    if (userProfile != null) ...userProfile.toJson(),
                                  }).copyWith(
                                    uid: task.uid,
                                    submissionLink: uploadedurls.first,
                                    submittedAt: DateTime.now().toIso8601String(),
                                    status: "For Approval",
                                  );

                                  var currentRecipients =
                                      List<LolRecipientTask?>.of(task.recipients ?? []);

                                  if (currentRecipients.isNotEmpty) {
                                    currentRecipients.removeWhere(
                                      (rec) => rec?.email == auth?.email,
                                    );
                                  }

                                  currentRecipients.add(newRecipientData);

                                  if (currentRecipients.isNotEmpty) {
                                    await StudentTasksRepository().submitTaskAttachment(
                                      forTask: task.id!,
                                      updatedTasks: currentRecipients,
                                    );
                                  }
                                } else {
                                  if ((userAuthData.email ?? auth?.email) != null) {
                                    await StudentTasksRepository().addRegistrationDoneTask(
                                      DoneTask(
                                        studentId: userAuthData.uid,
                                        taskId: task.id!,
                                        attachmentPaths: [],
                                        regFormUrl: uploadedurls.first,
                                        submittedAt: DateTime.now(),
                                      ),
                                      (userAuthData.email ?? auth?.email)!,
                                    );
                                  } else {
                                    throw Exception('User email not found');
                                  }
                                }

                                fileslist.value = {};
                              }

                              isUploading.value = false;

                              if (isForRegistration) {
                                ref.invalidate(regFormUploadsProvider);
                              }

                              ref.invalidate(doneTaskUploadsProvider(task.id!));

                              EasyLoading.dismiss();
                            } catch (e) {
                              debugPrint('upload error: $e');
                              EasyLoading.showError('Failed: $e');
                              isUploading.value = false;
                            }
                          };
                        },
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TaskStateWidget extends StatelessWidget {
  const TaskStateWidget({
    Key? key,
    // required this.donetask,
    required this.deadline,
    required this.taskstate,
  }) : super(key: key);

  // final DoneTask? donetask;
  final DateTime? deadline;
  final StudentTaskState taskstate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      child: Row(
        children: [
          if (taskstate == StudentTaskState.done)
            DoneStatusDisplay()
          else if (taskstate == StudentTaskState.pending)
            PendingStatusDisplay()
          else if (taskstate == StudentTaskState.urgent)
            UrgentStatusDisplay()
          else if (taskstate == StudentTaskState.late)
            LateStatusDisplay(),
          const Spacer(),
          DeadlineWidget(deadline: deadline),
        ],
      ),
    );
  }
}
