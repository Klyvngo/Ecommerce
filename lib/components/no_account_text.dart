import 'package:ecomerce/constants.dart';
import 'package:ecomerce/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Don't have a account? ",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(SignUpScreen.routeName);
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(color: kPrimaryColor, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
