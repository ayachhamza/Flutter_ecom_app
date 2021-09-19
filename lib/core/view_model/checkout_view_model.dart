import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/view/checkout/add_address_widget.dart';
import 'package:projet_last/view/control_view.dart';

class CheckoutViewModel extends GetxController {
  int get index => _index;
  int _index = 0;

  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;

  String rue1, rue2, ville, region, pays;

  GlobalKey<FormState> formState = GlobalKey();

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (index < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  void changeIndex(int i) {
    _index = i;
    if (_index == 1) {
      _pages = Pages.AddAddress;
    } else if (_index == 2) {
      // formState.currentState.save();
      // if (formState.currentState.validate()) {}
      _pages = Pages.Summary;
    } else if (_index == 3) {
      Get.to(ControlView());
    }
    update();
  }
}
