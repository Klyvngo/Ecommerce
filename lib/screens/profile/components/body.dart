import 'package:ecomerce/components/social_card.dart';
import 'package:ecomerce/constants.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/material.dart';

import 'profile_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Text(
                'Complete Profile',
                style: headingStyle,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              const Text(
                'Complete your details or\n continue with social media',
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              ProfileForm(email: email),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
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
              SizedBox(height: SizeConfig.screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
