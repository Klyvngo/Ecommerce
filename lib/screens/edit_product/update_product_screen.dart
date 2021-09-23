import 'package:ecomerce/constants.dart';
import 'package:flutter/material.dart';

class UpdateProduct extends StatelessWidget {
  static String routeName = '/updateproduct';
  const UpdateProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update product',
          style: textStyle,
        ),
      ),
      body: Container(),
    );
  }
}
