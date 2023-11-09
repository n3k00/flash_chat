import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String id = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flash Char"),
      ),
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
