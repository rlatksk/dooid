import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeCircleIconImageWidget extends StatelessWidget {
  final Widget iconOrImage;

  const HomeCircleIconImageWidget({
    required this.iconOrImage,
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
          child: Center(child: iconOrImage),
        ),
      ],
    );
  }
}
