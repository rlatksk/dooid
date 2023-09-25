import 'package:dooid/screens/onboarding.dart';
import 'package:flutter/material.dart';

class HomeBottomBarWidget extends StatelessWidget {
  const HomeBottomBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 26,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                );
              },
              child: Container(
                width: 75,
                height: 75,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF545454),
                      Color(0xFF131313),
                    ],
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/home/scan.png',
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
            ),
          ),
          Image.asset(
            'assets/images/home/bottom_bar.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 50,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Icon(
                    Icons.home_filled,
                    size: 24,
                    color: Colors.red,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.home_filled,
                    size: 24,
                  ),
                  SizedBox(width: 100),
                  Icon(
                    Icons.home_filled,
                    size: 24,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.home_filled,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
