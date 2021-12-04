import 'package:emotion_chat/utils/presentation/consts/colors.dart';
import 'package:emotion_chat/utils/presentation/core/dialog_item.dart';
import 'package:flutter/material.dart';

class Utils {
  static addPhotoDialog(
    BuildContext context, {
    required VoidCallback onCameraTap,
    required VoidCallback onGalleryTap,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onGalleryTap,
                  child: DialogItem(
                    sideWidth: 80,
                    icon: Icons.image,
                    text: 'Gallery',
                    backgroundColor: whiteColor,
                    iconColor: mBlack,
                    textColor: mBlack,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: onCameraTap,
                  child: DialogItem(
                    sideWidth: 80,
                    icon: Icons.camera,
                    text: 'Camera',
                    backgroundColor: whiteColor,
                    iconColor: mBlack,
                    textColor: mBlack,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
