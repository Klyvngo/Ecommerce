import 'package:ecomerce/components/no_account_text.dart';
import 'package:ecomerce/components/social_card.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/material.dart';

import 'signin_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                Text(
                  'Welcome back',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Signin with a email and password\nor with social media',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(13.5),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.05,
                ),
                const SigninForm(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialCard(
                      url: 'assets/icons/twitter.svg',
                      press: () {},
                    ),
                    SocialCard(
                      url: 'assets/icons/facebook-2.svg',
                      press: () {},
                    ),
                    SocialCard(
                      url: 'assets/icons/google-icon.svg',
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                const NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
