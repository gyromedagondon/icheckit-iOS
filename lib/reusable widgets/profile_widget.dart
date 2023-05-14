import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icheckit_final/core/auth/auth.dart';
import 'package:icheckit_final/repositories/user_repository.dart';
import 'package:icheckit_final/services/app_services.dart';
import 'package:icheckit_final/utils/get_mime_type.dart';

import '../states/student.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({Key? key, required this.imagePath, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
        child: Stack(children: <Widget>[
      buildImage(),
      Positioned(
        bottom: 0,
        right: 4,
        child: buildEditIcon(color),
      ),
    ]));
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: const UpdatePhotoUrlButton(),
      );
}

class UpdatePhotoUrlButton extends ConsumerWidget {
  const UpdatePhotoUrlButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(authStateChangesProvider);
    final userprofile = ref.watch(studentProfileProvider).asData?.value;

    return buildCircle(
      color: user.asData?.value == null ? Colors.grey.shade400 : Colors.red,
      all: 0,
      child: IconButton(
        visualDensity: VisualDensity.compact,
        iconSize: 20,
        onPressed: user.maybeWhen(
          orElse: () => null,
          data: (data) {
            if (data == null || userprofile == null) return null;
            return () async {
              try {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                    withData: true,
                    type: FileType.custom,
                    allowedExtensions: ['png', 'jpg', 'jpeg', 'bmp', 'webp']);

                if (result != null) {
                  EasyLoading.show(
                    status: 'Uploading and Changing Photo',
                    maskType: EasyLoadingMaskType.black,
                  );
                  PlatformFile firstfile = result.files.first;

                  final firstbytes = firstfile.bytes;
                  if (firstbytes != null) {
                    final upload = StorageService.uploadFileAsBytesWithMetadata(
                        '/studentuploads'
                            '/${data.uid}',
                        'new_account_photo',
                        firstbytes,
                        getMimeType(firstfile.extension),
                        {'filename': 'new_account_photo'});

                    if (upload != null) {
                      await upload.then((snapshot) async {
                        final url = await snapshot.ref.getDownloadURL();
                        await data.updatePhotoURL(url);
                        await UserRepository(useruid: data.uid).updateProfile(
                          data.uid,
                          userprofile.copyWith(
                            photoUrl: url,
                            // updatedAt: DateTime.now().toUtc(),
                            // updatedBy: data.uid,
                          ),
                        );
                        ref.invalidate(authStateChangesProvider);
                        EasyLoading.showSuccess('Done!');
                      });
                    }
                  } else {
                    debugPrint('error > no byte');
                    throw 'NoByte';
                  }
                } else {
                  // User canceled the picker
                  EasyLoading.showInfo('Cancelled');
                }
              } on FirebaseAuthException catch (faex) {
                debugPrint('error > upload profile > FirebaseAuthException > $faex');
                EasyLoading.showError('Firebase Auth Exception\n${faex.code}');
              } on PlatformException catch (pex) {
                debugPrint('error > upload profile > PlatformException > $pex');
                EasyLoading.showError('PlatformException\n${pex.code}');
              } catch (e) {
                debugPrint('error > upload profile > catch > $e');
                EasyLoading.showError('An error occured\n$e');
              }
            };
          },
        ),
        splashColor: Colors.white,
        icon: const Icon(
          Icons.edit,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}

Widget buildCircle({
  required Widget child,
  required double all,
  required Color color,
}) =>
    ClipOval(
        child: Container(
      padding: EdgeInsets.all(all),
      color: color,
      child: child,
    ));
