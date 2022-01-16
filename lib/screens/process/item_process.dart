import 'package:application/controllers/item_controller.dart';
import 'package:application/models/item.dart';
import 'package:application/screens/Selling/selling_body.dart';
import 'package:application/screens/details/details_screen.dart';
import 'package:application/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class ItemProcessScreen extends StatefulWidget {
  static String routeName = '/itemProcess';

  @override
  _ItemProcessScreenState createState() => _ItemProcessScreenState();
}

class _ItemProcessScreenState extends State<ItemProcessScreen> {
  final _itemController = Get.put(ItemController());
  final Item _item = Get.arguments['item'];
  final _price = Get.arguments['price'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _itemController.changeItemSell(_item.tokenId!, _price),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
            } else {
              if (snapshot.data!) {
                SchedulerBinding.instance?.addPostFrameCallback((_) {
                  SellingBody.price = 0;
                  Get.offAllNamed(WalletScreen.routeName);
                  Get.snackbar(
                    "Result",
                    "Item successed Register to Market",
                    backgroundColor: Color.fromARGB(100, 109, 116, 104),
                    snackPosition: SnackPosition.BOTTOM,
                  );
                });
              } else {
                SchedulerBinding.instance?.addPostFrameCallback((_) {
                  Get.offAllNamed(WalletScreen.routeName);
                });
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
