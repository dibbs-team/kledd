import 'package:flutter/material.dart';

import '../../lang/my_localizations.dart';

class ProductRentingRules extends StatelessWidget {
  final String rentingRules;

  ProductRentingRules({
    @required this.rentingRules,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyLocalizations.of(context).rentingRules,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).accentColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            rentingRules,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
