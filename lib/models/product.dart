import 'package:flutter/material.dart';

/// Main model for all products in the app.
class Product {
  //todo: create notifier.
  final String id;
  final String title;
  final String brand;
  final String size;
  final String renter;
  final double pricePerDay; //* pricePerDay X numberOfdays = totalSum
  //! final DateTime daysRented;
  final String description;

  Product({
    @required this.id,
    @required this.title,
    @required this.brand,
    @required this.size,
    @required this.renter,
    @required this.pricePerDay,
    @required this.description,
  });
}
