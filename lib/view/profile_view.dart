import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:projet_last/core/view_model/control_view_model.dart';

class ProfileView extends GetView<ControlViewModel> {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('hello from profile'),
    ));
  }
}
