import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

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

Widget wAuthTitle({required String title, required String subtitle}) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Login',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 3),
        Text('Enter your email & password'),
      ],
    ),
  );
}

Widget wTextDivider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: <Widget>[
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Or Connect With',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(child: Divider()),
      ],
    ),
  );
}

Widget wGoogleSignIn({required VoidCallback onPressed}) {
  return Container(
    width: double.infinity,
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey,
        fixedSize: const Size(400, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      icon: Icon(Icons.adb),
      label: Text('Google'),
      onPressed:onPressed,
    ),
  );
}

Widget wInputSubmit({required BuildContext context,required String title, required VoidCallback onPressed}) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          fixedSize: const Size(400, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Text(title),
        onPressed:onPressed,
      ),
    );
  }