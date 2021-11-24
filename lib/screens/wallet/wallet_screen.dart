import 'package:application/components/title_text.dart';
import 'package:application/theme.dart';
import 'package:flutter/material.dart';
import 'package:application/components/coustom_bottom_nav_bar.dart';
import 'package:application/enums.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../size_config.dart';
import 'components/body.dart';

class WalletScreen extends StatelessWidget {
  static String routeName = "/profile";
  DateTime preBackPress = DateTime.now();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: TitleText(
            title: "MOONWALLET",
            fontSize: 40,
          ),
          automaticallyImplyLeading: false,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          titleTextStyle: appBarTitleTheme(),
        ),
        body: Body(),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.wallet),
      ),
      onWillPop: () async {
        final timegap = DateTime.now().difference(preBackPress);
        final cantExit = timegap >= Duration(seconds: 2);
        preBackPress = DateTime.now();
        if (cantExit) {
          //show snackbar
          final snack = SnackBar(
            content: Text('Press Back button again to Exit'),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          Get.clearRouteTree();
          return false;
        } else {
          return true;
        }
      },
    );
  }
}
