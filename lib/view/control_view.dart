import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/core/view_model/auth_view_model.dart';
import 'package:projet_last/core/view_model/control_view_model.dart';
import 'package:projet_last/view/auth/login_view.dart';
import 'package:projet_last/view/cart_view.dart';
import 'package:projet_last/view/home_view.dart';
import 'package:projet_last/view/profile_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                //backgroundColor: Colors.white,
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 5.0,
                offset: Offset(0.0, 0.0))
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    "Explorer",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/images/Icon_Explore.png',
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                )),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    "Panier",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/images/Icon_Cart.png',
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                )),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    "Profile",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/images/Icon_User.png',
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                )),
          ],
          currentIndex: controller.navigatorValue,
          onTap: (index) {
            controller.changeSelectedValue(index);
          },
          elevation: 0,
          selectedItemColor: Colors.black,
          //backgroundColor: Colors.grey.shade50,
        ),
      ),
    );
  }
}
