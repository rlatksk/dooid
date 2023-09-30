import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget to display an authentication title and subtitle.
Widget wAuthTitle({required String title, String? subtitle, required double titleFontSize, required double subtitleFontSize}) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.montserrat(fontSize: titleFontSize, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 3),
        Text(
          subtitle ?? '',
          style: GoogleFonts.montserrat(fontSize: subtitleFontSize, color: Colors.grey),
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
    required VoidCallback onTap,
    required double fontSize}) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: GoogleFonts.montserrat(
            decoration: TextDecoration.underline,
            fontSize: fontSize,
          ),
        ),
        GestureDetector(
            child: Container(
              padding: EdgeInsets.all(1),
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,),
              ),
            ),
            onTap: onTap)
      ],
    ),
  );
}
