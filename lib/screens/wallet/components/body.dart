import 'package:application/controllers/item_api_controller.dart';
import 'package:application/models/Token.dart';
import 'package:application/arguments/arguments.dart';
import 'package:application/models/test_model.dart';
import 'package:application/screens/wallet/components/nft_detail_screen.dart';
import 'package:application/screens/wallet/components/token_detail.dart';
import 'package:application/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomWalletTabBar();
  }
}

class CustomWalletTabBar extends StatefulWidget {
  const CustomWalletTabBar({Key? key}) : super(key: key);

  @override
  _CustomWalletTabBarState createState() => _CustomWalletTabBarState();
}

class _CustomWalletTabBarState extends State<CustomWalletTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  ItemControll itemControll = Get.put(ItemControll());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          child: TabBar(
            controller: _tabController,
            // give the indicator a decoration (color and border radius)
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                5.0,
              ),
              color: Colors.green.shade400,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              // first tab [you can add an icon using the icon property]
              Tab(
                icon: Icon(Icons.money_sharp,
                    size: getProportionateScreenHeight(40)),
                text: 'TOKENS',
              ),

              // second tab [you can add an icon using the icon property]
              Tab(
                icon: Icon(
                  Icons.shopping_basket,
                  size: getProportionateScreenHeight(40),
                ),
                text: 'ITEMS',
              ),
            ],
          ),
        ),
        // tabbar view here
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              // first tab bar view widget
              ListView.builder(
                itemCount: demoToken.length,
                itemBuilder: (context, index) =>
                    TokenCard(token: demoToken[index]),
              ),

              // second tab bar view widget
              ListView.builder(
                itemCount: demoNFT.length,
                itemBuilder: (context, index) => NFTCard(
                  nft: demoNFT[index],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

///TO-DO 토큰정보 상세화면부터
class TokenCard extends StatelessWidget {
  const TokenCard({
    Key? key,
    required this.token,
  }) : super(key: key);

  final Token token;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: SizeConfig.screenWidth,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            TokenDetailScreen.routeName,
            arguments: TokenDetailArguments(token: token),
          ),
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 20),
                Icon(
                  Icons.money,
                  size: 40,
                ),
                Text(
                  token.tokenName,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 2,
                ),
                SizedBox(
                  width: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "${token.tokenAmount}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "USD 123",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: kPrimaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NFTCard extends StatelessWidget {
  const NFTCard({
    Key? key,
    required this.nft,
  }) : super(key: key);

  final NFT nft;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: SizeConfig.screenWidth,
        child: GestureDetector(
          onTap: () => Get.toNamed(
            NFTDetailScreen.routeName,
            arguments: NFTDetailArguments(nft: nft),
          ),
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 20),
                Icon(
                  Icons.money,
                  size: 40,
                ),
                Text(
                  nft.nftName,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 2,
                ),
                SizedBox(
                  width: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Amount",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "${nft.itemAmount}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: kPrimaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
