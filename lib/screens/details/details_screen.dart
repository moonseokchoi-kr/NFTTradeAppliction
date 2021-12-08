import 'package:application/models/Item/item.dart';
import 'package:application/screens/Selling/selling_screen.dart';
import 'package:application/components/default_button.dart';
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
            child: DefaultButton(
              text: NFTDetailScreen.routeName == agrs.route
                  ? "Go Selling"
                  : "Buy Now",
              press: () => Get.toNamed(
                NFTDetailScreen.routeName == agrs.route
                    ? SellingScreen.routeName
                    : PurchaseScreen.routeName,
                arguments: agrs,
              ),
            ),
          ),
          visible: true,
        ),
      ),
    );
  }
}

class ProductDetailsArguments {
  final Item product;
  final String? route;
  ProductDetailsArguments({required this.product, required this.route});
}
