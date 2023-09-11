import 'package:dooid/screens/auth/login.dart';
import 'package:dooid/screens/home.dart';
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkUserSementara(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wAppLoading(context)
    );
  }

  void _checkUserSementara(bool user) async {
    await Future.delayed(Duration(seconds: 2));

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => user ? Home() : Login()));
  }
}
