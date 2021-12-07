import 'package:application/screens/cart/cart_screen.dart';
import 'package:application/screens/login_success/signup_success_screen.dart';
import 'package:application/screens/setting/setting_screen.dart';
import 'package:application/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:application/screens/home/home_screen.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/User Icon.svg",
                color: MenuState.wallet == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () => Get.to(
                () => WalletScreen(),
                transition: Transition.cupertino,
              ),
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () => Get.to(
                () => HomeScreen(),
                transition: Transition.cupertino,
              ),
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/Heart Icon.svg"),
              onPressed: () => Get.to(
                () => SignUpSuccessScreen(),
                transition: Transition.cupertino,
              ),
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Settings.svg",
                color: MenuState.setting == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {
                Get.to(
                  () => SettingScreen(),
                  transition: Transition.cupertino,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
