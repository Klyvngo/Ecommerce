import 'package:ecomerce/models/products.dart';
import 'package:ecomerce/screens/cart/components/checkout_card.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
      bottomNavigationBar: const CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: <Widget>[
          Text(
            'Your Cart',
            style: TextStyle(
                color: Colors.black, fontSize: getProportionateScreenWidth(20)),
          ),
          Text(
            '${demoProducts.length} items',
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(13.5),
            ),
          ),
        ],
      ),
    );
  }
}
