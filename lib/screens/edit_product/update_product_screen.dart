import 'package:ecomerce/constants.dart';
import 'package:ecomerce/screens/edit_product/widget/edit_product.dart';
import 'package:flutter/material.dart';

class UpdateProduct extends StatelessWidget {
  static String routeName = '/updateproduct';
  const UpdateProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    final prodId = args[0];
    final menu = args[1];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update product',
          style: textStyle,
        ),
        backgroundColor: const Color(0xFFF5F6F9),
      ),
      body: EditProduct(
        menu: menu,
        productId: prodId,
      ),
      backgroundColor: const Color(0xFFF5F6F9),
    );
  }
}
