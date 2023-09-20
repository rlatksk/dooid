import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget build(BuildContext context) {
  return Column(
    children: [
      Stack(
        children: [
          Positioned(
              left: 0,
              top: 0,
              child: SvgPicture.asset('assets/icons/Back.svg')),
        ],
      ),
    ],
  );
}
