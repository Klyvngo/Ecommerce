import 'package:ecomerce/components/custom_bottom_navigatorbar.dart';
import 'package:ecomerce/constants.dart';
import 'package:ecomerce/enums.dart';
import 'package:ecomerce/screens/edit_product/update_product_screen.dart';
import 'package:flutter/cupertino.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(UpdateProduct.routeName);
            },
            icon: const Icon(CupertinoIcons.add_circled_solid),
          )
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigatorBar(
        selectMenu: MenuState.edit,
      ),
      body: const Body(),
    );
  }
}
