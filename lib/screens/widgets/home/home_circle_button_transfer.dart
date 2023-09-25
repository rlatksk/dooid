import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCircleTransferWidget extends StatelessWidget {
  final String textInside;
  final String text;

  const HomeCircleTransferWidget({
    required this.textInside,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              textInside,
              style: GoogleFonts.montserrat(
                fontSize: 20,
                color: Color(0xFF131313),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 7),
        Text(
          text,
          style: GoogleFonts.montserrat(
            color: Color(0xFFBFBFBF),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
