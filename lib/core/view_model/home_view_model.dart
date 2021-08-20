import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:projet_last/view/cart_view.dart';
import 'package:projet_last/view/home_view.dart';
import 'package:projet_last/view/profile_view.dart';

class HomeViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget _currentScreen = HomeView();

  get navigatorValue => _navigatorValue;

  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }

      case 1:
        {
          _currentScreen = CartView();
          break;
        }

      case 2:
        {
          _currentScreen = ProfileView();
          break;
        }
      default:
    }
    update();
  }
}
