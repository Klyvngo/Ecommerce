import 'package:ecomerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_products.dart';
import 'special_offer.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          const HomeHeader(),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          const DiscountBanner(),
          const Categories(),
          const SpecialOffer(),
          const PopularProducts(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
        ],
      )),
    );
  }
}
