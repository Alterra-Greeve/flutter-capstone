import 'package:flutter/widgets.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String image;
  final int quantity;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.quantity,
  });

  map(Builder Function(dynamic product) param0) {}

  static fromJson(json) {}
}
