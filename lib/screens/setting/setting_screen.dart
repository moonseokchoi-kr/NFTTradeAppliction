import 'package:application/components/coustom_bottom_nav_bar.dart';
import 'package:application/enums.dart';
import 'package:application/screens/setting/setting_body.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static String routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.setting),
    );
  }
}
