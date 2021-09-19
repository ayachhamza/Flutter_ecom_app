import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:projet_last/helper/local_storage_data.dart';
import 'package:projet_last/model/user.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  UserModel get userModel => _userModel;
  UserModel _userModel;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _userModel = value;
    });
    _loading.value = false;
    update();
  }

  final LocalStorageData localStorageData = Get.find();

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }
}
