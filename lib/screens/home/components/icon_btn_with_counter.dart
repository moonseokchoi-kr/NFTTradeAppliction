import 'package:application/constants.dart';
import 'package:application/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter(
    Key? key,
    @required this.svgSrc,
    this.numofItems,
    this.press,
  ) : super(key: key);

  final String svgSrc;
  final int numofItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            height: getProportionateScreenWidth(100),
            width: getProportionateScreenWidth(100),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numofItems != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: getProportionateScreenHeight(30),
                width: getProportionateScreenWidth(30),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numofItems",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      height: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
