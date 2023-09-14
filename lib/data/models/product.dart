import 'dart:convert';
import 'package:e_commerce_app/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    bool isFavourite = false,
    int quantityInCart = 0,
  }) : super(
            id: id,
            title: title,
            price: price,
            description: description,
            category: category,
            image: image,
            isFavourite: isFavourite,
            quantityInCart: quantityInCart);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'] as String,
      price: map['price'] as double,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      quantityInCart: map['quantityInCart'] as int,
      isFavourite: map['isFavourite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
