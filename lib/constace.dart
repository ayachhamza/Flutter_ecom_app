import 'package:flutter/material.dart';
import 'dart:ui';

const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  DeliveryTime,
  AddAddress,
  Summary,
}
final String tableCartProduct = 'cartProduct';
final String columnName = 'name';
final String columnImage = 'image';
final String columnQuantity = 'quantity';
final String columnPrice = 'price';
final String columnProductId = 'productId';

const primaryColor = Color.fromRGBO(255, 193, 7, 1);
const primaryColor2 = Color.fromRGBO(0, 197, 105, 1);

const CACHED_USER_DATA = 'CACHED_USER_DATA';
// const flatButtonStyle = TextButton.styleFrom(
//   minimumSize: Size(_width, _height),
//   backgroundColor: background,
//   padding: EdgeInsets.all(0),
// );
