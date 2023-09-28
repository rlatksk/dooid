import 'package:flutter/material.dart';

class BouncyPageRoute extends PageRouteBuilder {
  final Widget destinationPage;

  BouncyPageRoute({required this.destinationPage})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              destinationPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.elasticOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
