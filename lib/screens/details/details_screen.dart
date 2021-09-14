import 'package:ecomerce/models/product.dart';
import 'package:ecomerce/screens/details/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = '/detail';
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(
          rating: product.rating,
        ),
      ),
      body: Body(
        product: product,
      ),
    );
  }
}
