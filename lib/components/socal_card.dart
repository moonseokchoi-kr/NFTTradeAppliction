import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class SocalCard extends StatelessWidget {
  SocalCard({
    Key? key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String? icon;
  void Function()? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(12),
        ),
        height: getProportionateScreenHeight(60),
        width: getProportionateScreenWidth(600),
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon!,
              width: getProportionateScreenWidth(50),
              height: getProportionateScreenHeight(50),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              "Sign in SNS login",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
