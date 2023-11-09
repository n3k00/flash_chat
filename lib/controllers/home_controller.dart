import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/views/welcome_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _auth = FirebaseAuth.instance;

  void logoutAccount() {
    _auth.signOut();
    Get.offAllNamed(WelcomePage.id);
  }
}
