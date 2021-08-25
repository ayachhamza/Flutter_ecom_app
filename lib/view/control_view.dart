import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:projet_last/core/view_model/auth_view_model.dart';
import 'package:projet_last/core/view_model/control_view_model.dart';
import 'package:projet_last/view/auth/login_view.dart';
import 'package:projet_last/view/cart_view.dart';
import 'package:projet_last/view/home_view.dart';
import 'package:projet_last/view/profile_view.dart';

class controlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  'Explorer',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  "assets/images/Icon_Explore.png",
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text('Cart',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  "assets/images/Icon_Cart.png",
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text('Compte',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  "assets/images/Icon_User.png",
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
          // if (index == 1) {
          //   Get.to(cartView());
          // }
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
