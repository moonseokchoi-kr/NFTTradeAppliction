import 'package:application/constants.dart';
import 'package:application/models/test_model.dart';
import 'package:application/screens/details/components/product_images.dart';
import 'package:application/size_config.dart';
import 'package:flutter/material.dart';

class SellingBody extends StatefulWidget {
  SellingBody({Key? key, required this.product}) : super(key: key);

  Result product;
  static double? price;
  @override
  _SellingBodyState createState() => _SellingBodyState();
}

class _SellingBodyState extends State<SellingBody> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      _changeValue();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeValue() {
    setState(() {
      SellingBody.price = double.tryParse(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 10,
                    blurRadius: 5,
                    offset: Offset(-1, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: ProductImages(
                  product: widget.product,
                  imageSize: SizeConfig.screenHeight * 0.6,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: _buildTextField(),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(10, 10),
                    ),
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fee",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "${(SellingBody.price == null ? 0 : SellingBody.price! * 0.1).floor()} MST",
                        style: TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "${(SellingBody.price == null ? 0 : SellingBody.price! * 1.1).round()} MST",
                        style: TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextField _buildTextField() {
    return TextField(
      textAlign: TextAlign.end,
      controller: _controller,
      style: TextStyle(
        color: kTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        labelText: "Price",
        hintText: "write down the price you want.",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
