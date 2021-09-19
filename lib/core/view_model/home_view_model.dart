import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:projet_last/core/service/home_service.dart';
import 'package:projet_last/model/category_model.dart';
import 'package:projet_last/model/product_model.dart';

import '../../globals.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  // List<ProductModel> get productModel2 => _productModel2;
  // List<ProductModel> _productModel2 = [];

  HomeViewModel() {
    //getProductsByCategory(globalInt);
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  // removeProCat() async {
  //   _loading.value = true;
  //   HomeService().getBestSelling().then((value) {
  //     for (int i = 0; i < value.length; i++) {
  //       _categoryModel.add(CategoryModel.fromJson(value[i].data()));
  //       _loading.value = false;
  //     }
  //     update();
  //   });
  // }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      // print(_productModel.length);
      update();
    });
  }

  // getProductsByCategory(String ts) async {
  //   _loading.value = true;
  //   HomeService().getTest(ts).then((value) {
  //     for (int i = 0; i < value.length; i++) {
  //       _productModel2.add(ProductModel.fromJson(value[i].data()));
  //       _loading.value = false;
  //       //print(_productModel2[i].name);
  //     }
  //     update();
  //   });
  // }
}
