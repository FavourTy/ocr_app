// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:orc_application/Screens/recognition_stage.dart';
import 'package:orc_application/Styles/colors.dart';

Future<String> imageCropperView(String? path, BuildContext context) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: path!,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: ProjectColors.pink,
          toolbarWidgetColor: ProjectColors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Cropper',
      ),
      WebUiSettings(
        context: context,
      ),
    ],
  );
  // ignore: unnecessary_null_comparison
  if (croppedFile != null) {
    return croppedFile.path;
  //Navigator.push(context, CupertinoPageRoute(builder: (context)=>RecognitionStage(path:croppedFile!.path)));
  } else {
    print("Do nothing");
    return "";
  }
}
