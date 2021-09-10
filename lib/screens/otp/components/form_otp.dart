import 'package:ecomerce/components/default_button.dart';
import 'package:ecomerce/screens/signin/sigin_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class FormOtp extends StatefulWidget {
  const FormOtp({
    Key? key,
  }) : super(key: key);

  @override
  State<FormOtp> createState() => _FormOtpState();
}

class _FormOtpState extends State<FormOtp> {
  FocusNode? pin2Focus;
  FocusNode? pin3Focus;
  FocusNode? pin4Focus;
  final _text1 = TextEditingController();
  final _text2 = TextEditingController();
  final _text3 = TextEditingController();
  final _text4 = TextEditingController();

  @override
  void initState() {
    super.initState();
    pin2Focus = FocusNode();
    pin3Focus = FocusNode();
    pin4Focus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2Focus!.dispose();
    pin3Focus!.dispose();
    pin4Focus!.dispose();
  }

  void nextField(String? value, FocusNode? focusNode) {
    if (value!.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: SizeConfig.screenHeight * 0.15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: getProportionateScreenWidth(60),
                  child: TextFormField(
                    controller: _text1,
                    onTap: _text1.clear,
                    obscureText: true,
                    autofocus: true,
                    decoration: otpInputDecoration,
                    style: const TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      _text2.clear();
                      nextField(value, pin2Focus);
                    },
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(60),
                  child: TextFormField(
                    controller: _text2,
                    onTap: _text2.clear,
                    obscureText: true,
                    decoration: otpInputDecoration,
                    style: const TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      _text3.clear();
                      nextField(value, pin3Focus);
                    },
                    focusNode: pin2Focus,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(60),
                  child: TextFormField(
                    controller: _text3,
                    onTap: _text3.clear,
                    obscureText: true,
                    decoration: otpInputDecoration,
                    style: const TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      _text4.clear();
                      nextField(value, pin4Focus);
                    },
                    focusNode: pin3Focus,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(60),
                  child: TextFormField(
                    controller: _text4,
                    onTap: _text4.clear,
                    obscureText: true,
                    decoration: otpInputDecoration,
                    style: const TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin4Focus!.unfocus();
                      }
                    },
                    focusNode: pin4Focus,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.1,
            ),
            DefaultButtons(
              text: 'Complete',
              press: () {
                // Check complete OTP
                Navigator.of(context).pushNamedAndRemoveUntil(
                    SignInScreen.routeName, (Route<dynamic> route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
