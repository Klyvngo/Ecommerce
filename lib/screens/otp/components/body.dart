import 'package:ecomerce/constants.dart';
import 'package:ecomerce/size_config.dart';
import 'package:flutter/material.dart';

import 'form_otp.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.phoneNumber}) : super(key: key);
  final String? phoneNumber;

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
              const Text(
                'OTP Verification',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              Text(
                'Send your code to +$phoneNumber',
                style: const TextStyle(color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Code will expried in',
                    style: TextStyle(color: Colors.black),
                  ),
                  TweenAnimationBuilder(
                    tween: Tween(begin: 30.0, end: 0),
                    duration: const Duration(seconds: 30),
                    builder: (_, dynamic value, child) => Text(
                      ' 00:${value.toInt()}',
                      style: const TextStyle(color: kPrimaryColor),
                    ),
                    onEnd: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              const FormOtp(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              GestureDetector(
                onTap: () {
                  // Resend OTP
                },
                child: const Text('Resend OTP',
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
