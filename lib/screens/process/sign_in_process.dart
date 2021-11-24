import 'package:application/controllers/login_controller.dart';
import 'package:application/screens/sign_up/sign_up_screen.dart';
import 'package:application/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class SignInProcessScreen extends StatefulWidget {
  static String routeName = '/signInProcess';

  @override
  _SignInProcessScreenState createState() => _SignInProcessScreenState();
}

class _SignInProcessScreenState extends State<SignInProcessScreen> {
  final _loginServcie = Get.find<LoginService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _loginServcie.signInWithGoogle(),
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
                  Get.offAllNamed(WalletScreen.routeName);
                });
              } else {
                SchedulerBinding.instance?.addPostFrameCallback((_) {
                  Get.offAllNamed(AccountScreen.routeName);
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
