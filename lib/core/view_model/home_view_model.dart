import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:projet_last/core/service/home_service.dart';
import 'package:projet_last/model/category_model.dart';
import 'package:projet_last/model/product_model.dart';

class HomeViewModel extends GetxController {
  // final CollectionReference _categoryCollectionRef =
  //     FirebaseFirestore.instance.collection('categories');

  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  HomeViewModel() {
    getCategory();
    getBestSelling();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
        //print(_categoryModel.length);
        _loading.value = false;
      }

      update();
    });
  }

  getBestSelling() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()));
        print(_productModel.length);
        _loading.value = false;
      }
      update();
    });
  }
}
