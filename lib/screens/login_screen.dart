// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/core/auth/auth.dart';
import 'package:icheckit_final/reusable%20widgets/reusable_widgets.dart';
import 'package:icheckit_final/utils/Colors_utils.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // @override
  // TextEditingController _passwordTextController = TextEditingController();
  // TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(
      authStateChangesProvider,
      (previous, next) async {
        if (previous?.value == null && next.value != null) {
          Navigator.pushNamed(context, 'home');
        }
      },
    );

    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    return Scaffold(
      body: ListView(
          //child: ListView(
          //physics: BouncingScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [hexStringToColor("FFFDD1"), hexStringToColor("FB3B1E")],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Container(
                color: Colors.white.withOpacity(0.9),
                margin: const EdgeInsets.symmetric(vertical: 180.0, horizontal: 25.0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    const Text('Login', style: TextStyle(color: Colors.red, fontSize: 35.0)),
                    const SizedBox(height: 30.0),
                    const Text('Email Address', style: TextStyle(fontSize: 18.0)),
                    const SizedBox(height: 7.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
                      child: loginTextField(
                          "Enter email", Icons.person_outline, false, emailTextController),
                    ),
                    const SizedBox(height: 15.0),
                    const Text('Password', style: TextStyle(fontSize: 18.0)),
                    const SizedBox(height: 7.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
                      child: loginTextField(
                          "Enter password", Icons.lock_outline, true, passwordTextController),
                    ),
                    const SizedBox(height: 15.0),

                    //LOGIN BUTTON
                    loginregisterButton(context, true, () async {
                      try {
                        EasyLoading.show(status: 'Logging in');
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailTextController.text,
                          password: passwordTextController.text,
                        );
                        emailTextController.clear();
                        passwordTextController.clear();
                        EasyLoading.showSuccess('Success');
                      } on FirebaseAuthException catch (ex) {
                        debugPrint('error: $ex');
                        EasyLoading.showError(ex.message ?? ex.code);
                      } catch (e) {
                        debugPrint('error: $e');
                        EasyLoading.showError('Error');
                      }
                    }),
                    const SizedBox(height: 6.0),
                    RegisterOptionWidget(
                      onTap: () {
                        Navigator.pushNamed(context, 'registration');
                      },
                    ),
                    const SizedBox(height: 18.0),
                    ForgotPasswordOption(email: emailTextController.text),
                    const SizedBox(height: 40.0),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}

class ForgotPasswordOption extends StatelessWidget {
  const ForgotPasswordOption({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Forgot password? ", style: TextStyle(color: Colors.black54)),
        GestureDetector(
          onTap: () async {
            if (email.isEmpty) {
              EasyLoading.showError('Please put email in the field');
            } else {
              try {
                EasyLoading.show(status: 'Sending request');
                await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                EasyLoading.showSuccess('Sent');
              } catch (e) {
                EasyLoading.showError('Failed');
              }
            }
          },
          child: const Text(
            "Ask to reset",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class RegisterOptionWidget extends HookWidget {
  const RegisterOptionWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? ", style: TextStyle(color: Colors.black38)),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            "Register",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
