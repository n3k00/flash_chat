import 'package:flash_chat/controllers/login_controller.dart';
import 'package:flash_chat/resources/constants.dart';
import 'package:flash_chat/resources/dimens.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  static const String id = "/login";

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: "logo",
                child: SizedBox(
                  height: LOGIN_AND_SIGNUP_LOGO_HEIGHT,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              SizedBox(
                height: MARGIN_XXLARGE,
              ),
              TextField(
                controller: loginController.emailController,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your email",
                ),
              ),
              SizedBox(
                height: MARGIN_MEDIUM,
              ),
              TextField(
                controller: loginController.passwordController,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your password",
                ),
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              RoundedButton(
                btnColor: Colors.lightBlueAccent,
                btnText: "Log In",
                btnPress: () async {
                  loginController.loginAccount();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
