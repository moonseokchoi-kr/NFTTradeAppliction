import 'package:application/screens/home/components/icon_btn_with_counter.dart';
import 'package:application/size_config.dart';
import 'package:flutter/material.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        children: [
          SerachField(),
          Spacer(
            flex: 1,
          ),
          IconBtnWithCounter(key, "assets/icons/Bell.svg", 0, () {}),
        ],
      ),
    );
  }
}
