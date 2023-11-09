import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color btnColor;
  final String btnText;
  final VoidCallback btnPress;

  RoundedButton({
    required this.btnColor,
    required this.btnText,
    required this.btnPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Material(
        elevation: 5,
        color: btnColor,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: btnPress,
          height: 42,
          minWidth: 200,
          child: Text(
            btnText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
