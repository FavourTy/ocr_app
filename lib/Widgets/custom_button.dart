import 'package:flutter/material.dart';
import 'package:orc_application/Styles/colors.dart';

class CustomButton extends StatelessWidget {
  final buttonText;
  final buttonColor;
  final fontSize;
  final VoidCallback? onpress;
  final textColor;
  final centerText;
  final padding ;

  const CustomButton(
      {super.key,
      required this.onpress,
      this.buttonText,
      this.buttonColor,
      this.fontSize = 16,
      this.centerText,
      this.textColor = ProjectColors.white,
       this.padding = const EdgeInsets.symmetric(vertical: 25),
      });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onpress,
    child: Container(
      alignment: Alignment.center,
      padding: padding,
         decoration: BoxDecoration(
          color: buttonColor,
         ),
         child: Text(buttonText,
         style: TextStyle(color: textColor,
         fontSize: fontSize,
         fontWeight: FontWeight.w500
         ),
         ),
    ),
    );
  }
}
