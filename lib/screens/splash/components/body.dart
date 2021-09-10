import 'package:ecomerce/components/default_button.dart';
import 'package:ecomerce/constants.dart';
import 'package:ecomerce/screens/signin/sigin_screen.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/material.dart';

import 'splash_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentState = 0;
  List<Map<String, String>> splashData = [
    {'image': "assets/images/e_splash_01.png", 'text': 'Welcome to MyShop'},
    {'image': 'assets/images/e_splash_02.png', 'text': 'Buy so fast'},
    {'image': 'assets/images/e_splash_03.png', 'text': 'Buy fast'}
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentState = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]['text'],
                  imageUrl: splashData[index]['image'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ...List.generate(
                          splashData.length,
                          (index) => buildDot(index),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    DefaultButtons(
                      text: 'Continue',
                      press: () {
                        Navigator.of(context).pushNamed(SignInScreen.routeName);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 8),
      height: 6,
      width: currentState == index ? 20 : 8,
      decoration: BoxDecoration(
        color: currentState == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
