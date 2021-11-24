import 'package:application/components/title_text.dart';
import 'package:application/screens/sign_up/components/password_form.dart';
import 'package:flutter/material.dart';
import 'package:application/constants.dart';
import 'package:application/size_config.dart';

class PasswordBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                TitleText(
                  title: "SIGN UP",
                  fontSize: 80,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Put Password", style: headingStyle),
                Text(
                  "Please enter your password.\n The ID must be a character consisting of \nalphabets and numbers of at least 4 characters and 20 characters.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                PasswordForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
