import 'package:flutter/material.dart';
import 'package:orc_application/Styles/colors.dart';

void imagePickerModalSheet(
  BuildContext context, {
  required VoidCallback? onCameraTap,
  required VoidCallback? onGalleryTap,
}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 200,
          child: Column(
            children: [
              GestureDetector(
                onTap: onCameraTap,
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: ProjectColors.pink),
                    child: const Text(
                      "Camera",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: onGalleryTap,
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: ProjectColors.pink),
                    child: const Text(
                      "Gallery",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      });
}
