import 'package:flutter/material.dart';

abstract class UploadStep extends StatelessWidget {
  UploadStep(int step);

  /// Validates that all forms are filled correctly.
  bool validate();

  @override
  Widget build(BuildContext context);
}
