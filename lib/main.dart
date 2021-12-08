import 'package:application/controllers/login_controller.dart';
import 'package:application/init/init.dart';
import 'package:application/route.dart';
import 'package:application/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await initService();
  await Hive.initFlutter();
  await Hive.openBox('initApp');
  //Debug 전용
  //await Hive.box('initApp').clear();
  runApp(MyApp());
}

Future<void> initService() async {
  await Get.putAsync<LoginService>(() async => await LoginService());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NFT Trade',
      theme: theme(),
      initialRoute: InitScreen.routeName,
      getPages: routes,
    );
  }
}
