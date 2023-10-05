import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageContainer extends StatefulWidget {
  const ImageContainer({
    super.key,
  });

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  XFile? selectedImage;
  @override
  Widget build(BuildContext context) {
    var imagePicker = ImagePicker();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (selectedImage != null)
            InkWell(
              child: ClipRRect(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.file(
                    File(selectedImage!.path),
                    fit: BoxFit.cover,
                  ),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              onDoubleTap: () {
                selectedImage = null;
                setState(() {});
              },
            )
          else
            InkWell(
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(16)),
              ),
              onTap: () async {
                var image =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  selectedImage = image;
                  setState(() {});
                } else {
                  print("no image");
                }
              },
            )
        ],
      ),
    );
  }
}
