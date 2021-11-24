import 'package:application/components/coustom_bottom_nav_bar.dart';
import 'package:application/components/title_text.dart';
import 'package:application/enums.dart';
import 'package:application/arguments/arguments.dart';
import 'package:application/screens/wallet/components/token_detail_body.dart';
import 'package:application/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TokenDetailScreen extends StatelessWidget {
  static String routeName = "/token_details";
  @override
  Widget build(BuildContext context) {
    final TokenDetailArguments arguments =
        ModalRoute.of(context)!.settings.arguments as TokenDetailArguments;
    return Scaffold(
      appBar: AppBar(
        title: TitleText(
          title: arguments.token.tokenName,
          fontSize: 40,
        ),
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        titleTextStyle: appBarTitleTheme(),
      ),
      body: TokenDetailBody(
        token: arguments.token,
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.wallet),
    );
  }
}
