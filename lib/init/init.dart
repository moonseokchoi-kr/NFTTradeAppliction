import 'package:application/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../size_config.dart';

class InitScreen extends StatefulWidget {
  static String routeName = "/init";

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final loginService = Get.find<LoginService>();
    return FutureBuilder(
      future: loginService.checkSignedIn(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error Processing: ${snapshot.error}");
        }
        if (snapshot.hasData) {
          SchedulerBinding.instance!.addPostFrameCallback((_) {
            Get.off(snapshot.data);
          });
        }
        return LodingWidget();
      },
    );
  }
}

class LodingWidget extends StatelessWidget {
  const LodingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
