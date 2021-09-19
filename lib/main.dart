import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:path/path.dart';
import 'package:projet_last/core/view_model/cart_view_model.dart';
import 'package:projet_last/view/checkout/checkout_view.dart';

import 'package:projet_last/view/control_view.dart';
import 'package:projet_last/view/splash.dart';
import 'helper/binding.dart';

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
          body: _auth.currentUser == null ? IntroScreen() : ControlView()
          //body: ControlView(),
          ),
      theme: ThemeData(
        fontFamily: 'SourceSans',
      ),
    );
  }
}
