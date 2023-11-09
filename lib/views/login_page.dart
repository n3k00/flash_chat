import 'package:flash_chat/resources/constants.dart';
import 'package:flash_chat/resources/dimens.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  static const String id = "/login";

  @override
  Widget build(BuildContext context) {
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
                  height: 200.0,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  /*email = value;*/
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your email",
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  /*password = value;*/
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your password",
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  btnColor: Colors.lightBlueAccent,
                  btnText: "Log In",
                  btnPress: () async {
                    /*print(email);
                    print(password);*/
                    /*setState(() {
                      showSpinner = true;
                    });*/
                    /*try {
                      var user = await _auth.signInWithEmailAndPassword(
                          email: email!, password: password!);
                      Navigator.pushNamedAndRemoveUntil(context, ChatScreen.id,
                          (Route<dynamic> route) => false);
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
      ),
    );
  }
}
