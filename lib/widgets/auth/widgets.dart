import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget to display an authentication title and subtitle.
Widget wAuthTitle({required String title, required String subtitle}) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 3),
        Text(
          subtitle,
          style: GoogleFonts.montserrat(fontSize: 18, color: Colors.grey),
        ),
      ],
    ),
  );
}

// Widget to display a horizontal divider with text in between.
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
            style: GoogleFonts.montserrat(
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

// Widget to display a text link with a clickable title.
Widget wTextLink(
    {required String text,
    required String title,
    required VoidCallback onTap}) {
  return Container(
    margin: EdgeInsets.only(top: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: GoogleFonts.montserrat(
            decoration: TextDecoration.underline,
          ),
        ),
        GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold),
              ),
            ),
            onTap: onTap)
      ],
    ),
  );
}

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
      child: Text(title, style: GoogleFonts.montserrat(),),
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