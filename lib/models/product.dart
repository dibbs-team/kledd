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
    return Product(
      id: snapshot.documentID,
      renter: snapshot.data['renter'],
      title: snapshot.data['title'],
      size: snapshot.data['size'],
      brand: snapshot.data['brand'],
      imageUrl: snapshot.data['image'],
      description: snapshot.data['description'],
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
