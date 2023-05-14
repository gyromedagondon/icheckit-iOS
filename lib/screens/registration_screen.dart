import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/model/enums/enums.dart';
import 'package:icheckit_final/model/student.model.dart';
import 'package:icheckit_final/repositories/user_repository.dart';
import 'package:icheckit_final/reusable widgets/reusable_widgets.dart';
import 'package:icheckit_final/utils/Colors_utils.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        elevation: 0,
        title: const Text(
          "Registration",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [hexStringToColor("FFFDD1"), hexStringToColor("FFFDD1")],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: RegistrationForm(
              onSuccess: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class RegistrationForm extends HookWidget {
  const RegistrationForm({
    super.key,
    required this.onSuccess,
  });

  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final passwordTextController = useTextEditingController();
    final confirmpasswordTextController = useTextEditingController();
    final emailTextController = useTextEditingController();
    final firstnameTextController = useTextEditingController();
    final lastnameTextController = useTextEditingController();
    final sectionTextController = useTextEditingController();
    final contactTextController = useTextEditingController();

    final courseSelected = useState<String?>(null);

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
        child: Center(
          child: SizedBox(
            width: min(380, MediaQuery.of(context).size.width * 0.94),
            child: Column(
              children: <Widget>[
                registerTextField(
                  "Email",
                  Icons.mail,
                  false,
                  emailTextController,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.endsWith('@ust.edu.ph') ||
                        value.replaceAll('@ust.edu.ph', '').isEmpty ||
                        !validEmailRegex.hasMatch(value)) {
                      return 'Please enter proper email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                registerTextField("First name", Icons.person, false, firstnameTextController),
                const SizedBox(height: 10),
                registerTextField("Last name", Icons.person, false, lastnameTextController),
                const SizedBox(height: 10),
                // registerTextField("Course", Icons.person, false, courseTextController),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      labelText: 'Course',
                      labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.black12.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                      )),
                  value: courseSelected.value,
                  hint: const Text('Select course'),
                  items: [
                    ...[
                      'BS Computer Science',
                      'BS Information Technology',
                      'BS Information System',
                    ].map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    ),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value == null ? 'Please select course' : null,
                  onChanged: (value) {
                    if (value != null) courseSelected.value = value;
                  },
                ),
                const SizedBox(height: 10),
                registerTextField(
                    "Section", Icons.view_list_outlined, false, sectionTextController),
                const SizedBox(height: 10),
                registerTextField("Contact number", Icons.phone, false, contactTextController),
                const SizedBox(height: 10),
                registerTextField("Enter password", Icons.lock, true, passwordTextController),
                const SizedBox(height: 10),
                registerTextField(
                    "Confirm password", Icons.lock, true, confirmpasswordTextController),
                const SizedBox(height: 10),
                loginregisterButton(context, false, () async {
                  // Navigator.push(
                  // context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                  try {
                    if (formKey.currentState!.validate()) {
                      EasyLoading.show(
                          status: 'Creating user', maskType: EasyLoadingMaskType.black);

                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailTextController.text,
                        password: passwordTextController.text,
                      );

                      final thisuser = FirebaseAuth.instance.currentUser;
                      if (thisuser != null && courseSelected.value != null) {
                        EasyLoading.show(
                            status: 'Updating info', maskType: EasyLoadingMaskType.black);
                        await UserRepository(useruid: thisuser.uid).updateProfile(
                          thisuser.uid,
                          Student(
                            contactNumber: contactTextController.text,
                            course: courseSelected.value!,
                            email: thisuser.email ?? emailTextController.text,
                            firstName: firstnameTextController.text,
                            lastName: lastnameTextController.text,
                            section: sectionTextController.text,
                            createdAt: DateTime.now().toUtc(),
                            createdUsing: 'studentapp',
                            role: UserType.student,
                            uid: thisuser.uid,
                            displayName: '${firstnameTextController.text}'
                                ' '
                                '${lastnameTextController.text}',
                          ),
                        );

                        await thisuser.updateDisplayName(
                          '${firstnameTextController.text} ${lastnameTextController.text}',
                        );

                        EasyLoading.showSuccess('Registered!');

                        onSuccess();
                      } else {
                        throw 'Something failed';
                      }
                    } else {
                      EasyLoading.showError('Please fill form');
                    }
                  } on FirebaseAuthException catch (ex) {
                    debugPrint('error: $ex');
                    EasyLoading.showError(ex.message ?? ex.code);
                  } catch (e) {
                    debugPrint('error: $e');
                    EasyLoading.showError('Error');
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final validEmailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
