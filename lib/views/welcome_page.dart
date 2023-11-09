import 'package:flash_chat/resources/dimens.dart';
import 'package:flash_chat/views/login_page.dart';
import 'package:flash_chat/views/signup_page.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  static const String id = "/welcome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  height: WELCOM_SCREEN_LOGI_HEIGHT,
                  child: Image.asset("assets/images/logo.png"),
                ),
                Text(
                  "Flash Chat",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
            RoundedButton(
                btnColor: Colors.lightBlueAccent,
                btnText: "Log In",
                btnPress: () {
                  Navigator.pushNamed(context, LoginPage.id);
                }),
            RoundedButton(
                btnColor: Colors.blueAccent,
                btnText: "Sign Up",
                btnPress: () {
                  Navigator.pushNamed(context, SignupPage.id);
                }),
          ],
        ),
      ),
    );
  }
}
