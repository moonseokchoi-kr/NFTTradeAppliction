import 'package:application/arguments/arguments.dart';
import 'package:application/components/coustom_bottom_nav_bar.dart';
import 'package:application/components/title_text.dart';
import 'package:application/enums.dart';
import 'package:application/screens/wallet/components/nft_detail_body.dart';
import 'package:flutter/material.dart';

class NFTDetailScreen extends StatelessWidget {
  static String routeName = "/nft_detail";

  @override
  Widget build(BuildContext context) {
    NFTDetailArguments arguments =
        ModalRoute.of(context)!.settings.arguments as NFTDetailArguments;
    return Scaffold(
      appBar: AppBar(
        title: TitleText(
          title: arguments.nft.nftName,
          fontSize: 40,
        ),
      ),
      body: NFTDetailBody(
        nft: arguments.nft,
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.wallet),
    );
  }
}
