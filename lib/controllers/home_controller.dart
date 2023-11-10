import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/views/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _auth = FirebaseAuth.instance;
  CollectionReference tickets =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController? messageTextController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    messageTextController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    messageTextController!.dispose();
  }

  void logoutAccount() {
    _auth.signOut();
    Get.offAllNamed(WelcomePage.id);
  }

  void sendMessage() {
    if (messageTextController!.text.isNotEmpty) {
      tickets.add({
        'sender': _auth.currentUser!.displayName,
        'sender_email': _auth.currentUser!.email,
        'text': messageTextController!.text,
        'timestamp': DateTime.now().toUtc().millisecondsSinceEpoch,
      });
    }
    messageTextController!.clear();
  }
}
