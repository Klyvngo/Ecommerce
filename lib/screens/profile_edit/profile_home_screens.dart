import 'package:ecomerce/components/custom_bottom_navigatorbar.dart';
import 'package:ecomerce/constants.dart';
import 'package:ecomerce/enums.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ProfileHomeScreen extends StatelessWidget {
  static String routeName = '/profilehome';
  const ProfileHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: textStyle,
        ),
      ),
      body: Body(),
      bottomNavigationBar:
          const CustomBottomNavigatorBar(selectMenu: MenuState.profile),
    );
  }
}
