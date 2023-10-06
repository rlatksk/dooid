import 'package:flutter/material.dart';

class BouncyPageRoute extends PageRouteBuilder {
  final Widget destinationPage;

  BouncyPageRoute({required this.destinationPage})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              destinationPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
