import 'package:ecomerce/constants.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_picture.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Column(
        children: <Widget>[
          const ProfilePicture(),
          const SizedBox(
            height: 20,
          ),
          ProfileMenu(
            icon: 'assets/icons/User Icon.svg',
            press: () {},
            text: 'My Account',
          ),
          const SizedBox(
            height: 20,
          ),
          ProfileMenu(
            icon: 'assets/icons/Bell.svg',
            press: () {},
            text: 'Notifications',
          ),
          const SizedBox(
            height: 20,
          ),
          ProfileMenu(
            icon: 'assets/icons/Settings.svg',
            press: () {},
            text: 'Settings',
          ),
          const SizedBox(
            height: 20,
          ),
          ProfileMenu(
            icon: 'assets/icons/Question mark.svg',
            press: () {},
            text: 'Help Center',
          ),
          const SizedBox(
            height: 20,
          ),
          ProfileMenu(
              text: 'Log out', press: () {}, icon: 'assets/icons/Log out.svg')
        ],
      ),
    );
  }
}
