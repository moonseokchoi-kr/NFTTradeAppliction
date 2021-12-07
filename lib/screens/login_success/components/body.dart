import 'package:application/constants.dart';
import 'package:application/screens/sign_in/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:application/components/default_button.dart';
import 'package:application/size_config.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final address = Hive.box('initApp').get('user_wallet') != null
        ? Hive.box('initApp').get('user_wallet')
        : "";
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Text(
          "SignUp Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(90),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Expanded(
          child: Text(
            "wallet Address : ${address}",
            style: TextStyle(color: kTextColor, fontSize: 12),
          ),
        ),
        Spacer(),
        Expanded(
          child: Center(
            child: QrImage(
              data: "https://baobab.scope.klaytn.com/account/" + address,
              size: SizeConfig.screenHeight * 0.2,
            ),
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to SignIn",
            press: () {
              Get.offNamed(SignInScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
