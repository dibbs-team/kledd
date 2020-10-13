import 'package:flutter_test/flutter_test.dart';

import 'package:kledd/models/clothing_size.dart';

void main() {
  group(
    'Constructor tests',
    () {
      test(
        'Can create clothing size from int',
        () {
          var size = ClothingSize.fromInt(42);
          expect(size.getSizeAsInt(), 42);
          expect(size.getSizeAsString(), '42');
        },
      );
      test(
        'Can create clothing size from string and cast to int',
        () {
          var size = ClothingSize.fromString('42');
          expect(size.getSizeAsInt(), 42);
          expect(size.getSizeAsString(), '42');
        },
      );
      test(
        'Can not cast string clothing size to int',
        () {
          var size = ClothingSize.fromString('forty-two');
          expect(size.getSizeAsInt(), null);
        },
      );
    },
  );
}
