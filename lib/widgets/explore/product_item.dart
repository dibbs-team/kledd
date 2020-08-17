import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  String title;

  ProductItem(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: Implement.
    return ListTile(
      title: Text(title),
    );
  }
}
