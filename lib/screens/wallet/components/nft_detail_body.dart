import 'package:application/components/product_card.dart';
import 'package:application/components/token_info_card.dart';
import 'package:application/controllers/item_api_controller.dart';
import 'package:application/models/Token.dart';
import 'package:application/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';

class NFTDetailBody extends StatelessWidget {
  NFTDetailBody({
    Key? key,
    required this.nft,
  }) : super(key: key);
  final NFT nft;
  ItemControll _itemControll = Get.put(ItemControll());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Obx(
          () => TokenInfoCard(
            name: nft.nftName,
            address: nft.address,
            amount: _itemControll.items.value.results.length.toDouble(),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.55,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
            ),
            child: Obx(
              () => CustomScrollView(
                controller: _itemControll.scrollController,
                slivers: [
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150.0,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => Get.toNamed(DetailsScreen.routeName),
                          child: ProductCard(
                            product: _itemControll.items.value.results[index],
                            isVisible: false,
                          ),
                        );
                      },
                      childCount: _itemControll.items.value.results.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
