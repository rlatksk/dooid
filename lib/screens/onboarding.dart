import 'package:dooid/screens/authentication/login.dart';
import 'package:dooid/screens/authentication/register.dart';
import 'package:dooid/widgets/shortcuts/transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  void _navigateToRegister(BuildContext context) {
    Navigator.of(context).push(
      BouncyPageRoute(
        destinationPage: Register(),
      ),
    );
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.of(context).push(
      BouncyPageRoute(
        destinationPage: Login(),
      ),
    );
  }

  BoxDecoration _createGradientDecoration(Color color) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [color, Colors.transparent],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset(
              'assets/images/onboarding/onboarding.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 630,
                ),
                Text(
                  'Ready to Dooid?',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Dive into the Cashless Revolution!',
                  style: GoogleFonts.montserrat(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _navigateToRegister(context),
                      child: Column(
                        children: [
                          Container(
                            width: 92,
                            height: 37,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 100,
                            decoration: _createGradientDecoration(Colors.red),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    GestureDetector(
                      onTap: () => _navigateToLogin(context),
                      child: Column(
                        children: [
                          Container(
                            width: 92,
                            height: 37,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 100,
                            decoration: _createGradientDecoration(Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
