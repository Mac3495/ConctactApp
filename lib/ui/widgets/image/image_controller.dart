import 'dart:io';

import 'package:flutter/material.dart';
import '../../../core/utils/image.dart' as img;

class ImageController extends ChangeNotifier {
  ImageController({String? url, this.ratioX = 1,  this.ratioY =1} ){
    imageUrl = url;
  }
  String? imageUrl;
  File? imageFile;
  final double ratioX;
  final double ratioY;

  bool get isEmpty => imageFile == null && imageUrl == null;

  void setImageUrl(String newUrl){
    imageUrl = newUrl;
    notifyListeners();
  }

  void setImageFile(File newImageFile){
    imageFile = newImageFile;
    notifyListeners();
  }

  void selectImage(img.SelectImage type)async{
    final newFile = await img.getImage(type, ratioX: ratioX, ratioY: ratioY);
    if(newFile!= null){
      imageFile = newFile;
      notifyListeners();
    }
  }
  
  void resetImage(){
    imageFile = null;
    notifyListeners();
  }
}