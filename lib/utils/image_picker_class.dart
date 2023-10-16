import 'dart:math';

import 'package:image_picker/image_picker.dart';

Future<String> pickImage() async {
  final picker = ImagePicker();
  String path = "";
  try {
    // ignore: unused_local_variable
    final getImage = await picker.pickImage(source: ImageSource.camera);
    if (getImage != null) {
      path = getImage.path;
    }
  } catch (e) {
    print(e);
  }
  return path;
}

Future<String> pickImageGallery() async {
  final picker = ImagePicker();
  String path = "";
  try {
    // ignore: unused_local_variable
    final getImage = await picker.pickImage(source: ImageSource.gallery);
    if (getImage != null) {
      path = getImage.path;
    }
  } catch (e) {
    print(e);
  }
  return path;
}
