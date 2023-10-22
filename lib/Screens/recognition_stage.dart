import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../Styles/colors.dart';

class RecognitionStage extends StatefulWidget {
  final String path;
  const RecognitionStage({required this.path, super.key});

  @override
  State<RecognitionStage> createState() => _RecognitionStageState();
}

class _RecognitionStageState extends State<RecognitionStage> {
  bool _isBusy = false;
  final TextEditingController _textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    final InputImage inputImage = InputImage.fromFilePath(widget.path);
    processStage(inputImage);
  }

  void processStage(InputImage image)async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    setState(() {
      _isBusy = true;
    });
     final RecognizedText recognizedText
      = await textRecognizer.processImage(image);
     _textController.text = recognizedText.text;
    //End body state
    setState(() {
      _isBusy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ProjectColors.pink,
        appBar: AppBar(
          backgroundColor: ProjectColors.white,
          title: const Text(
            "Recognition satge",
            style: TextStyle(fontSize: 20.0, color: ProjectColors.black),
          ),
          centerTitle: true,
        ),
        body: _isBusy == true
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  controller: _textController,
                  maxLines: MediaQuery.of(context).size.height.toInt(),
                  decoration: const InputDecoration(hintText: "Text goes  here"),
                )));
  }
}
