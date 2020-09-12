import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductPriceAndAvailability extends StatelessWidget {
  final Product product; 

  ProductPriceAndAvailability({
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlatButton(
            child: Container(
              padding: const EdgeInsets.all(10),
              // TODO: Change "Add dates for price" to the appropriet price 
              // based on the number of days * price
              // This might mean that this class should be a statful widget instead of the 
              // current implementation.
              child: Text(
                "Add dates for price",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 16,
                ),
              ),
            ),
            onPressed: () {},
            padding: const EdgeInsets.all(10),
          ),
    
          FlatButton(
            child: Text(
              "check availability",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onPressed: () {},
            padding: const EdgeInsets.all(10),
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
