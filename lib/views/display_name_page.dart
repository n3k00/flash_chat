import 'package:flash_chat/controllers/display_name_controller.dart';
import 'package:flash_chat/resources/constants.dart';
import 'package:flash_chat/resources/dimens.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class DisplayNamePage extends StatelessWidget {
  static const String id = '/display_name';

  @override
  Widget build(BuildContext context) {
    final DisplayNameController displayNameController =
        Get.put(DisplayNameController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: displayNameController.showSpinner.value,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: MARGIN_XXLARGE,
              ),
              TextField(
                controller: displayNameController.nameController,
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your name",
                ),
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              RoundedButton(
                btnColor: Colors.lightBlueAccent,
                btnText: "Update Name",
                btnPress: () {
                  displayNameController.updateName();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
