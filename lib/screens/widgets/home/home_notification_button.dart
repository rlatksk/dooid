import 'package:flutter/material.dart';

class HomeNotificationButton extends StatelessWidget {
  const HomeNotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 34,
          width: 34,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.0,
              color: Colors.grey.shade400,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.notifications_none,
              color: Colors.grey.shade500,
              size:16,
            ),
          ),
        ),
      ],
    );
  }
}
