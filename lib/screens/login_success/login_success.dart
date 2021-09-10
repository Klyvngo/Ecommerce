import 'package:ecomerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/body.dart';

class LoginSuccess extends StatelessWidget {
  static String routeName = '/loginsuccess';
  const LoginSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text(
          'Login Success',
          style: TextStyle(
              color: kPrimaryColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Body(),
    );
  }
}
