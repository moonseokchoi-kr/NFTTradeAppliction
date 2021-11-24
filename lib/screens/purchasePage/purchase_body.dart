import 'package:application/components/default_button.dart';
import 'package:application/constants.dart';
import 'package:application/models/test_model.dart';
import 'package:application/screens/details/components/product_images.dart';
import 'package:application/screens/process/transfer_process.dart';
import 'package:application/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PurchaseBody extends StatelessWidget {
  const PurchaseBody({Key? key, required this.product}) : super(key: key);

  final Result product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 10,
                  blurRadius: 5,
                  offset: Offset(-1, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: ProductImages(
                product: product,
                imageSize: SizeConfig.screenHeight * 0.9,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(10, 10),
                  ),
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${product.popularity * 1.1} MST",
                      style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fee",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${(product.popularity * 0.1).floor()} MST",
                      style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "0 MST",
                      style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: DefaultButton(
              text: "Buy",
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
                          "Product Name: ${product.title} \namount: ${product.popularity * 1.1} MST",
                          style: TextStyle(color: kTextColor, fontSize: 16),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () => {Get.back()},
                              child: Text(
                                "Cancle",
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 16),
                              ),
                            ),
                            TextButton(
                              onPressed: () => {
                                Get.offNamed(TransferProcessScreen.routeName)
                              },
                              child: Text(
                                "OK",
                                style:
                                    TextStyle(color: kTextColor, fontSize: 16),
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
          )
        ],
      ),
    );
  }
}
