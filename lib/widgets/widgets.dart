import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:fluttertoast/fluttertoast.dart';

// Returns a widget representing a loading indicator.
Widget wAppLoading(BuildContext context) {
  return Container(
    color: Theme.of(context).scaffoldBackgroundColor,
    child: Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(),
    ),
  );
}

// Navigates to a new screen using a MaterialPageRoute.
Future wPushTo(BuildContext context, Widget widget) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

// Replaces the current screen with a new screen using a MaterialPageRoute.
Future wPushReplaceTo(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

// Returns a widget representing a submit button.
Widget wInputSubmit({
  required BuildContext context,
  required String title,
  required VoidCallback onPressed,
}) {
  return Container(
    width: 320,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF131313), Color(0xFF505050)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      borderRadius: BorderRadius.circular(50),
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shadowColor: Colors.transparent, 
        onPrimary: Colors.white,
        fixedSize: const Size(400, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Text(title),
      onPressed: onPressed,
    ),
  );
}

// Displays a toast message using Fluttertoast.
Future wShowToast({required String msg}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
  );
}
