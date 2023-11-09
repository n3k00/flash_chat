import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/views/home_page.dart';
import 'package:flash_chat/widgets/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  var showSpinner = false.obs;
  final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController?.dispose();
    passwordController?.dispose();
  }

  void loginAccount() async {
    showSpinner(true);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController!.text,
        password: passwordController!.text,
      );
      showSpinner(false);
      if (credential.user!.emailVerified) {
        Get.offAllNamed(HomePage.id);
      } else {
        Get.dialog(ShowAlertDialog(
          title: "Verify email!",
          text: "Please verified your email",
        ));
      }
    } on FirebaseAuthException catch (e) {
      showSpinner(false);
      print(e.code);
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        print('No user found for that email.');
        Get.dialog(ShowAlertDialog(
          title: "Please login again!",
          text: "Email or password is incorrect",
        ));
      }
    } catch (e) {
      print("Catch Error");
      print(e);
    }
  }
}
