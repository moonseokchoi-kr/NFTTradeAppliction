import 'package:application/arguments/arguments.dart';
import 'package:application/components/token_detail_select_card.dart';
import 'package:application/components/token_info_card.dart';
import 'package:application/models/Token.dart';
import 'package:application/screens/wallet/components/token_trasfer.dart';
import 'package:application/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TokenDetailBody extends StatelessWidget {
  const TokenDetailBody({Key? key, required this.token}) : super(key: key);

  final Token token;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          TokenInfoCard(
            name: token.tokenName,
            address: token.tokenAddress,
            amount: token.tokenAmount,
          ),
          SizedBox(
            height: 20,
          ),
          TokenDetailSelectCard(
            text: "토큰전송",
            callBack: () => Get.toNamed(TokenTransferScreen.routeName,
                arguments: TokenDetailArguments(token: token, title: "토큰전송")),
          ),
          TokenDetailSelectCard(
              text: "MST로 전환",
              callBack: () => Get.toNamed(TokenTransferScreen.routeName,
                  arguments:
                      TokenDetailArguments(token: token, title: "MST로 전환"))),
        ],
      ),
    );
  }
}
