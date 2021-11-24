import 'package:application/controllers/login_controller.dart';
import 'package:application/screens/sign_in/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class SignUpProcessScreen extends StatefulWidget {
  static String routeName = '/sign_up_process';

  @override
  _SignUpProcessScreenState createState() => _SignUpProcessScreenState();
}

class _SignUpProcessScreenState extends State<SignUpProcessScreen> {
  final _loginServcie = Get.find<LoginService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _loginServcie.signUpMoonstone(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
            } else {
              if (snapshot.data!) {
                SchedulerBinding.instance?.addPostFrameCallback((_) {
                  Get.offAllNamed(SignInScreen.routeName);
                });
              } else {
                SchedulerBinding.instance?.addPostFrameCallback((_) {
                  Get.defaultDialog();
                });
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
