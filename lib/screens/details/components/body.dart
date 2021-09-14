import 'dart:ui';

import 'package:ecomerce/components/default_button.dart';
import 'package:ecomerce/models/product.dart';
import 'package:ecomerce/screens/details/components/color_dots.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/material.dart';

import 'product_description.dart';
import 'product_image.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.product}) : super(key: key);
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImage(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ProductDescription(
                  product: product,
                  press: () {},
                ),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: Column(
                    children: <Widget>[
                      ColorsDot(product: product),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            top: getProportionateScreenWidth(15),
                            bottom: getProportionateScreenWidth(40),
                          ),
                          child: DefaultButtons(
                            text: 'Add to Carts',
                            press: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: const Duration(seconds: 2),
                                  content: Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(text: 'Add '),
                                        TextSpan(
                                          text: product!.title,
                                          style: const TextStyle(
                                              color: Colors.blue),
                                        ),
                                        const TextSpan(text: ' to your cart'),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
