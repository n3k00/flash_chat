import 'package:flash_chat/controllers/signup_controller.dart';
import 'package:flash_chat/resources/constants.dart';
import 'package:flash_chat/resources/dimens.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupPage extends StatelessWidget {
  static const String id = "/Signup";
  final SignupController signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return ModalProgressHUD(
          inAsyncCall: signupController.showSpinner.value,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: LOGIN_AND_SIGNUP_LOGO_HEIGHT,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(
                  height: MARGIN_XXLARGE,
                ),
                TextField(
                  controller: signupController.emailController,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: "Enter Your Email",
                  ),
                ),
                SizedBox(height: MARGIN_MEDIUM),
                TextField(
                  controller: signupController.passwordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: "Enter Your Password",
                  ),
                ),
                SizedBox(height: 24),
                RoundedButton(
                    btnColor: Colors.blueAccent,
                    btnText: "Sign Up",
                    btnPress: () async {
                      signupController.signupAccount();
/*
                    try {
                      final newUser =
                      await _auth.createUserWithEmailAndPassword(
                        email: userEmail!,
                        password: userPassword!,
                      );
                      Navigator.pushNamedAndRemoveUntil(context,
                          ChatScreen.id, (Route<dynamic> route) => false);
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }*/
                    }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
