import 'package:ecomerce/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = '/otp';

  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? phoneNumber =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OTP',
          style: textStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Body(
          phoneNumber: phoneNumber,
        ),
      ),
    );
  }
}
