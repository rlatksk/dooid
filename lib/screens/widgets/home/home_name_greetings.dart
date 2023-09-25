import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeNameGreetings extends StatelessWidget {
  const HomeNameGreetings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Hello, ',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            Text(
              'Name!',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 6),
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.grey.shade400,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/images/home/verified.png',
                height: 10,
                width: 10,
              ),
            ),
          ],
        ),
        Text(
          'Welcome Back!',
          style: GoogleFonts.montserrat(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
