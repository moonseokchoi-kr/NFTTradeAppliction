import 'package:application/screens/splash/components/body.dart';
import 'package:application/size_config.dart';
import 'package:flutter/material.dart';
import '../../size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SplashBody(),
    );
  }
}
