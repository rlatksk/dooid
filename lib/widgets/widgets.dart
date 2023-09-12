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

Widget wInputSubmit(
    {required BuildContext context,
    required String title,
    required VoidCallback onPressed}) {
  return Container(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        fixedSize: const Size(400, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Text(title),
      onPressed: onPressed,
    ),
  );
}
