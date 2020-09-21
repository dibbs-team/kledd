import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PictureSelector extends StatefulWidget {
  PictureSelector({Key key}) : super(key: key);

  @override
  PictureSelectorState createState() => PictureSelectorState();
}

class PictureSelectorState extends State<PictureSelector> {
  File image;
  final picker = ImagePicker();

  Future<void> _takePicture(ImageSource method) async {
    final imageFile = await picker.getImage(
      source: method,
      maxHeight: 1600,
      maxWidth: 1200,
    );

    if (imageFile != null) {
      //* imageFile can be null when the user for example cancels.
      setState(() {
        image = File(imageFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        image == null
            ? Container()
            : Container(
                child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: FittedBox(
                    child: Image.file(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        // TODO: Replace buttons according to design.
        RaisedButton(
          child: Text("Take picture"),
          onPressed: () => _takePicture(ImageSource.camera),
        ),
        RaisedButton(
          child: Text("Pick from gallery"),
          onPressed: () => _takePicture(ImageSource.gallery),
        ),
      ],
    );
  }
}
