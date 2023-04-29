import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

enum SelectImage { camera, gallery }

Future<File?> getImage(SelectImage type,
    {double ratioX = 1, double ratioY = 1}) async {
  try {
    if (type == SelectImage.camera) {
      final picker = ImagePicker();
      XFile? pickedFile = await picker.pickImage(
        source: type == SelectImage.camera
            ? ImageSource.camera
            : ImageSource.gallery,
      );
      if (pickedFile != null) {
        final image = await File(pickedFile.path);

        if (image != null) {
          final imageCompress = await compressImage(image);
          return imageCompress;
        }
      }
    } else {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);

      if (result != null) {
        if (result.files.single.path!.contains('.gif') ||
            result.files.single.path!.contains('.svg')) return null;

        final image = await File(result.files.single.path!);
        if (image != null) {
          final imageCompress = await compressImage(image);
          return imageCompress;
        }
      }
    }
    return null;
  } catch (e) {
    debugPrint(e.toString());
    return null;
  }
}

Future<File> compressImage(File file) async {
  final peso = file.lengthSync();
  if (peso <= 300000) return file;
  int quality;

  if (peso < 130000) {
    return file;
  } else if (peso < 290000) {
    quality = 90;
  } else if (peso < 1000000) {
    quality = 70;
  } else if (peso < 1200000) {
    quality = 65;
  } else if (peso < 1400000) {
    quality = 70;
  } else if (peso < 1600000) {
    quality = 51;
  } else if (peso < 1800000) {
    quality = 40;
  } else if (peso < 2000000) {
    quality = 35;
  } else if (peso < 5000000) {
    quality = 30;
  } else if (peso < 6000000) {
    quality = 25;
  } else if (peso < 7000000) {
    quality = 20;
  } else if (peso < 8000000) {
    quality = 15;
  } else if (peso < 10000000) {
    quality = 15;
  } else if (peso < 16000000) {
    quality = 15;
  } else {
    quality = 1;
  }

  final dir = await path_provider.getTemporaryDirectory();
  final dateTime = DateTime.now();
  final targetPath = "${dir.absolute.path}/${dateTime.toString().replaceAll(' ', '.')}_${peso.toString()}.jpg";
  final result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: quality.round(),
  );
  return result!;
}
