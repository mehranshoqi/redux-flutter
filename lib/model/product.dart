import 'package:flutter/foundation.dart';

@immutable
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imgUrl;
  final bool isFavorite;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imgUrl,
    this.isFavorite = false,
  });

  Product copyWith({
    int id,
    String title,
    String description,
    double price,
    String imgUrl,
    bool isFavorite,
  }) {
    return new Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      imgUrl: imgUrl ?? this.imgUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
