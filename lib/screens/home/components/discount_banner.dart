import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(
        getProportionateScreenWidth(15),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF4A3298).withOpacity(0.75),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(children: [
          const TextSpan(
            text: 'Summer sales\n',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Cashback 30%',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(24),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ]),
      ),
    );
  }
}
