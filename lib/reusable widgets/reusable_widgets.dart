// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/core/auth/auth.dart';
import 'package:icheckit_final/model/enums/enums.dart';
import 'package:icheckit_final/model/studenttask.model.dart';
import 'package:icheckit_final/screens/login_screen.dart';
import 'package:icheckit_final/screens/specifictask_screen.dart';
import 'package:intl/intl.dart';

// AUTHENTICATION

// LOGIN TEXTFIELD
TextField loginTextField(
    String text, IconData icon, bool isPasswordType, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.black.withOpacity(0.7)),
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black.withOpacity(0.7),
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.black12.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        )),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

// REGISTRATION TEXTFIELD
TextFormField registerTextField(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller, {
  String? Function(String? text)? validator,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.black.withOpacity(0.7)),
    validator: (value) {
      if (value == null || value.isEmpty) return 'Please enter some text';
      return validator?.call(value);
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black.withOpacity(0.7),
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.black12.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        )),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

// LOGIN/REGISTER BUTTONS
Container loginregisterButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50.0,
    margin: const EdgeInsets.fromLTRB(80, 20, 60, 20),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.grey;
            }
            return Colors.redAccent;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
      child: Text(
        isLogin ? 'LOG IN ' : 'REGISTER',
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    ),
  );
}

//LOGOUT BUTTON
class LogoutButton extends HookConsumerWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      margin: const EdgeInsets.fromLTRB(80, 20, 60, 20),
      child: ElevatedButton(
        onPressed: () async {
          try {
            if (ref.read(authStateChangesProvider).asData?.value != null) {
              await FirebaseAuth.instance.signOut();
              Navigator.popUntil(
                context,
                ModalRoute.withName('login'),
              );
            }
          } catch (e) {
            debugPrint('signout error > $e');
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.grey;
            }
            return Colors.redAccent;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        ),
        child: const Text('LOGOUT', style: TextStyle(fontSize: 15)),
      ),
    );
  }
}
//===================================================
// PROFILE PAGE

// CHANGE PASSWORD BUTTON
TextButton changepass(String? email) {
  return TextButton(
    style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.red)),
    onPressed: email == null
        ? null
        : () async {
            try {
              EasyLoading.show(status: 'Sending request');
              await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
              EasyLoading.showSuccess('Sent');
            } catch (e) {
              EasyLoading.showError('Failed $e');
            }
          },
    child: const Text('Change Password', style: TextStyle(fontSize: 23)),
  );
}

// DELETE ACCOUNT BUTTON
class DeleteAccess extends StatelessWidget {
  const DeleteAccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        minimumSize: const Size.fromHeight(80),
      ),
      onPressed: () async {
        try {
          // TODO: ADD CONFIRMATION DIALOG HERE
          if (FirebaseAuth.instance.currentUser != null) {
            EasyLoading.show(status: 'Requesting deletiong', maskType: EasyLoadingMaskType.black);
            await FirebaseAuth.instance.currentUser?.delete();
            EasyLoading.showSuccess('Deleted');
            await FirebaseAuth.instance.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          } else {
            EasyLoading.showError('You need to be logged in');
          }
        } catch (e) {
          EasyLoading.showError('You need to log in again');
          await FirebaseAuth.instance.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      },
      child: const Text(
        'Delete Account',
        style: TextStyle(fontSize: 23, color: Colors.white),
      ),
    );
  }
}

Container deleteAccountButton(BuildContext context) {
  return Container(
    width: 230,
    height: 70.0,
    margin: const EdgeInsets.fromLTRB(80, 20, 60, 20),
    child: ElevatedButton(
        onPressed: () async {
          try {
            // TODO: ADD CONFIRMATION DIALOG HERE
            if (FirebaseAuth.instance.currentUser != null) {
              EasyLoading.show(status: 'Requesting deletiong', maskType: EasyLoadingMaskType.black);
              await FirebaseAuth.instance.currentUser?.delete();
              EasyLoading.showSuccess('Deleted');
              await FirebaseAuth.instance.signOut();
            } else {
              EasyLoading.showError('You need to be logged in');
            }
          } catch (e) {
            EasyLoading.showError(
              'You need to log in again then\n'
              'request for the deletion again',
            );
            await FirebaseAuth.instance.signOut();
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.grey;
              }
              return Colors.redAccent;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)))),
        child: const Text('Delete Account', style: TextStyle(fontSize: 23))),
  );
}

//===================================================
// PHOTO HEADER/COVER IMAGE
Widget buildCoverImage() => Container(
      child: Image.asset('lib/assets/frassati final.png',
          //width: double.infinity,
          //height: coverHeight,
          fit: BoxFit.cover),
    );
//====================================================
// VIEW REGFORM CARD
InkWell ViewRegForm({required VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      color: Colors.blue.shade300,
      child: Container(
        color: Colors.transparent,
        height: 100,
        width: 140,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(20),
        child: const Center(
          child: Text(
            'View Registration Form',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}
//====================================================
//MY PROFILE PAGE

//===============================================
// SPECIFIC TASK DETAILS PAGE

// TASK DETAILS TASK STATUS (pending status)
Card PendingStatusDisplay() {
  return Card(
    child: Container(
      padding: const EdgeInsets.fromLTRB(10, 35, 10, 35),
      color: Colors.yellow,
      child: const Text('PENDING', style: TextStyle(color: Colors.white, fontSize: 35)),
      //: Column()
    ),
  );
}

// TASK DETAILS TASK STATUS (urgent status)
Card UrgentStatusDisplay() {
  return Card(
    child: Container(
      padding: const EdgeInsets.fromLTRB(10, 35, 10, 35),
      color: Colors.orangeAccent,
      child: const Text('URGENT', style: TextStyle(color: Colors.white, fontSize: 35)),
    ),
  );
}

Card DoneStatusDisplay() {
  return Card(
    child: Container(
      padding: const EdgeInsets.fromLTRB(10, 35, 10, 35),
      color: Colors.green.shade400,
      child: const Text('DONE', style: TextStyle(color: Colors.white, fontSize: 35)),
    ),
  );
}

// TASK DETAILS TASK STATUS (late status)
Card LateStatusDisplay() {
  return Card(
    child: Container(
      padding: const EdgeInsets.fromLTRB(10, 35, 10, 35),
      color: Colors.red,
      child: const Text('LATE', style: TextStyle(color: Colors.white, fontSize: 35)),
      //: Column()
    ),
  );
}

// TASK DETAILS DEADLINE CARD
class DeadlineWidget extends StatelessWidget {
  const DeadlineWidget({
    Key? key,
    required this.deadline,
  }) : super(key: key);

  final DateTime? deadline;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      color: Colors.grey[300],
      height: 110,
      width: 140,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Deadline: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            //date of task deadline
            Text(
              deadline == null ? '...' : DateFormat.yMMMMd().format(deadline!),
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    ));
  }
}

// TASK DETAILS TASK INFO
Card TaskInfo({String? description}) {
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
          const SizedBox(height: 5),
          Text(
            description ?? '...',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 2)
        ],
      ),
    ),
  );
}

// ATTACH A FILE/FILE PICKER

class FileAttachmentButton extends StatelessWidget {
  const FileAttachmentButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: const Size(300, 40),
      ),
      onPressed: onTap,
      child: const Text(
        'Attach file here..',
        style: TextStyle(color: Colors.black38),
      ),
    );
  }
}

// SUBMIT TASK BUTTON
class SubmitTaskButton extends StatelessWidget {
  const SubmitTaskButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        minimumSize: const Size.fromHeight(75),
      ),
      onPressed: onTap,
      child: const Text(
        'SUBMIT TASK',
        style: TextStyle(fontSize: 23, color: Colors.white),
      ),
    );
  }
}

//=====================================================
// ACCOMPLISHED TASKS CARD
InkWell AccomplishedTaskCard(context) {
  return InkWell(
    child: Card(
      color: Colors.yellow[100],
      child: ClipPath(
        child: Container(
          width: 370,
          padding: const EdgeInsets.all(16),
          decoration:
              const BoxDecoration(border: Border(left: BorderSide(color: Colors.green, width: 5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Accomplished Task Title',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Task Description: Students are required to submit a screenshot of the...',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 5),
              const Text(
                'Deadline: Nov. 2, 2022',
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    ),
    onTap: () {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const SpecificTaskScreen()));
    },
  );
}

// PENDING TASKS CARD
InkWell PendingTaskCard(context) {
  return InkWell(
    child: Card(
      color: Colors.yellow[100],
      child: ClipPath(
        child: Container(
          width: 370,
          padding: const EdgeInsets.all(16),
          decoration:
              const BoxDecoration(border: Border(left: BorderSide(color: Colors.yellow, width: 5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Pending Task Title',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Task Description: Students are required to submit a screenshot of the...',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 5),
              const Text(
                'Deadline: Nov. 2, 2022',
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    ),
    onTap: () {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const SpecificTaskScreen()));
    },
  );
}

// URGENT TASKS CARD
InkWell UrgentTaskCard(context) {
  return InkWell(
    child: Card(
      color: Colors.yellow[100],
      child: ClipPath(
        child: Container(
          width: 370,
          padding: const EdgeInsets.all(16),
          decoration:
              const BoxDecoration(border: Border(left: BorderSide(color: Colors.orange, width: 5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Urgent Task Title',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Task Description: Students are required to submit a screenshot of the...',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 5),
              const Text(
                'Deadline: Nov. 2, 2022',
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    ),
    onTap: () {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const SpecificTaskScreen()));
    },
  );
}

// LATE TASKS CARD

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.useremail,
    required this.taskState,
    this.isEnabled = false,
  });

  final StudentTask task;
  final bool isEnabled;
  final String useremail;
  final StudentTaskState taskState;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !isEnabled
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SpecificTaskScreen(task),
                ),
              );
            },
      child: taskCardBase(
        isEnabled,
        taskState,
        task.title,
        task.description,
        task.deadline,
      ),
    );
  }
}

Card taskCardBase(
  bool isEnabled,
  StudentTaskState taskstate,
  String? title,
  String? description,
  DateTime? deadline,
) =>
    Card(
      color: !isEnabled
          ? Colors.grey.shade200
          : taskstate == StudentTaskState.done
              ? Colors.green.shade50
              : taskstate == StudentTaskState.pending
                  ? Colors.yellow.shade50
                  : taskstate == StudentTaskState.urgent
                      ? Colors.yellow.shade100
                      : taskstate == StudentTaskState.late
                          ? Colors.red.shade50
                          : Colors.grey.shade50,
      child: ClipPath(
        child: Container(
          width: 370,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      color: !isEnabled
                          ? Colors.grey
                          : taskstate == StudentTaskState.done
                              ? Colors.green
                              : taskstate == StudentTaskState.pending
                                  ? Colors.yellow.shade600
                                  : taskstate == StudentTaskState.urgent
                                      ? Colors.orange.shade600
                                      : taskstate == StudentTaskState.late
                                          ? Colors.red.shade700
                                          : Colors.blue.shade200,
                      width: 5))),
          child: DefaultTextStyle(
            style: TextStyle(color: isEnabled ? Colors.black : Colors.grey.shade400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title ?? '<No title>',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (taskstate != StudentTaskState.done) ...[
                  const SizedBox(height: 5),
                  Text(
                    !isEnabled ? '...' : description ?? '...',
                    style: const TextStyle(fontSize: 15),
                    overflow: TextOverflow.fade,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  Row(
                    children: [
                      const Text(
                        'Deadline:',
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        deadline == null
                            ? '<None specified>'
                            : DateFormat.yMMMMd().format(deadline.toLocal()),
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );

double dateDiffFromNow(DateTime? compareTo) =>
    ((DateTime.now().millisecondsSinceEpoch - (compareTo?.millisecondsSinceEpoch ?? 0)) /
        86400000.0);

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: const Size(24, 24),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}

class EmptyIndicator extends StatelessWidget {
  const EmptyIndicator({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.inbox, size: 48, color: Colors.black38),
            const SizedBox(height: 16),
            Text(text ?? 'No data found'),
          ],
        ),
      ),
    );
  }
}

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({
    super.key,
    this.error,
    this.title,
  });

  final String? error;
  final String? title;

  factory ErrorIndicator.fromUserProfileErr(Object error) => ErrorIndicator(
        title: 'You don\'t have an approved account yet',
        error: 'Contact the admin for account activation.'
            '\n\nError: $error',
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: min(220, MediaQuery.of(context).size.width * 0.9),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Icon(Icons.error, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              title ?? 'An error occured',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (error != null) ...[
              const SizedBox(height: 4),
              Center(
                child: SizedBox(
                  width: 240,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      error!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ),
            ],
          ]),
        ),
      ),
    );
  }
}
