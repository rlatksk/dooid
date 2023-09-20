import 'package:dooid/screens/auth/login.dart';
import 'package:dooid/screens/auth/verify_phone_number.dart';
import 'package:dooid/screens/home.dart';
import 'package:dooid/screens/transfer.dart';
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  // Logs in a user with email and password.
  void loginWithEmail(
      {required BuildContext context,
      required String phoneNumber,
      required String password}) async {
    if (phoneNumber == '0812' && password == '123123') {
      await Future.delayed(Duration(seconds: 2));
      wPushReplaceTo(context, Transfer());
    } else {
      print('GAGAL');
    }
  }

  // Sends a password reset email.
  void resetPassword(
      {required BuildContext context, required String email}) async {
    if (email.isNotEmpty) {
      print('BERHASIL');
      await Future.delayed(Duration(seconds: 2));
      wShowToast(
          msg: 'Email sent! Please check your email to reset your password.');
      Navigator.pop(context);
    } else {
      print('GAGAL');
    }
  }
  
  // Registers a user with provided details.
  void registerWithEmail(
      {required BuildContext context,
      required String name,
      required String phoneNumber,
      required String email,
      required String password}) async {
    print(name);
    print(phoneNumber);
    print(email);
    print(password);

    await Future.delayed(Duration(seconds: 2));
    wPushReplaceTo(context, Login());

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return VerifyEmail();
        });
  }
}
