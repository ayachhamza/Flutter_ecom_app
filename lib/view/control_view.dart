import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:projet_last/core/view_model/auth_view_model.dart';
import 'package:projet_last/view/auth/login_view.dart';
import 'package:projet_last/view/home_view.dart';

class controlView extends StatelessWidget {
  const controlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? HomeView()
          : LoginView();
    });
  }
}
