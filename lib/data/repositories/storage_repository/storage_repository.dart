import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

import 'istorage_repository.dart';

class StorageRepository extends IStorageRepository {

  final _storage = FirebaseStorage.instance;

  @override
  Future<String> uploadImage(File image,
      {String directory = 'userImage'}) async {
    final reference =
        _storage.ref().child(directory).child(DateTime.now().toString());
    UploadTask uploadTask = reference.putFile(image);
    await uploadTask;
    String url = await uploadTask.snapshot.ref.getDownloadURL();
    return url;
  }

  @override
  Future<void> deleteImageFromUrl(
    String url,
  ) async {
    final fileUrl = Uri.decodeFull(Path.basename(url))
        .replaceAll(RegExp(r'(\?alt).*'), '');
    await _storage.ref().child(fileUrl).delete();
  }
}