import 'package:flutter_test/flutter_test.dart';

import 'package:kledd/models/product.dart';

void main() {
  group(
    'Convertion tests',
    () {
      String renter = '<renter>';
      String title = '<title>';
      String imageUrl = '<imageUrl>';
      String brand = '<brand>';
      String size = '<size>';
      String description = '<description>';
      double price = 42.7;
      String rentingRules = '<rentingRules>';

      test(
        'generateAddData should output an object for Firestore',
        () {
          expect(
            Product.generateAddData(
              renter: renter,
              title: title,
              imageUrl: imageUrl,
              brand: brand,
              size: size,
              description: description,
              price: price,
              rentingRules: rentingRules,
            ),
            {
              'renter': renter,
              'title': title,
              'image': imageUrl,
              'brand': brand,
              'size': size,
              'description': description,
              'price': price,
              'rules': rentingRules,
            },
          );
        },
      );
    },
  );
}
