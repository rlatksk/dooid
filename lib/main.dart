import 'package:dooid/provider/auth_provider.dart';
import 'package:dooid/provider/UserDataProvider.dart';
import 'package:dooid/screens/auth/login.dart';
import 'package:dooid/screens/auth/changePin.dart';
import 'package:dooid/screens/home.dart';
import 'package:dooid/screens/profile.dart';
import 'package:dooid/screens/auth/data.dart';
import 'package:dooid/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserDataProvider(),
        ),
      ], child: MyApp()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Login());
  }
}
//test
