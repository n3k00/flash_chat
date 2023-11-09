import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/views/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DisplayNameController extends GetxController {
  var showSpinner = false.obs;
  TextEditingController? nameController;
  final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameController!.dispose();
  }

  void updateName() async {
    showSpinner(true);
    await _auth.currentUser?.updateDisplayName(nameController!.text);
    showSpinner(false);
    Get.offAllNamed(HomePage.id);
  }
}
