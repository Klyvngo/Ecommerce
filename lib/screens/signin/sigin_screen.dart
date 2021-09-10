import 'package:ecomerce/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = '/sigin';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Signin',
          style: textStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(child: Body()),
    );
  }
}
