import 'package:application/components/default_button.dart';
import 'package:application/components/token_info_card.dart';
import 'package:application/models/Token.dart';
import 'package:application/screens/process/transfer_process.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class TokenTransferBody extends StatefulWidget {
  TokenTransferBody({
    Key? key,
    required this.token,
    required this.isTransfer,
  }) : super(key: key);

  final Token token;
  final bool isTransfer;
  final _addressController = TextEditingController();
  final _tokenController = TextEditingController();
  @override
  _TokenTransferBodyState createState() => _TokenTransferBodyState();
}

class _TokenTransferBodyState extends State<TokenTransferBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.04,
        ),
        TokenInfoCard(
          name: widget.token.tokenName,
          address: widget.token.tokenAddress,
          amount: widget.token.tokenAmount,
        ),
        SizedBox(
          height: 40,
        ),
        //textfield 상대방 주소 입력 -> 조건에 따라 보이거나 안보이게 한다.
        Visibility(
          child: TransferField(
            str: "Wallet Address",
            icon: Icon(Icons.account_balance_wallet_outlined),
            isNumber: false,
            controller: widget._addressController,
          ),
          visible: widget.isTransfer,
        ),

        SizedBox(
          height: 40,
        ),
        TransferField(
          str: "Token Amount",
          icon: Icon(Icons.money_outlined),
          isNumber: true,
          controller: widget._tokenController,
        ),

        SizedBox(
          height: 200,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: DefaultButton(
            text: widget.isTransfer ? "Send" : "Convert",
            press: () => {
              Get.defaultDialog(
                  title: 'Confirm',
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(
                        height: 1,
                      ),
                      Text(
                        "address: ${widget._addressController.value.text} \namount: ${widget._tokenController.value.text} MST",
                        style: TextStyle(color: kTextColor, fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () => {Get.back()},
                            child: Text(
                              "Cancle",
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 16),
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                {Get.offNamed(TransferProcessScreen.routeName)},
                            child: Text(
                              "OK",
                              style: TextStyle(color: kTextColor, fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  radius: 10.0)
            },
            radius: 15,
          ),
        ),
      ]
          //textfield 전달할 금액 입력
          // 수수료 표시

          ),
    );
  }
}

class TransferField extends StatefulWidget {
  const TransferField({
    Key? key,
    required this.str,
    required this.icon,
    required this.isNumber,
    required this.controller,
  }) : super(key: key);
  final String str;
  final Icon icon;
  final bool isNumber;
  final TextEditingController controller;

  @override
  _TransferFieldState createState() => _TransferFieldState();
}

class _TransferFieldState extends State<TransferField> {
  @override
  void initState() {
    widget.controller.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.8,
      //height: 50,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType:
            widget.isNumber ? TextInputType.number : TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: widget.str,
          prefixIcon: widget.icon,
          contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(9)),
        ),
      ),
    );
  }
}
