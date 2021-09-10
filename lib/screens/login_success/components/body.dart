import 'package:ecomerce/components/default_button.dart';
import 'package:ecomerce/screens/home/home_screen.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: SizeConfig.screenHeight * 0.1,
        ),
        Image.asset(
          'assets/images/success.png',
          height: SizeConfig.screenHeight * 0.45,
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: DefaultButtons(
            text: 'Go home',
            press: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  HomeScreen.routeName, (Route<dynamic> route) => false);
            },
          ),
        ),
      ],
    );
  }
}
