import 'package:flutter/material.dart';
import 'package:projet_last/helper/extenstion.dart';

class ProductModel {
  String productId, name, image, description, sized, price, categoryId;
  Color color;

  ProductModel(
      {this.productId,
      this.name,
      this.image,
      this.description,
      this.color,
      this.sized,
      this.categoryId,
      this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    categoryId = map['categoryId'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'categoryId': categoryId,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
      'productId': productId,
    };
  }
}
