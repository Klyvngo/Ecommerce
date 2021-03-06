import 'package:ecomerce/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SearchField(),
          IconBtnWithCounter(
            iconUrl: 'assets/icons/Cart Icon.svg',
            numberCounter: 0,
            press: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
          IconBtnWithCounter(
            iconUrl: 'assets/icons/Bell.svg',
            numberCounter: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
