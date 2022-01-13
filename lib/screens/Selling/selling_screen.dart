import 'package:application/components/default_button.dart';
import 'package:application/constants.dart';
import 'package:application/screens/Selling/selling_body.dart';
import 'package:application/components/title_text.dart';
import 'package:application/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellingScreen extends StatelessWidget {
  static String routeName = "/selling";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      appBar: AppBar(
        title: TitleText(
          title: arguments.product.title.toString(),
          fontSize: 40,
        ),
      ),
      body: SellingBody(product: arguments.product),
      bottomNavigationBar: BottomAppBar(
        child: DefaultButton(
          text: "Register",
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
                      "Are you sure start selling this item?",
                      style: TextStyle(color: kTextColor, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () => {},
                          child: Text(
                            "Cancle",
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 16),
                          ),
                        ),
                        TextButton(
                          onPressed: () => {
                            Get.toNamed("/itemProcess", arguments: {
                              "item": arguments.product,
                              "price": SellingBody.price,
                            }),
                            SellingBody.price = 0
                          },
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
          radius: 5,
        ),
      ),
    );
  }
}
