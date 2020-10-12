import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;

  User({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.rating,
  });

  /// Creates a user from a documentSapshot (result of query from Firestore).
  static User fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data();
    return User(
      id: snapshot.id,
      name: data['display_name'],
      imageUrl: data['profile_image_url'],
      rating: data['rating']?.toDouble(),
    );
  }
}
