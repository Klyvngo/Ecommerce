import 'package:ecomerce/models/profile.dart';
import 'package:ecomerce/routes.dart';
import 'package:ecomerce/screens/splash/splash_screen.dart';
import 'package:ecomerce/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Profile(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce',
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
