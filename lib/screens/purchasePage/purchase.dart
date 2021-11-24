import 'package:application/components/title_text.dart';
import 'package:application/screens/purchasePage/purchase_body.dart';
import 'package:application/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

class PurchaseScreen extends StatelessWidget {
  static String routeName = "/purchase";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      appBar: AppBar(
        title: TitleText(
          title: "Purchase",
          fontSize: 40,
        ),
      ),
      body: PurchaseBody(product: arguments.product),
    );
  }
}
