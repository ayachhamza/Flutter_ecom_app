import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projet_last/core/service/firestore_user.dart';
import 'package:projet_last/model/user.dart';
import 'package:projet_last/view/auth/login_view.dart';
import 'package:projet_last/view/control_view.dart';
import 'package:projet_last/view/home_view.dart';
import 'package:projet_last/helper/local_storage_data.dart';
import 'package:flutter/services.dart';

class AuthViewModel extends GetxController {
  String email = '', password = '', name = '';

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
    'email',
  ]);

  FirebaseAuth _auth = FirebaseAuth.instance;
  //FacebookLogin _facebookLogin = FacebookLogin();

  Rxn<User> _user = Rxn<User>();

  String get user => _user.value?.email;
  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser.uid);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSignInMethode() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(googleUser);

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.off(ControlView());
    });
  }

  // void facebookSignInMethode() async {
  //   FacebookLoginResult result = await _facebookLogin.logIn(
  //     ['email'],
  //   );
  //   final accessToken = result.accessToken.token;

  //   if (result.status == FacebookLoginStatus.loggedIn) {
  //     final faceCredential = FacebookAuthProvider.credential(accessToken);
  //     await _auth.signInWithCredential(faceCredential);
  //   }
  // }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        getCurrentUserData(value.user.uid);
      });
      Get.offAll(ControlView());
    } catch (e) {
      print('error caught: $e');

      Get.snackbar(
        "Erour de l'authentification ",
        "$e",
        colorText: Colors.white,
        backgroundColor: Colors.red[400],
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
        //print(email);
      });

      Get.offAll(ControlView());
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error login account',
        '$e',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user.uid,
      email: user.user.email,
      name: name == null ? user.user.displayName : name,
      pic: '',
    );
    await FireStoreUser().addUserToFirestore(userModel);
    setUser(userModel);
  }

  void getCurrentUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data()));
    });
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
