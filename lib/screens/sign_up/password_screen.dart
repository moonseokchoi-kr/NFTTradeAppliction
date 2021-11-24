import 'package:application/screens/sign_up/components/passwrod_body.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatelessWidget {
  static String routeName = "/password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PasswordBody(),
    );
  }
}
