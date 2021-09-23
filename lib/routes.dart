import 'package:ecomerce/screens/cart/cart_screen.dart';
import 'package:ecomerce/screens/details/details_screen.dart';
import 'package:ecomerce/screens/edit_product/edit_product_screen.dart';
import 'package:ecomerce/screens/edit_product/update_product_screen.dart';
import 'package:ecomerce/screens/profile_edit/profile_home_screens.dart';
import 'package:flutter/material.dart';

import 'screens/home/home_screen.dart';
import 'screens/login_success/login_success.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/profile/profile_screen.dart';
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
  DetailScreen.routeName: (context) => const DetailScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  ProfileHomeScreen.routeName: (context) => const ProfileHomeScreen(),
  EditProductScreen.routeName: (context) => const EditProductScreen(),
  UpdateProduct.routeName: (context) => const UpdateProduct(),
};
