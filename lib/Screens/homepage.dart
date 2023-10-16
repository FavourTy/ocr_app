import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orc_application/Screens/recognition_stage.dart';
import 'package:orc_application/Styles/colors.dart';
import 'package:orc_application/Widgets/custom_button.dart';
import 'package:orc_application/Widgets/modal_dialog.dart';
import 'package:orc_application/utils/image_cropper.dart';
import 'package:orc_application/utils/image_picker_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.pink,
      appBar: AppBar(
        backgroundColor: ProjectColors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Optical Recognition Application",
          style: TextStyle(
            color: ProjectColors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
                child: CustomButton(
                  onpress: () {
                    imagePickerModalSheet(context, onCameraTap: () {
                      pickImage().then((value) {
                        if (value != "") {
                          imageCropperView(value, context).then((value) {
                            if (value != "") {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          RecognitionStage(path: value)));
                            }
                          });
                        }
                      });
                    }, onGalleryTap: () {
                      pickImageGallery().then((value) {
                        if (value != "") {
                          imageCropperView(value, context).then((value) {
                            if (value != "") {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          RecognitionStage(path: value)));
                            }
                          });
                        }
                      });
                    });
                  },
                  buttonColor: ProjectColors.pink,
                  buttonText: "Scan Image",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
