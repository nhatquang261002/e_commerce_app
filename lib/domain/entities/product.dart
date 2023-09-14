// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:isar/isar.dart';

part 'product.g.dart';

@collection
class ProductEntity {
  final Id isarId;
  bool? isFavourite;
  int? quantityInCart;
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  @ignore
  final Rating? rating;
  ProductEntity(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.isFavourite,
      this.quantityInCart,
      this.rating})
      : isarId = id!;
}

class Rating {
  num? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'count': count,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: map['rate'] != null ? map['rate'] as num : null,
      count: map['count'] != null ? map['count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());
}
