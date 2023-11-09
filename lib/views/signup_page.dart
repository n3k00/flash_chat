import 'package:flash_chat/resources/constants.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupPage extends StatelessWidget {
  static const String id = "/Signup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                  /*userEmail = value;*/
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter Your Email",
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  /*userPassword = value;*/
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter Your Password",
                ),
              ),
              SizedBox(height: 24),
              RoundedButton(
                  btnColor: Colors.blueAccent,
                  btnText: "Sign Up",
                  btnPress: () async {
                    /*print(userEmail);
                    print(userPassword);
                    setState(() {
                      showSpinner = true;
                    });
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
      ),
    );
  }
}
