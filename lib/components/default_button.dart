import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
    this.radius = 0,
    this.isButtonDisabled = false,
  }) : super(key: key);
  final String? text;
  final Function? press;
  final double radius;
  final bool isButtonDisabled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          primary: Colors.white,
          backgroundColor: isButtonDisabled ? Colors.grey[600] : kPrimaryColor,
        ),
        onPressed: isButtonDisabled ? null : press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(50),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
