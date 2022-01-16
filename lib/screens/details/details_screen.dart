import 'package:application/constants.dart';
import 'package:application/models/item.dart';
import 'package:application/screens/Selling/selling_screen.dart';
import 'package:application/components/default_button.dart';
import 'package:application/screens/process/item_process.dart';
import 'package:application/screens/purchasePage/purchase.dart';
import 'package:application/screens/wallet/components/nft_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomAppBar(),
        ),
        body: Body(product: agrs.product),
        bottomNavigationBar: Visibility(
          child: BottomAppBar(
            child: checkSellState(agrs.route, agrs.product.sellState)
                ? DefaultButton(
                    text: NFTDetailScreen.routeName == agrs.route
                        ? "Cancel Selling"
                        : "Buy Now",
                    press: () {
                      Get.defaultDialog(
                        title: 'Confirm',
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Divider(
                              height: 1,
                            ),
                            Text(
                              "Are you sure cancel selling this item?",
                              style: TextStyle(color: kTextColor, fontSize: 16),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: () => {},
                                  child: Text(
                                    "Cancle",
                                    style: TextStyle(
                                        color: kPrimaryColor, fontSize: 16),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => {
                                    Get.toNamed(ItemProcessScreen.routeName,
                                        arguments: {
                                          "item": agrs.product,
                                          "price": 0.0,
                                        }),
                                  },
                                  child: Text(
                                    "OK",
                                    style: TextStyle(
                                        color: kTextColor, fontSize: 16),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        radius: 10.0,
                      );
                    },
                    isButtonDisabled: false)
                : DefaultButton(
                    text: NFTDetailScreen.routeName == agrs.route
                        ? agrs.product.sellState == 3
                            ? "Wait Please"
                            : "Go Selling"
                        : "Buy Now",
                    press: () => Get.toNamed(
                          NFTDetailScreen.routeName == agrs.route
                              ? SellingScreen.routeName
                              : PurchaseScreen.routeName,
                          arguments: agrs,
                        ),
                    isButtonDisabled: agrs.product.sellState == 3),
          ),
          visible: true,
        ),
      ),
    );
  }

  bool checkSellState(String? route, int? state) {
    if (state == null) return true;
    if (NFTDetailScreen.routeName == route && state > 0)
      return true;
    else if (NFTDetailScreen.routeName != route && state != 2) return false;
    return false;
  }
}

class ProductDetailsArguments {
  final Item product;
  final String? route;
  ProductDetailsArguments({required this.product, required this.route});
}
