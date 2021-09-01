import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:projet_last/helper/local_storage_data.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();
  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }
}
