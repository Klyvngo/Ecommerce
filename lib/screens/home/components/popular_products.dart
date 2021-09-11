import 'package:ecomerce/components/product_card.dart';
import 'package:ecomerce/models/products.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'special_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionTitle(
          text: 'Popular Products',
          press: () {},
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular) {
                    return ProductCard(product: demoProducts[index]);
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              ),
            ],
          ),
        )
      ],
    );
  }
}
