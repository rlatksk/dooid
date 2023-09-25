import 'package:dooid/screens/home.dart';
import 'package:dooid/screens/widgets/register/register_widgets.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  // Logs in a user with email and password.
  void loginWithEmail(
      {required BuildContext context,
      required String phoneNumber,
      required String password}) async {
    if (phoneNumber == '0812' && password == '123123') {
      await Future.delayed(Duration(seconds: 2));
      wPushReplaceTo(context, HomeScreen());
    } else {
      print('GAGAL');
    }
  }
}

// Temporary Comment
//   // Sends a password reset email.
//   void resetPassword(
//       {required BuildContext context, required String email}) async {
//     if (email.isNotEmpty) {
//       print('BERHASIL');
//       await Future.delayed(Duration(seconds: 2));
//       wShowToast(
//           msg: 'Email sent! Please check your email to reset your password.');
//       Navigator.pop(context);
//     } else {
//       print('GAGAL');
//     }
//   } // Registers a user with provided details.
// }
