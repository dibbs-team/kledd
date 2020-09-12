import 'package:flutter/material.dart';

class UploadTitle extends StatelessWidget {
  final String title;

  UploadTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
