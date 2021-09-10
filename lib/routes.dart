import 'package:ecomerce/screens/home/home_screen.dart';
import 'package:ecomerce/screens/otp/otp_screen.dart';
import 'package:ecomerce/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'screens/login_success/login_success.dart';
import 'screens/signin/sigin_screen.dart';
import 'screens/signup/signup_screen.dart';
import 'screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  LoginSuccess.routeName: (context) => const LoginSuccess(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};
