import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/views/display_name_page.dart';
import 'package:flash_chat/views/home_page.dart';
import 'package:flash_chat/views/login_page.dart';
import 'package:flash_chat/views/signup_page.dart';
import 'package:flash_chat/views/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? WelcomePage.id
          : FirebaseAuth.instance.currentUser!.displayName == ''
              ? DisplayNamePage.id
              : HomePage.id,
      getPages: [
        GetPage(name: WelcomePage.id, page: () => WelcomePage()),
        GetPage(name: LoginPage.id, page: () => LoginPage()),
        GetPage(name: SignupPage.id, page: () => SignupPage()),
        GetPage(name: HomePage.id, page: () => HomePage()),
        GetPage(name: DisplayNamePage.id, page: () => DisplayNamePage()),
      ],
    );
  }
}
