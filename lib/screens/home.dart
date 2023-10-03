import 'dart:math';

import 'package:dooid/data/profile.dart';
import 'package:dooid/screens/topup/topUp.dart';
import 'package:dooid/screens/transfer/transfer.dart';
import 'package:dooid/widgets/colors.dart';
import 'package:dooid/widgets/format.dart';
import 'package:dooid/widgets/initials.dart';
import 'package:dooid/widgets/transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

Contact foundContact =
    findContactByCountryCodeAndPhoneNumber('81', '9876543210');

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeTop(),
                SizedBox(height: 20),
                HomeCard(),
                SizedBox(height: 25),
                HomeMainButtons(),
                SizedBox(height: 30),
                HomeQuickTransfer(),
                SizedBox(height: 30),
                HomeRecentTransactions(),
              ],
            ),
          ),
        ),
        floatingActionButton: HomeQRScanButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: HomeNavBar());
  }
}

class HomeTop extends StatelessWidget {
  const HomeTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String firstName = foundContact.firstName;

    return Padding(
      padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(kevinProfile.profilePicture!),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hello, ',
                        style: GoogleFonts.montserrat(
                            fontSize: 20, color: AppColors.black),
                      ),
                      Text(
                        '${firstName}!',
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.verified_user,
                          size: 12, color: AppColors.darkGrey)
                    ],
                  ),
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: AppColors.midGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          HomeCircleButtonIconText(
            width: 35,
            height: 35,
            circleColor: Colors.white,
            strokeColor: AppColors.midGrey,
            strokeSize: 1,
            insideWidget: Icon(
              Icons.notifications_none_sharp,
              size: 20,
              color: AppColors.midGrey,
            ),
            navigateToGesture: GestureDetector(
              onTap: () {
                print('Notifications Screen');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatefulWidget {
  const HomeCard({
    Key? key,
  }) : super(key: key);

  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool showBalance = false;
  bool showSpentToday = false;

  void toggleBalanceVisibility() {
    setState(() {
      showBalance = !showBalance;
    });
  }

  void toggleSpentTodayVisibility() {
    setState(() {
      showSpentToday = !showSpentToday;
    });
  }

  @override
  Widget build(BuildContext context) {
    double balance = foundContact.balance ?? 0.0;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: Transform.rotate(
            angle: 3 * 3.14 / 180,
            child: Container(
              width: 350,
              height: 190,
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        ),
        Positioned(
          child: Container(
            width: 350,
            height: 190,
            decoration: BoxDecoration(
              color: AppColors.black,
              image: DecorationImage(
                image: AssetImage('assets/images/home/card.png'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        Positioned(
          top: 35,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildToggleText(
                'your balance',
                showBalance ? balance : 0.0,
                showBalance,
                toggleBalanceVisibility,
                AppColors.red,
              ),
              SizedBox(height: 21),
              buildToggleText(
                'spent today',
                showSpentToday ? 522344701 : 0.0,
                showSpentToday,
                toggleSpentTodayVisibility,
                Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildToggleText(String label, double? value, bool show,
      VoidCallback onTap, Color textColor) {
    final formattedBalance = formatBalance(value);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            color: AppColors.midGrey,
          ),
        ),
        SizedBox(height: 3),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'RP',
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.elasticOut,
                );
                return ScaleTransition(
                  scale: Tween<double>(begin: 0.5, end: 1.0)
                      .animate(curvedAnimation),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: Text(
                show ? formattedBalance : '****************',
                key: ValueKey<bool>(show),
                style: GoogleFonts.montserrat(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(
                  show ? Icons.visibility : Icons.visibility_off,
                  color: textColor,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class HomeCircleButtonIconText extends StatelessWidget {
  final double width;
  final double height;
  final Color circleColor;
  final Color strokeColor;
  final double strokeSize;
  final Widget? insideWidget;
  final Widget? buttonTextWidget;
  final double? textCircleSpacing;
  final GestureDetector? navigateToGesture;

  const HomeCircleButtonIconText({
    Key? key,
    required this.width,
    required this.height,
    required this.circleColor,
    required this.strokeColor,
    required this.strokeSize,
    this.insideWidget,
    this.buttonTextWidget,
    this.textCircleSpacing,
    this.navigateToGesture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (navigateToGesture != null) {
          navigateToGesture!.onTap?.call();
        }
      },
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: strokeColor,
                width: strokeSize,
              ),
            ),
            child: Center(
              child: insideWidget ?? SizedBox.shrink(),
            ),
          ),
          if (buttonTextWidget != null)
            SizedBox(
              height: textCircleSpacing ?? 8.0,
            ),
          if (buttonTextWidget != null) buttonTextWidget!,
        ],
      ),
    );
  }
}

class HomeMainButtons extends StatelessWidget {
  const HomeMainButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeCircleButtonIconText(
            width: 85,
            height: 85,
            circleColor: AppColors.lightGrey,
            strokeColor: Colors.white,
            strokeSize: 1,
            insideWidget: Image.asset(
              'assets/images/home/transfer.png',
              width: 40,
              height: 40,
            ),
            buttonTextWidget: Text('Send',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                )),
            textCircleSpacing: 5,
            navigateToGesture: GestureDetector(
              onTap: () {
                Navigator.of(context).push(BouncyPageRoute(
                    destinationPage: Transfer(foundContact: foundContact)));
              },
            ),
          ),
          HomeCircleButtonIconText(
            width: 85,
            height: 85,
            circleColor: AppColors.lightGrey,
            strokeColor: Colors.white,
            strokeSize: 1,
            insideWidget: Image.asset(
              'assets/images/home/topup.png',
              width: 40,
              height: 40,
            ),
            buttonTextWidget: Text('Top Up',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                )),
            textCircleSpacing: 5,
            navigateToGesture: GestureDetector(
              onTap: () {
                Navigator.of(context).push(BouncyPageRoute(
                    destinationPage: TopUp(foundContact: foundContact)));
              },
            ),
          ),
          HomeCircleButtonIconText(
            width: 85,
            height: 85,
            circleColor: AppColors.lightGrey,
            strokeColor: Colors.white,
            strokeSize: 1,
            insideWidget: Image.asset(
              'assets/images/home/more.png',
              width: 40,
              height: 40,
            ),
            buttonTextWidget: Text('More',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: AppColors.black,
                  fontWeight: FontWeight.normal,
                )),
            textCircleSpacing: 5,
            navigateToGesture: GestureDetector(
              onTap: () {
                print('More Screen');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeQuickTransfer extends StatelessWidget {
  const HomeQuickTransfer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Transfer',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeCircleButtonIconText(
                  width: 65,
                  height: 65,
                  circleColor: Colors.white,
                  strokeColor: AppColors.lightGrey,
                  strokeSize: 2,
                  insideWidget: Text(
                    'I',
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  buttonTextWidget: Text(
                    'Ivander',
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  textCircleSpacing: 4,
                  navigateToGesture: GestureDetector(
                    onTap: () {
                      print('Transfer to Ivander Screen');
                    },
                  ),
                ),
                HomeCircleButtonIconText(
                  width: 65,
                  height: 65,
                  circleColor: Colors.white,
                  strokeColor: AppColors.lightGrey,
                  strokeSize: 2,
                  insideWidget: Text(
                    'RS',
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  buttonTextWidget: Text(
                    'Richard',
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  textCircleSpacing: 4,
                  navigateToGesture: GestureDetector(
                    onTap: () {
                      print('Transfer to Richard Screen');
                    },
                  ),
                ),
                HomeCircleButtonIconText(
                  width: 65,
                  height: 65,
                  circleColor: Colors.white,
                  strokeColor: AppColors.lightGrey,
                  strokeSize: 2,
                  insideWidget: Text(
                    'RT',
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  buttonTextWidget: Text(
                    'Ruben',
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  textCircleSpacing: 4,
                  navigateToGesture: GestureDetector(
                    onTap: () {
                      print('Transfer to Ruben Screen');
                    },
                  ),
                ),
                HomeCircleButtonIconText(
                  width: 65,
                  height: 65,
                  circleColor: Colors.white,
                  strokeColor: AppColors.lightGrey,
                  strokeSize: 2,
                  insideWidget: Text(
                    'TI',
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  buttonTextWidget: Text(
                    'Tigo',
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  textCircleSpacing: 4,
                  navigateToGesture: GestureDetector(
                    onTap: () {
                      print('Transfer to Tigo Screen');
                    },
                  ),
                ),
                HomeCircleButtonIconText(
                  width: 65,
                  height: 65,
                  circleColor: Colors.white,
                  strokeColor: AppColors.lightGrey,
                  strokeSize: 2,
                  insideWidget: Text(
                    'JC',
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  buttonTextWidget: Text(
                    'Jason',
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  textCircleSpacing: 4,
                  navigateToGesture: GestureDetector(
                    onTap: () {
                      print('Transfer to Jason Screen');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeRecentTransactions extends StatelessWidget {
  const HomeRecentTransactions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Transaction>? transactions = foundContact.recentTransactions;

    List<Widget> recentTransactionWidgets = [];
    if (transactions != null && transactions.isNotEmpty) { 
      transactions = transactions.reversed.toList();
      for (int i = 0; i < transactions.length; i++) {
        Transaction transaction = transactions[i];
        recentTransactionWidgets.add(
          buildTransactionWidget(transaction),
        );
        if (i < transactions.length - 1) {
          recentTransactionWidgets.add(SizedBox(height: 10));
        }
      }
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Transactions',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: recentTransactionWidgets,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionWidget(Transaction transaction) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            HomeCircleButtonIconText(
              width: 65,
              height: 65,
              circleColor: Colors.white,
              strokeColor: AppColors.lightGrey,
              strokeSize: 2,
              insideWidget: Text(
                getInitials(transaction.name),
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.name.toUpperCase(),
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  transaction.message ?? '',
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    color: AppColors.midGrey,
                  ),
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Icon(
                  transaction.amount >= 0
                      ? Icons.add_circle
                      : Icons.remove_circle,
                  size: 15,
                  color:
                      transaction.amount >= 0 ? AppColors.black : AppColors.red,
                ),
                SizedBox(width: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'RP',
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: transaction.amount >= 0
                            ? AppColors.black
                            : AppColors.red,
                      ),
                    ),
                    Text(
                      formatBalance(transaction.amount.abs()),
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: transaction.amount >= 0
                            ? AppColors.black
                            : AppColors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              transaction.date.toString(),
              style: GoogleFonts.montserrat(
                fontSize: 10,
                color: AppColors.midGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class HomeQRScanButton extends StatelessWidget {
  const HomeQRScanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: FloatingActionButton(
        onPressed: () {
          print('QR Scan');
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF545454), Color(0xFF363636), AppColors.black],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              'assets/images/home/scan.png',
              width: 40,
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  print('Home Screen');
                },
                child: Icon(
                  Icons.home_filled,
                  color: AppColors.red,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Transactions Screen');
                },
                child: Icon(
                  Icons.swap_vert,
                  color: AppColors.black,
                ),
              ),
              SizedBox(width: 50),
              GestureDetector(
                onTap: () {
                  print('Offer Screen');
                },
                child: Icon(
                  Icons.local_offer,
                  color: AppColors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Profile Screen');
                },
                child: Icon(
                  Icons.person,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ));
  }
}
