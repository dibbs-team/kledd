import 'package:flutter/material.dart';

import 'upload_step.dart';
import 'upload_title.dart';
import '../../lang/my_localizations.dart';

class PicturesStep extends UploadStep {
  final int step;

  PicturesStep(this.step) : super(step);

  String get imageUrl =>
      "https://www.lulus.com/images/product/xlarge/3301380_667902.jpg";

  @override
  bool validate() {
    // TODO: implement validate
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);
    return Column(
      children: [
        UploadTitle(l10n.picturesStepTitle(step)),
      ],
    );
  }
}
