import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String renter;
  final String title;
  final String imageUrl;
  final String brand;
  final String size;
  final String description;

  Product({
    @required this.id,
    @required this.renter,
    @required this.title,
    @required this.imageUrl,
    @required this.brand,
    @required this.size,
    @required this.description,
  });

  /// Creates a product from a documentSapshot (result of query from Firestore).
  static Product fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data();
    return Product(
      id: snapshot.id,
      renter: data['renter'],
      title: data['title'],
      size: data['size'],
      brand: data['brand'],
      imageUrl: data['image'],
      description: data['description'],
    );
  }

  /// Generates data for adding a product to Firestore.
  static Map<String, Object> generateAddData({
    @required renter,
    @required title,
    @required imageUrl,
    @required brand,
    @required size,
    @required description,
  }) {
    return {
      'renter': renter,
      'title': title,
      'image': imageUrl,
      'brand': brand,
      'size': size,
      'description': description,
    };
  }
}
