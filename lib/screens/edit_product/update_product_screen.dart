import 'dart:developer';

import 'package:ecomerce/constants.dart';
import 'package:ecomerce/models/product.dart';
import 'package:ecomerce/models/products.dart';
import 'package:ecomerce/screens/edit_product/widget/edit_product.dart';
import 'package:flutter/material.dart';

class UpdateProduct extends StatelessWidget {
  static String routeName = '/updateproduct';
  const UpdateProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prodId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update product',
          style: textStyle,
        ),
        backgroundColor: const Color(0xFFF5F6F9),
      ),
      body: EditProduct(
        productId: prodId,
      ),
      backgroundColor: const Color(0xFFF5F6F9),
    );
  }
}
