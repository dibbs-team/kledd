import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String title;
  final String imageUrl;
  final String brand;
  final String size;

  Product({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.brand,
    @required this.size,
  });

  /// Creates a product from a documentSapshot (result of query from Firestore).
  static Product fromSnapshot(DocumentSnapshot snapshot) {
    return Product(
      id: snapshot.documentID,
      title: snapshot.data['title'],
      // TODO: Replace the following with actual data from the server.
      size: "Size",
      brand: "Brand",
      imageUrl:
          "https://www.lulus.com/images/product/xlarge/3301380_667902.jpg",
    );
  }
}
