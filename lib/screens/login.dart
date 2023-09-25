import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset(
            'assets/images/register_login/register_login_background.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}