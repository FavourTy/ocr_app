import 'package:flutter/material.dart';

import '../Styles/colors.dart';

class RecognitionStage extends StatefulWidget {
  final String path;
  const RecognitionStage({required this.path,super.key});

  @override
  State<RecognitionStage> createState() => _RecognitionStageState();
}

class _RecognitionStageState extends State<RecognitionStage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.pink,
    );
  }
}
