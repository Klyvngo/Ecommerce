import 'package:ecomerce/constants.dart';
import 'package:ecomerce/enums.dart';
import 'package:ecomerce/screens/edit_product/edit_product_screen.dart';
import 'package:ecomerce/screens/home/home_screen.dart';
import 'package:ecomerce/screens/profile_edit/profile_home_screens.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  const CustomBottomNavigatorBar({Key? key, required this.selectMenu})
      : super(key: key);
  final MenuState selectMenu;
  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.75),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
              icon: SvgPicture.asset(
                'assets/icons/Shop Icon.svg',
                color: MenuState.home == selectMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/Heart Icon.svg'),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: Icon(
                CupertinoIcons.square_list,
                color: MenuState.edit == selectMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(ProfileHomeScreen.routeName);
              },
              icon: SvgPicture.asset('assets/icons/User Icon.svg',
                  color: MenuState.profile == selectMenu
                      ? kPrimaryColor
                      : inActiveIconColor),
            ),
          ],
        ),
      ),
    );
  }
}
