import 'package:dooid/screens/widgets/home/home_circle_icon.dart';
import 'package:dooid/screens/onboarding.dart';
import 'package:dooid/screens/widgets/home/home_circle_button.dart';
import 'package:dooid/screens/widgets/home/home_circle_button_transfer.dart';
import 'package:dooid/screens/widgets/home/home_name_greetings.dart';
import 'package:dooid/screens/widgets/home/home_notification_button.dart';
import 'package:dooid/screens/widgets/home/home_circle_icon_image.dart';
import 'package:dooid/screens/widgets/home/home_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isBalanceVisible = false;
  bool isSpentTodayVisible = false;

  void toggleBalanceVisibility() {
    setState(() {
      isBalanceVisible = !isBalanceVisible;
    });
  }

  void toggleSpentTodayVisibility() {
    setState(() {
      isSpentTodayVisible = !isSpentTodayVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            // Top Bar
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 32.0,
                  backgroundImage: AssetImage('assets/images/home/nair_guy.jpeg'),
                ),
                SizedBox(
                  width: 10,
                ),
                HomeNameGreetings(),
                Spacer(),
                HomeNotificationButton(),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            // Card
            Stack(
              children: [
                Image.asset(
                  'assets/images/home/Card.png',
                  width: 385,
                ),
                Positioned(
                  top: 50,
                  left: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'your balance',
                        style: GoogleFonts.montserrat(
                          color: Color(0xFFBFBFBF),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            'RP',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          isBalanceVisible
                              ? Text(
                                  '24,365,322.46',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  '********',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: toggleBalanceVisibility,
                            child: Icon(
                              isBalanceVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'spent today',
                        style: GoogleFonts.montserrat(
                          color: Color(0xFFBFBFBF),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            'RP',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFFFF5151),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          isSpentTodayVisible
                              ? Text(
                                  '5,223,447.0',
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFFFF5151),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  '********',
                                  style: GoogleFonts.montserrat(
                                    color: Color(0xFFFF5151),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: toggleSpentTodayVisibility,
                            child: Icon(
                              isSpentTodayVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            // Three Main Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OnboardingScreen()),
                      );
                    },
                    child: HomeCircleWidget(
                      iconOrImage: Image.asset(
                        'assets/images/home/transfer.png',
                        width: 36,
                        height: 36,
                      ),
                      text: 'Send',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardingScreen()),
                    );
                  },
                  child: HomeCircleWidget(
                    iconOrImage: Image.asset(
                      'assets/images/home/topup.png',
                      width: 36,
                      height: 36,
                    ),
                    text: 'Top Up',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OnboardingScreen()),
                      );
                    },
                    child: HomeCircleWidget(
                      iconOrImage: Image.asset(
                        'assets/images/home/more.png',
                        width: 36,
                        height: 36,
                      ),
                      text: 'More',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 23,
            ),
            // Quick Transfer
            Row(
              children: [
                SizedBox(width: 30),
                Text( 
                  'Quick Transfer',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OnboardingScreen()),
                      );
                    },
                    child: HomeCircleTransferWidget(
                      textInside: 'I',
                      text: 'Ivander',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardingScreen()),
                    );
                  },
                  child: HomeCircleTransferWidget(
                    textInside: 'RS',
                    text: 'Richard',
                  )
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardingScreen()),
                    );
                  },
                  child: HomeCircleTransferWidget(
                    textInside: 'RT',
                    text: 'Ruben',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardingScreen()),
                    );
                  },
                  child: HomeCircleTransferWidget(
                    textInside: 'TI',
                    text: 'Tigo',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OnboardingScreen()),
                      );
                    },
                    child: HomeCircleTransferWidget(
                      textInside: 'JC',
                      text: 'Jason',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Recent Transactions
            Row(
              children: [
                SizedBox(width: 30),
                Text( 
                  'Recent Transactions',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 12
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [            
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: HomeCircleIconWidget(
                        textInside: 'JS', 
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'JUSTIN SALIM',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'bayar open bo',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '+',
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'RP',
                                style: GoogleFonts.montserrat(
                                  fontSize: 6,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '750,000.01',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '21 September 2023',
                            style: GoogleFonts.montserrat(
                              fontSize: 8,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 8
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [            
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: HomeCircleIconImageWidget(
                            iconOrImage: Image.asset(
                              'assets/images/home/steam.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'STEAM',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Entertainment - #25544',
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '-',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFF5151),
                                    ),
                                  ),
                                  Text(
                                    'RP',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 6,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFF5151),
                                    ),
                                  ),
                                  Text(
                                    '5,223,447.01',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFF5151),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '21 September 2023',
                                style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // Bottom Bar
            HomeBottomBarWidget(),
          ],
        ),
      ),
    );
  }
}
