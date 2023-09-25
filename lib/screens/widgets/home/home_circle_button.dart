import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeCircleWidget extends StatelessWidget {
  final Widget iconOrImage;
  final String text;

  const HomeCircleWidget({
    required this.iconOrImage,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFEDEDED),
          ),
          child: Center(child: iconOrImage),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
