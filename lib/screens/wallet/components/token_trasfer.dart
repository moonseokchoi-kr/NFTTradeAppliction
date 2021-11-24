import 'package:application/components/coustom_bottom_nav_bar.dart';
import 'package:application/components/title_text.dart';
import 'package:application/arguments/arguments.dart';
import 'package:application/enums.dart';
import 'package:application/screens/wallet/components/token_transfer_body.dart';
import 'package:flutter/material.dart';

class TokenTransferScreen extends StatelessWidget {
  static String routeName = "/token_transfer";

  @override
  Widget build(BuildContext context) {
    final TokenDetailArguments arguments =
        ModalRoute.of(context)!.settings.arguments as TokenDetailArguments;
    return Scaffold(
      appBar: AppBar(
        title: TitleText(
          title: arguments.title!,
          fontSize: 40,
        ),
      ),
      body: TokenTransferBody(
        token: arguments.token,
        isTransfer: "토큰전송" == arguments.title! ? true : false,
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.wallet),
    );
  }
}
