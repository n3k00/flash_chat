import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/views/login_page.dart';
import 'package:flash_chat/widgets/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
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

  void signupAccount() async {
    try {
      showSpinner(true);
      print("Hell Create Account");
      final credential = await _auth.createUserWithEmailAndPassword(
        email: emailController!.text,
        password: passwordController!.text,
      );
      print("Hell Created Account");
      showSpinner(false);
      Get.offNamed(LoginPage.id);
      await credential.user?.sendEmailVerification();
      Get.snackbar(
        "Please verified your email",
        "Sent verification email to your mail.",
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black26,
      );
    } on FirebaseAuthException catch (e) {
      showSpinner(false);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.dialog(
          ShowAlertDialog(
            title: 'Please signup again!',
            text: 'The password is too weak!',
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.dialog(
          ShowAlertDialog(
            title: 'Please signup again!',
            text: 'The account already exists for that email !',
          ),
        );
      }
    } catch (e) {
      print("Catch Error");
      print(e);
    }
  }
}
