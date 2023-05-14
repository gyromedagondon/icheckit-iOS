part of app_services;

class StorageService {
  const StorageService._();

  static final _storageReference = FirebaseStorage.instance;

  static UploadTask? uploadFileAsBytesWithMetadata(
    String storageFolder,
    String filename,
    Uint8List fileBytes,
    String contentType,
    Map<String, String> fileMetadata,
  ) {
    // Create your custom metadata.
    SettableMetadata metadata = SettableMetadata(
      contentType: contentType,
      customMetadata: fileMetadata,
    );

    try {
      // Pass metadata to any file upload method e.g putFile.
      return _storageReference
          .ref()
          .child(storageFolder)
          .child(filename)
          .putData(fileBytes, metadata);
    } on firebase_core.FirebaseException catch (fex) {
      // e.g, e.code == 'canceled'
      debugPrint('storage service > upload > ferr > $fex');
      return null;
    }
  }

  static UploadTask? uploadFileWithMetadata(
    String storageFolder,
    String filename,
    String filePath,
    String contentType,
    Map<String, String> fileMetadata,
  ) {
    try {
      final fileref = _storageReference.ref().child(storageFolder);
      File file = File(filePath);

      // Create your custom metadata.
      SettableMetadata metadata = SettableMetadata(
        contentType: contentType,
        customMetadata: fileMetadata,
      );

      // Pass metadata to any file upload method e.g putFile.
      return fileref.child(filename).putFile(file, metadata);
    } on firebase_core.FirebaseException catch (fex) {
      // e.g, e.code == 'canceled'
      debugPrint('storage service > upload > ferr > $fex');
      return null;
    } catch (ex) {
      debugPrint('uploadFileWithMetadata $ex');
      return null;
    }
  }

  static Future<ListResult?> getFilesInFolder(
    String folder,
  ) async {
    try {
      // Pass metadata to any file upload method e.g putFile.
      return await _storageReference.ref().child(folder).listAll();
    } on firebase_core.FirebaseException catch (fex) {
      // e.g, e.code == 'canceled'
      debugPrint('storage service > listUploads > ferr > $fex');
      return Future.value(null);
    }
  }

  static Future<ListResult?> deleteFileInFolder(
    String folder,
  ) async {
    try {
      // Pass metadata to any file upload method e.g putFile.
      return await _storageReference.ref().child(folder).listAll();
    } on firebase_core.FirebaseException catch (fex) {
      // e.g, e.code == 'canceled'
      debugPrint('storage service > listUploads > ferr > $fex');
      return Future.value(null);
    }
  }

  static Future<bool?> deleteFile(
    String path,
  ) async {
    try {
      // Pass metadata to any file upload method e.g putFile.
      await _storageReference.ref().child(path).delete();
      return Future.value(true);
    } on firebase_core.FirebaseException catch (fex) {
      // e.g, e.code == 'canceled'
      debugPrint('storage service > listUploads > ferr > $fex');
      return Future.value(false);
    }
  }
}
