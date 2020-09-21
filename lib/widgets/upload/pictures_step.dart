import 'dart:io';

import 'package:flutter/material.dart';

import 'upload_step.dart';
import 'upload_title.dart';
import 'picture_selector.dart';
import '../../lang/my_localizations.dart';

// ignore: must_be_immutable
class PicturesStep extends UploadStep {
  final GlobalKey<PictureSelectorState> _key = GlobalKey();
  final int step;
  //* Image is mutable because we want to use it to save the image from the
  //* state of PictureSelector that we can later fetch from the parent.
  File image;

  PicturesStep(this.step) : super(step);

  @override
  bool validate() {
    // TODO: Communicate to user if validation fails.

    // Save image from pictureSelector.
    image = _key.currentState.image;

    return image != null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);
    return Column(
      children: [
        UploadTitle(l10n.picturesStepTitle(step)),
        PictureSelector(
          key: _key,
        ),
      ],
    );
  }
}
