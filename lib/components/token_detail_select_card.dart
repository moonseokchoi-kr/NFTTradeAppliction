import 'package:flutter/material.dart';

import '../size_config.dart';

class TokenDetailSelectCard extends StatelessWidget {
  const TokenDetailSelectCard({
    Key? key,
    required this.text,
    required this.callBack,
  }) : super(key: key);
  final String text;
  final GestureTapCallback callBack;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: GestureDetector(
          onTap: callBack,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(30)),
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.money,
                      size: 40,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Icon(Icons.arrow_forward_ios, size: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
