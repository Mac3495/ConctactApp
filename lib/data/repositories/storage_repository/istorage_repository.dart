import 'dart:io';

abstract class IStorageRepository {
  Future<String> uploadImage(File image, {String directory = 'userImage'});
  Future<void> deleteImageFromUrl(String url);
}