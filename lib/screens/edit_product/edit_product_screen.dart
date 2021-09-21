import 'package:ecomerce/components/custom_bottom_navigatorbar.dart';
import 'package:ecomerce/constants.dart';
import 'package:ecomerce/enums.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class EditProductScreen extends StatelessWidget {
  static String routeName = '/editproduct';
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Product',
          style: textStyle,
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigatorBar(
        selectMenu: MenuState.edit,
      ),
      body: const Body(),
    );
  }
}
