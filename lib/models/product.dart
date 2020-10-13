import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './clothing_size.dart';

class Product {
  final String id;
  final String uploader;
  final String title;
  final String imageUrl;
  final String brand;
  final ClothingSize size;
  final String description;
  final double price;
  final String rentingRules;

  Product({
    @required this.id,
    @required this.uploader,
    @required this.title,
    @required this.imageUrl,
    @required this.brand,
    @required this.size,
    @required this.description,
    @required this.price,
    @required this.rentingRules,
  });

  /// Creates a product from a documentSnapshot (result of query from Firestore).
  static Product fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data();
    return Product(
      id: snapshot.id,
      uploader: data['uploader'],
      title: data['title'],
      size: ClothingSize.fromString(data['size']),
      brand: data['brand'],
      imageUrl: data['image'],
      description: data['description'],
      price: data['price'],
      rentingRules: data['rules'],
    );
  }

  /// Generates data for adding a product to Firestore.
  static Map<String, Object> generateAddData({
    @required String uploader,
    @required String title,
    @required String imageUrl,
    @required String brand,
    @required String size,
    @required String description,
    @required double price,
    @required String rentingRules,
  }) {
    return {
      'uploader': uploader,
      'title': title,
      'image': imageUrl,
      'brand': brand,
      'size': size,
      'description': description,
      'price': price,
      'rules': rentingRules,
    };
  }
}
