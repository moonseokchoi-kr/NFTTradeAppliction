import 'package:application/models/test_model.dart';
import 'package:flutter/material.dart';

import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Result product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        ListView(
          children: [
            ProductImages(product: product),
            ProductDetailTab(product: product),
          ],
        ),
        ListView()
      ],
    );
  }
}

class ProductDetailTab extends StatelessWidget {
  const ProductDetailTab({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Result product;

  @override
  Widget build(BuildContext context) {
    return TopRoundedContainer(
      color: Colors.white,
      child: Column(
        children: [
          ProductDescription(
            product: product,
            pressOnSeeMore: () {},
          ),
        ],
      ),
    );
  }
}
