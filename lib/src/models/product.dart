import 'package:flutter/material.dart';

class Product {
  final int id;
  final int size;
  final Color color;
  final double price;
  final String image;
  final String description;
  final String title;

  Product(
      {this.id,
      this.size,
      this.color,
      this.price,
      this.image,
      this.description,
      this.title});
}
