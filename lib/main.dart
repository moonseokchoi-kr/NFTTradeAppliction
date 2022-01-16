import 'package:application/controllers/item_controller.dart';
import 'package:application/controllers/login_controller.dart';
import 'package:application/controllers/maket_controller.dart';
import 'package:application/controllers/user_post_api_controller.dart';
import 'package:application/init/init.dart';
import 'package:application/route.dart';
import 'package:application/screens/home/home_screen.dart';
import 'package:application/screens/wallet/components/nft_detail_screen.dart';
import 'package:application/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('initApp');
  await initService();

  //Debug 전용
  //await Hive.box('initApp').clear();
  runApp(MyApp());
}

Future<void> initService() async {
  await Get.putAsync<LoginService>(() async => LoginService());
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
      routingCallback: (routing) {
        if (routing == null) return;
        if (routing.current == "/HomeScreen") {
          MarketController marketController = Get.put(MarketController());
          marketController.initPostList();
        } else if (routing.current == NFTDetailScreen.routeName) {
          UserPostController postController = Get.put(UserPostController());
          postController.initUserPostList();
        }
      },
    );
  }
}
