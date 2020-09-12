import 'package:flutter/material.dart';

class DescriptionDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).accentColor,
      endIndent: 10,
      indent: 10,
    );
  }
}
