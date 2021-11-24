import 'package:application/components/title_text.dart';
import 'package:application/controllers/login_controller.dart';
import 'package:application/screens/process/sign_in_process.dart';
import 'package:flutter/material.dart';

import 'package:application/components/socal_card.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingInWidget();
  }
}

class SingInWidget extends StatelessWidget {
  const SingInWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                TitleText(
                  title: "MOONWALLET",
                  fontSize: 80,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () => Get.offNamed(SignInProcessScreen.routeName),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      //press: loginService.signInWithGoogle(),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      //press: loginService.signInWithGoogle(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
