import 'package:ecomerce/components/social_card.dart';
import 'package:ecomerce/constants.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/material.dart';

import 'signup_form.dart';

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
          child: Column(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Text(
                'Welcome to sign up',
                style: headingStyle,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              const Text(
                'Create a account with email and password\n or signup with social media',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              const SignUpForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
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
            ],
          ),
        ),
      ),
    );
  }
}
