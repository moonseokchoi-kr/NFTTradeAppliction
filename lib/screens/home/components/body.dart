import 'package:flutter/material.dart';
import 'package:application/size_config.dart';

import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts("Recently Listed", Axis.horizontal),
            // SizedBox(height: getProportionateScreenWidth(30)),
            // PopularProducts("Most Viewed", Axis.horizontal),
            // SizedBox(height: getProportionateScreenWidth(30)),
            // PopularProducts("Recent Deal", Axis.horizontal),
          ],
        ),
      ),
    );
  }
}
