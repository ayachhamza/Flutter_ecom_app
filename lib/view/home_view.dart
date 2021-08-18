import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/view/auth/login_view.dart';

class HomeView extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen '),
      ),
      body: Center(
        child: FlatButton(
          color: primaryColor2,
          textColor: Colors.white,
          child: Text("Sign Out"),
          onPressed: () {
            _auth.signOut();
            Get.offAll(LoginView());
          },
        ),
      ),
    );
  }
}
