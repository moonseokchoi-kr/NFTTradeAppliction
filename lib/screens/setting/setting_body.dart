import 'package:application/components/default_button.dart';
import 'package:application/controllers/item_api_controller.dart';
import 'package:application/controllers/login_controller.dart';
import 'package:application/screens/sign_in/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingBody extends StatelessWidget {
  final _loginService = Get.find<LoginService>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultButton(
              text: "Sign Out",
              press: () {
                _loginService.signOut();
                Get.offAllNamed(SignInScreen.routeName);
              },
              radius: 15,
            )
          ],
        ),
      ),
    );
  }
}
