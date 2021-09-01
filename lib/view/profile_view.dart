import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:projet_last/constace.dart';
import 'package:get/get.dart';
import 'package:projet_last/core/view_model/control_view_model.dart';
import 'package:projet_last/core/view_model/profile_view_model.dart';
import 'package:projet_last/view/auth/login_view.dart';

class ProfileView extends GetView<ControlViewModel> {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
          body: Center(
              child: FlatButton(
        child: Text('sign out'),
        color: primaryColor,
        onPressed: () {
          controller.signOut();
          Get.offAll(LoginView());
        },
      ))),
    );
  }
}
