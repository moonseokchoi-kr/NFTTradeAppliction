import 'package:application/controllers/maket_controller.dart';
import 'package:application/controllers/post_api_controller.dart';

import 'package:flutter/material.dart';
import 'package:application/components/product_card.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  PopularProducts(this.title, this.rot);
  final String title;
  final Axis rot;
  MarketController _itemControll = Get.put(MarketController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: title, press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Obx(
          () => SingleChildScrollView(
            child: Row(
              children: [
                ...List.generate(_itemControll.items.value.content.length,
                    (index) {
                  return ProductCard(
                      tag: "nftcard$index",
                      product: _itemControll.items.value.content[index]);
                })
              ],
            ),
            scrollDirection: rot,
          ),
        ),
      ],
    );
  }
}
