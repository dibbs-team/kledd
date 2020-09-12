import 'package:flutter/material.dart';

class ProductRenter extends StatelessWidget {
  final String renter;

  ProductRenter({
    @required this.renter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // TODO: If picture of renter is available show this instead of icon.
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.account_circle,
              size: 60,
              color: Theme.of(context).accentColor,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  renter,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Theme.of(context).accentColor,
                    ),
                    // TODO: change this number to actual rating of the renter
                    Text("4.62"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
