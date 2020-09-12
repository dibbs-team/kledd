import 'package:flutter/material.dart';

import '../../lang/my_localizations.dart';

class ProductDescription extends StatelessWidget {
  final String description;

  ProductDescription({
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyLocalizations.of(context).description,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).accentColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              description,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
