import 'dart:convert';

import 'package:application/constants.dart';
import 'package:application/controllers/item_controller.dart';
import 'package:application/screens/wallet/components/token_trasfer.dart';
import 'package:application/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class TransferProcessScreen extends StatefulWidget {
  static String routeName = '/transferProcess';

  @override
  _TransferProcessScreenState createState() => _TransferProcessScreenState();
}

class _TransferProcessScreenState extends State<TransferProcessScreen> {
  final _itemController = Get.put(ItemController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _itemController.tradeItem(Get.arguments['item']),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              SchedulerBinding.instance?.addPostFrameCallback((_) {
                Get.defaultDialog(
                  title: "Error!!",
                  middleText:
                      "An unexpected error occurred. Please try again in a little bit.",
                  backgroundColor: Colors.white,
                  titleStyle: TextStyle(color: kPrimaryColor, fontSize: 20),
                  middleTextStyle: TextStyle(color: kTextColor, fontSize: 13),
                );
              });
            } else {
              SchedulerBinding.instance?.addPostFrameCallback((_) {
                Get.offNamed(WalletScreen.routeName);
                final json = jsonDecode(snapshot.data!);
                if (json['result']) {
                  Get.snackbar(
                    "Transfer Success",
                    json['hash'],
                    backgroundColor: Color.fromARGB(100, 109, 116, 104),
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
