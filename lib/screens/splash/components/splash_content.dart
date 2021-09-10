import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key, required this.text, required this.imageUrl})
      : super(key: key);
  final String? text;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          'E-commerce',
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: getProportionateScreenWidth(34),
              fontWeight: FontWeight.bold),
        ),
        Text(
          text!,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: getProportionateScreenWidth(18),
          ),
          textAlign: TextAlign.center,
        ),
        Image.asset(
          imageUrl!,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
