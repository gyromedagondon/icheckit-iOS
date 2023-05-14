import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/core/auth/auth.dart';
import 'package:icheckit_final/model/student.model.dart';
import 'package:icheckit_final/repositories/user_repository.dart';
import 'package:icheckit_final/reusable%20widgets/profile_widget.dart';
import 'package:icheckit_final/reusable%20widgets/reusable_widgets.dart';
import 'package:icheckit_final/screens/home_screen.dart';
import 'package:icheckit_final/states/studenttasks.dart';
import 'package:icheckit_final/utils/check_task_state.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../model/enums/enums.dart';
import '../model/studenttask.model.dart';
import '../states/student.dart';

class MyProfileScreen extends ConsumerWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(studentProfileProvider);
    final authuser = ref.watch(authStateChangesProvider);
    final verificationTask = ref.watch(verificationTasksProvider);
    final userRegistrationTask = ref.watch(userRegistrationSubmiTaskProvider);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'MyProfile',
            style: TextStyle(color: Colors.white),
          ),
          leading: const BackButton(color: Colors.white),
          backgroundColor: Colors.redAccent,
          elevation: 0),
      body: user.when(
        data: (student) {
          if (student == null) return const EmptyIndicator();
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  buildCoverImage(),
                  Column(
                    children: <Widget>[
                      ProfileWidget(
                        imagePath: authuser.asData?.value?.photoURL ??
                            'https://via.placeholder.com/300?text=No+Image',
                        onClicked: () async {},
                      ),
                      const SizedBox(height: 10),
                      profileName(student),
                    ],
                  )
                ],
              ),
              const StudentVerifiedMarker(),
              const SizedBox(height: 8),
              ProfileInfo(student: student),
              const SizedBox(height: 8),
              semesterAY(),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const UrgentStatusCard(),
                    const PendingStatusCard(),
                    const SizedBox(width: 60),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ViewRegForm(
                        onTap: verificationTask.maybeWhen(
                            orElse: () => null,
                            data: (data) {
                              final registrationSubmis = userRegistrationTask.asData?.value;

                              if (registrationSubmis == null ||
                                  registrationSubmis.regFormUrl == null ||
                                  registrationSubmis.regFormUrl!.isEmpty) {
                                return null;
                              }

                              return () async {
                                await launchUrlString(
                                  registrationSubmis.regFormUrl!,
                                  mode: LaunchMode.externalApplication,
                                );
                                //await launchUrlString(registrationSubmis.regFormUrl!);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => PhotoViewerScreen(
                                //       url: registrationSubmis.regFormUrl!,
                                //     ),
                                //   ),
                                // );
                              };
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              changepass(authuser.asData?.value?.email),
              const DeleteAccess()
            ],
          );
        },
        error: (error, stackTrace) => Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            ErrorIndicator.fromUserProfileErr(error),
          ],
        ),
        loading: () => const LoadingIndicator(),
      ),
    );
  }

  // PROFILE NAME BELOW PROFILE PIC
  profileName(Student user) => Column(
        children: [
          Text(
            '${user.firstName} ${user.lastName}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
          )
        ],
      );

  Card semesterAY() {
    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            SizedBox(height: 5),
            Text(
              'A.Y.: 2022-2023',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 2),
            Text(
              'Semester: 2nd',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}

// CARD FOR PROFILE INFO/DETAILS
class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
    required this.student,
  }) : super(key: key);

  final Student student;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
                child: Text(
              'Personal Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  'Name: ${student.firstName} ${student.lastName}',
                  style: const TextStyle(fontSize: 18),
                ),
                const Spacer(),
                Consumer(
                  builder: (context, ref, child) {
                    final authuser = ref.watch(authStateChangesProvider);

                    return IconButton(
                      onPressed: authuser.asData?.value == null
                          ? null
                          : () async {
                              final name = await showDialog(
                                context: context,
                                builder: (context) => ChangeNameDialog(
                                  firstname: student.firstName,
                                  lastname: student.lastName,
                                ),
                              );

                              if (name != null) {
                                try {
                                  EasyLoading.show(
                                      status: 'Saving', maskType: EasyLoadingMaskType.black);
                                  final theuser = authuser.asData!.value!;
                                  await UserRepository(useruid: theuser.uid).updateProfile(
                                    theuser.uid,
                                    student.copyWith(
                                      firstName: name['first'],
                                      lastName: name['last'],
                                      // updatedAt: DateTime.now().toUtc(),
                                      // updatedBy: theuser.uid,
                                    ),
                                  );
                                  await theuser
                                      .updateDisplayName('${name['first']} ${name['last']}');

                                  EasyLoading.showSuccess('Saved',
                                      maskType: EasyLoadingMaskType.black);
                                } catch (e) {
                                  EasyLoading.showError('Failed');
                                }
                              }
                            },
                      icon: const Icon(Icons.edit),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Text(
                  'Course: ${student.course}',
                  style: const TextStyle(fontSize: 18),
                ),
                const Spacer(),
                Consumer(
                  builder: (context, ref, child) {
                    final authuser = ref.watch(authStateChangesProvider);

                    return IconButton(
                      onPressed: authuser.asData?.value == null
                          ? null
                          : () async {
                              final course = await showDialog(
                                context: context,
                                builder: (context) => ChangeTextDialog(
                                  title: 'Edit course',
                                  value: student.course,
                                ),
                              );

                              if (course != null) {
                                try {
                                  EasyLoading.show(
                                      status: 'Saving', maskType: EasyLoadingMaskType.black);
                                  final theuser = authuser.asData!.value!;
                                  await UserRepository(useruid: theuser.uid).updateProfile(
                                    theuser.uid,
                                    student.copyWith(
                                      course: course,
                                      // updatedAt: DateTime.now().toUtc(),
                                      // updatedBy: theuser.uid,
                                    ),
                                  );

                                  EasyLoading.showSuccess('Saved',
                                      maskType: EasyLoadingMaskType.black);
                                } catch (e) {
                                  EasyLoading.showError('Failed');
                                }
                              }
                            },
                      icon: const Icon(Icons.edit),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Text(
                  'Section: ${student.section}',
                  style: const TextStyle(fontSize: 18),
                ),
                const Spacer(),
                Consumer(
                  builder: (context, ref, child) {
                    final authuser = ref.watch(authStateChangesProvider);

                    return IconButton(
                      onPressed: authuser.asData?.value == null
                          ? null
                          : () async {
                              final section = await showDialog(
                                context: context,
                                builder: (context) => ChangeTextDialog(
                                  title: 'Edit section',
                                  value: student.section,
                                ),
                              );

                              if (section != null) {
                                try {
                                  EasyLoading.show(
                                      status: 'Saving', maskType: EasyLoadingMaskType.black);
                                  final theuser = authuser.asData!.value!;
                                  await UserRepository(useruid: theuser.uid).updateProfile(
                                    theuser.uid,
                                    student.copyWith(
                                      section: section,
                                      // updatedAt: DateTime.now().toUtc(),
                                      // updatedBy: theuser.uid,
                                    ),
                                  );

                                  EasyLoading.showSuccess('Saved',
                                      maskType: EasyLoadingMaskType.black);
                                } catch (e) {
                                  EasyLoading.showError('Failed');
                                }
                              }
                            },
                      icon: const Icon(Icons.edit),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${student.email}',
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

class ChangeNameDialog extends HookWidget {
  const ChangeNameDialog({
    Key? key,
    required this.firstname,
    required this.lastname,
  }) : super(key: key);

  final String firstname, lastname;

  @override
  Widget build(BuildContext context) {
    final firstnamectr = useTextEditingController(text: firstname);
    final lastnamectr = useTextEditingController(text: lastname);
    return AlertDialog(
        title: Text('Edit name'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: firstnamectr,
            ),
            TextFormField(
              controller: lastnamectr,
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, {
              'first': firstnamectr.text,
              'last': lastnamectr.text,
            }),
            child: Text('Save'),
          )
        ]);
  }
}

class ChangeTextDialog extends HookWidget {
  const ChangeTextDialog({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);

  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    final textctr = useTextEditingController(text: value);

    return AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: textctr,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, textctr.text),
            child: Text('Save'),
          )
        ]);
  }
}

// PROFILE CARD NUMBER OF URGENT TASKS (urgent tasks)
class UrgentStatusCard extends ConsumerWidget {
  const UrgentStatusCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final userRegistrationTask = ref.watch(userRegistrationSubmiTaskProvider);
    final studentProfile = ref.watch(studentProfileProvider);
    final combinedTasks = ref.watch(combinedTasksProvider).value;

    int getCount() {
      if (combinedTasks?.isEmpty ?? true) return 0;

      final regformsubmission = userRegistrationTask.value;

      final acceptedSubmissions = <String?>[
        if (regformsubmission?.isAccepted ?? false) regformsubmission?.taskId,
      ];

      final filteredList = List.of(combinedTasks ?? [])
        ..removeWhere(
          (thistask) =>
              getStateFromCombined(
                acceptedSubmissions,
                thistask,
                studentProfile,
                regformsubmission,
              ) !=
              StudentTaskState.urgent,
        );

      return filteredList.length;
    }

    return Card(
      child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          color: Colors.orange.shade600,
          child: Text(
            getCount().toString(),
            style: TextStyle(color: Colors.grey.shade900, fontSize: 65),
          )),
    );
  }
}

// PROFILE CARD NUMBER OF PENDING TASKS (pending tasks)
class PendingStatusCard extends ConsumerWidget {
  const PendingStatusCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final userRegistrationTask = ref.watch(userRegistrationSubmiTaskProvider);
    final studentProfile = ref.watch(studentProfileProvider);
    final combinedTasks = ref.watch(combinedTasksProvider).value;

    int getCount() {
      if (combinedTasks?.isEmpty ?? true) return 0;

      final regformsubmission = userRegistrationTask.value;

      final acceptedSubmissions = <String?>[
        if (regformsubmission?.isAccepted ?? false) regformsubmission?.taskId,
      ];

      final filteredList = List.of(combinedTasks ?? [])
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

      return filteredList.length;
    }

    return Card(
      child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          color: Colors.yellow,
          child: Text(
            getCount().toString(),
            style: TextStyle(color: Colors.grey.shade900, fontSize: 65),
          )),
    );
  }
}
