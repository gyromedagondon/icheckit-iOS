import 'dart:math';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/core/auth/auth.dart';
import 'package:icheckit_final/model/enums/enums.dart';
import 'package:icheckit_final/model/lite_notification.model.dart';
import 'package:icheckit_final/repositories/user_repository.dart';
import 'package:icheckit_final/reusable%20widgets/reusable_widgets.dart';
import 'package:icheckit_final/screens/about_screen.dart';
import 'package:icheckit_final/screens/accomplishedtasks_screen.dart';
import 'package:icheckit_final/screens/alltasks_screen.dart';
import 'package:icheckit_final/screens/calendar_screen.dart';
import 'package:icheckit_final/screens/contactcics_screen.dart';
import 'package:icheckit_final/screens/faqs_screen.dart';
import 'package:icheckit_final/screens/latetasks_screen.dart';
import 'package:icheckit_final/screens/myprofile_screen.dart';
import 'package:icheckit_final/screens/pendingtasks_screen.dart';
import 'package:icheckit_final/screens/urgenttasks_screen.dart';
import 'package:icheckit_final/states/firebase_messaging.dart';
import 'package:icheckit_final/states/student.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final currentIndex = useState<int>(0);
    final isUserVerified = ref.watch(userIsVerifiedProvider);
    final auth = ref.watch(authStateChangesProvider).asData?.value;

    final lastNotif = ref.watch(lastNotificationProvider);
    final studentprofile = ref.watch(studentProfileProvider);

    ref.listen(
      studentProfileProvider,
      (previous, next) async {
        if (next.asData?.hasValue ?? false) {
          final nextstudentdata = next.asData?.value;
          if (nextstudentdata != null) {
            final fcmtoken = await ref.read(firebaseMessagingProvider).getToken();
            debugPrint(fcmtoken);
            if (auth != null && fcmtoken != null) {
              await UserRepository(useruid: auth.uid).updateToken(auth.uid, fcmtoken);
            }
            if (previous?.asData?.hasValue ?? false) {
              ref.read(firebaseMessagingProvider).unsubscribeFromTopic(
                    'org.nativescript.iCheckit'
                            '_fcm_topics_sections'
                            '_${nextstudentdata.section}'
                        .trim(),
                  );
            }
            ref.read(firebaseMessagingProvider).subscribeToTopic(
                  'org.nativescript.iCheckit'
                          '_fcm_topics_sections'
                          '_${nextstudentdata.section}'
                      .trim(),
                );
          }
        }
      },
    );

    ref.listen(
      tokenChangesProvider,
      (previous, next) async {
        if (previous?.value != next.value) {
          EasyLoading.showSuccess('token changed');
          if (auth != null && next.value != null) {
            await UserRepository(useruid: auth.uid).updateToken(auth.uid, next.value!);
          }
        }
      },
    );

    ref.listen(
      fcmOnmessageProvider,
      (previous, next) {
        final message = next.asData?.value?.notification;
        if (message != null) {
          EasyLoading.showToast(
            '${message.title}:\n${message.body}',
            duration: const Duration(seconds: 20),
          );
          ref.read(lastNotificationProvider.notifier).state = LiteNotification(
            title: '${message.title}',
            body: '${message.body}',
          );
        }
      },
    );

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.red),
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text('iCheckIt', style: TextStyle(color: Colors.red)),
          actions: const [
            Icon(
              Icons.verified_user_rounded,
              color: Colors.red,
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body: studentprofile.when(
          loading: () => const LoadingIndicator(),
          error: (error, stackTrace) => Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              ErrorIndicator.fromUserProfileErr(error),
            ],
          ),
          data: (profile) {
            if (profile == null) {
              return SizedBox.expand(
                child: Center(
                  child: SizedBox(
                    width: 330,
                    child: Text('Profile not found', style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
              );
            }
            return Stack(
              children: [
                Scaffold(
                  body: SizedBox.expand(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (lastNotif != null) NotificationWidget(lastNotif: lastNotif),
                        Expanded(
                          child: isUserVerified.when(
                            loading: () => const LoadingIndicator(),
                            data: (isVerified) {
                              return Stack(
                                children: [
                                  IndexedStack(
                                    index: currentIndex.value,
                                    children: const [
                                      AllTasksScreen(title: 'All Tasks'),
                                      PendingTasksScreen(),
                                      UrgentTasksScreen(),
                                      LateTasksScreen(),
                                      AccomplishedTasksScreen()
                                    ],
                                  ),
                                  if (!isVerified) ...[
                                    BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                                      child: const UnverifiedNotification(),
                                    ),
                                  ],
                                  // else if (!profile.isVerified) ...[
                                  //   BackdropFilter(
                                  //     filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                                  //     child: const UnverifiedStudentNotification(),
                                  //   ),
                                  // ],
                                ],
                              );
                            },
                            error: (error, stackTrace) => const ErrorIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    onTap: (index) => currentIndex.value = index,
                    currentIndex: currentIndex.value,
                    selectedItemColor: Colors.red,
                    unselectedItemColor: Colors.grey,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    elevation: 0,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: Icon(Icons.app_registration_rounded), label: 'All Tasks'),
                      BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Pending'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.warning_amber_rounded), label: 'Urgent'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.assignment_late_outlined), label: 'Late'),
                      BottomNavigationBarItem(icon: Icon(Icons.add_task), label: 'Accomplished'),
                    ],
                  ),
                ),
                if (profile.role != UserType.student) ...[
                  const ColoredBox(
                    color: Colors.black38,
                    child: SizedBox.expand(),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                    child: const UserIsAdminNotification(),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class NotificationWidget extends ConsumerWidget {
  const NotificationWidget({
    Key? key,
    required this.lastNotif,
  }) : super(key: key);

  final LiteNotification lastNotif;

  @override
  Widget build(BuildContext context, ref) {
    return ColoredBox(
      color: Colors.grey.shade100,
      child: InkWell(
        onTap: () => EasyLoading.showToast(
          '${lastNotif.title}:\n${lastNotif.body}',
          duration: const Duration(seconds: 10),
        ),
        // TODO: THIS CAN BE CHANGED TO A SLIDEABLE WIDGET
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Card(
            elevation: 3,
            color: Colors.orange.shade900,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 16.0, end: 6, top: 4, bottom: 4),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Notification:',
                          style:
                              Theme.of(context).textTheme.labelSmall?.apply(color: Colors.white)),
                      const SizedBox(height: 4),
                      Text(lastNotif.title,
                          style:
                              Theme.of(context).textTheme.titleSmall?.apply(color: Colors.white)),
                      Text('${lastNotif.body.substring(0, 16)}...',
                          style: Theme.of(context).textTheme.bodySmall?.apply(color: Colors.white)),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      ref.read(lastNotificationProvider.notifier).state = null;
                      EasyLoading.showSuccess('Marked as read');
                    },
                    icon: const Icon(Icons.check, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UnverifiedNotification extends StatelessWidget {
  const UnverifiedNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black54,
      child: SizedBox.expand(
        child: Center(
          child: SizedBox(
            width: min(280, MediaQuery.of(context).size.width * 0.92),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please verify your email address by clicking on the link in the email sent to you.',
                  style: Theme.of(context).textTheme.titleLarge?.apply(
                        color: Colors.white,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      EasyLoading.show(status: 'Sending...');
                      if (FirebaseAuth.instance.currentUser != null) {
                        await FirebaseAuth.instance.currentUser?.sendEmailVerification();
                        EasyLoading.showSuccess('Sent! Please check your email');
                      } else {
                        EasyLoading.showError('You need to be logged in before we can send it');
                      }
                    } catch (e) {
                      EasyLoading.showError('An error occurred');
                    }
                  },
                  child: const Text('Send to Email'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UnverifiedStudentNotification extends StatelessWidget {
  const UnverifiedStudentNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black54,
      child: SizedBox.expand(
        child: Center(
          child: SizedBox(
            width: min(280, MediaQuery.of(context).size.width * 0.92),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your student account needs to be verified by an admin first',
                  style: Theme.of(context).textTheme.titleLarge?.apply(
                        color: Colors.white,
                        fontWeightDelta: 1,
                        fontSizeDelta: 4,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserIsAdminNotification extends StatelessWidget {
  const UserIsAdminNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black54,
      child: SizedBox.expand(
        child: Center(
          child: SizedBox(
            width: min(280, MediaQuery.of(context).size.width * 0.92),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.warning_amber,
                  size: 60,
                  color: Colors.amber,
                ),
                const SizedBox(height: 24),
                Text(
                  'This app is only for students. Teachers and admins should use our web app',
                  style: Theme.of(context).textTheme.titleLarge?.apply(
                        color: Colors.white,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'icheckit.com',
                  style: Theme.of(context).textTheme.titleMedium?.apply(
                        color: Colors.white,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    await launchUrlString(
                      'https://icheckit.com/',
                      mode: LaunchMode.externalApplication,
                    ); // TODO: SET THE WEB APP LINK
                  },
                  child: const Text('Go to web app'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: ListView(children: <Widget>[
          Consumer(
            builder: (context, ref, child) {
              final user = ref.watch(authStateChangesProvider);
              final studentprofile = ref.watch(studentProfileProvider);
              return user.maybeWhen(
                  orElse: () => const NoUserHeader(),
                  data: (thisuser) {
                    if (thisuser == null) return const NoUserHeader();
                    final name = studentprofile.asData?.value?.firstName == null ||
                            studentprofile.asData?.value?.lastName == null
                        ? ''
                        : '${studentprofile.asData?.value?.firstName} ${studentprofile.asData?.value?.lastName}'
                            .trim();
                    return UserAccountsDrawerHeader(
                      accountName: Text(
                        name.isNotEmpty ? name : thisuser.displayName ?? '<Name not defined>',
                      ),
                      accountEmail: Text(thisuser.email ?? '<No email>'),
                      margin: EdgeInsets.zero,
                      currentAccountPicture: GestureDetector(
                        child: ClipOval(
                          child: CircleAvatar(
                            child: thisuser.photoURL == null
                                ? Text(
                                    ((thisuser.displayName?.isEmpty ?? true)
                                            ? (thisuser.email ?? '?').substring(0, 1)
                                            : (thisuser.displayName)?.substring(0, 1)) ??
                                        '?',
                                    style: Theme.of(context).textTheme.displayMedium?.apply(
                                          color: Colors.white,
                                          fontSizeDelta: 1,
                                          fontWeightDelta: 2,
                                        ),
                                  )
                                : Image(
                                    image: NetworkImage(thisuser.photoURL!),
                                  ),
                          ),
                        ),
                      ),
                      decoration: const BoxDecoration(color: Colors.red),
                    );
                  });
            },
          ),
          const StudentVerifiedMarker(),
          InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const MyProfileScreen()));
              },
              child: const ListTile(
                title: Text('MyProfile'),
                leading: Icon(Icons.person, color: Colors.red),
              )),
          InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const FAQsScreen()));
              },
              child: const ListTile(
                title: Text('FAQs'),
                leading: Icon(Icons.quora, color: Colors.red),
              )),
          InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const AboutScreen()));
              },
              child: const ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.red),
              )),
          InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const ContactScreen()));
              },
              child: const ListTile(
                title: Text('Contact CICS'),
                leading: Icon(Icons.phone, color: Colors.red),
              )),
          InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const CalendarScreen()));
              },
              child: const ListTile(
                title: Text('Collegiate Calendar'),
                leading: Icon(Icons.calendar_month, color: Colors.red),
              )),
          const LogoutButton()
        ]));
  }
}

class StudentVerifiedMarker extends StatelessWidget {
  const StudentVerifiedMarker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final studentprofile = ref.watch(studentProfileProvider);

        return studentprofile.maybeWhen(
            orElse: () => const NoUserHeader(),
            data: (thisuser) {
              if (thisuser == null || thisuser.isVerified) return const SizedBox(height: 8);
              return ColoredBox(
                color: Colors.grey.shade900,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  child: Row(
                    children: const [
                      Icon(Icons.no_accounts, color: Colors.red),
                      SizedBox(width: 32),
                      Text('Account Not Yet Verified',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}

class NoUserHeader extends StatelessWidget {
  const NoUserHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey.shade300,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('[NO USER PROFILE]'),
      ),
    );
  }
}
