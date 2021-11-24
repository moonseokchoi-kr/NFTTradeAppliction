import 'package:application/constants.dart';
import 'package:application/size_config.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.title,
    required this.fontSize,
  }) : super(key: key);

  final String title;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: getProportionateScreenWidth(fontSize),
        color: kPrimaryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
