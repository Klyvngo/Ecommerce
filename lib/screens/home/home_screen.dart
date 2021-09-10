import 'package:ecomerce/components/custom_bottom_navigatorbar.dart';
import 'package:ecomerce/enums.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavigatorBar(
        selectMenu: MenuState.home,
      ),
    );
  }
}
