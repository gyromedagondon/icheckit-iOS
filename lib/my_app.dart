import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/screens/home_screen.dart';
import 'package:icheckit_final/screens/login_screen.dart';
import 'package:icheckit_final/screens/registration_screen.dart';

import 'core/auth/auth.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SwitcherScreen(),
      builder: EasyLoading.init(),
      routes: {
        'login': (_) => const LoginScreen(),
        'registration': (_) => const RegistrationScreen(),
        'home': (_) => const HomeScreen(),
      },
      initialRoute: 'login',
    );
  }
}

class SwitcherScreen extends ConsumerWidget {
  const SwitcherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thisuser = ref.watch(authStateChangesProvider).asData?.value;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: thisuser == null ? const LoginScreen() : const HomeScreen(),
    );
  }
}
