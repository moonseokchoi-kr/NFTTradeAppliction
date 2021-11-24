import 'package:application/controllers/item_api_controller.dart';
import 'package:application/models/test_model.dart';
import 'package:flutter/material.dart';
import 'package:application/components/product_card.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  PopularProducts(this.title, this.rot);
  final String title;
  final Axis rot;
  ItemControll itemControll = Get.put(ItemControll());
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
                ...List.generate(itemControll.items.value.results.length,
                    (index) {
                  return ProductCard(
                      product: itemControll.items.value.results[index]);
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
