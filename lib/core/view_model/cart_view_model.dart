import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:projet_last/core/service/database/cart_database_helper.dart';
import 'package:projet_last/model/cart_product_model.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  var dbHelper = CartDatabaseHelper.db;

  double _totalPrice = 0.0;

  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;

    _cartProductModel = await dbHelper.getAllProduct();

    print(_cartProductModel.length);

    _loading.value = false;
    getTotalPrice();

    update();
  }

  getTotalPrice() async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
      print(totalPrice);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        update();
        return;
      }
    }
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice +=
        (double.parse(cartProductModel.price) * cartProductModel.quantity);

    update();
  }

  icreaseQuantity(int index) async {
    _cartProductModel[index].quantity++;

    _totalPrice += (double.parse(_cartProductModel[index].price) *
        _cartProductModel[index].quantity);
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity--;

    _totalPrice -= (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);

    update();
  }
}
