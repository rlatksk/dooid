import 'package:dooid/data/accounts.dart';
import 'package:dooid/screens/onboarding.dart';
import 'package:dooid/screens/transactions/topup/topUp.dart';
import 'package:dooid/screens/main/transactionsHistory.dart';
import 'package:dooid/screens/transactions/transfer/transfer.dart';
import 'package:dooid/widgets/colors.dart';
import 'package:dooid/data/contactProvider.dart';
import 'package:dooid/widgets/shortcuts/format.dart';
import 'package:dooid/widgets/shortcuts/initials.dart';
import 'package:dooid/widgets/logOut.dart';
import 'package:dooid/widgets/shortcuts/transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final Contact foundContact;
  const Home({super.key, required this.foundContact});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return await showLogoutConfirmationDialog(context);
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeTop(foundContact: widget.foundContact),
                    SizedBox(height: 20),
                    HomeCard(foundContact: widget.foundContact),
                    SizedBox(height: 25),
                    HomeMainButtons(foundContact: widget.foundContact),
                    SizedBox(height: 30),
                    HomeQuickTransfer(foundContact: widget.foundContact),
                    SizedBox(height: 30),
                    HomeRecentTransactions(foundContact: widget.foundContact),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            floatingActionButton: HomeQRScanButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: HomeNavBar(
                foundContact: widget.foundContact, activeScreen: 'home')));
  }

  Future<bool> showLogoutConfirmationDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return LogoutConfirmationDialog(
          onLogoutConfirmed: () {
            Navigator.of(context).pushAndRemoveUntil(
              BouncyPageRoute(destinationPage: Onboarding()),
              (route) => false,
            );
          },
        );
      },
    );
  }
}

class HomeTop extends StatelessWidget {
  final Contact foundContact;

  const HomeTop({
    super.key,
    required this.foundContact,
  });

  Widget _buildProfileWidget(String? profilePicture, String name) {
    if (profilePicture != null && profilePicture.isNotEmpty) {
      return CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(profilePicture),
      );
    } else {
      return HomeCircleButtonIconText(
        width: 65,
        height: 65,
        circleColor: AppColors.black,
        strokeColor: AppColors.black,
        strokeSize: 2,
        insideWidget: Text(
          getInitials(name),
          style: GoogleFonts.montserrat(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String firstName = foundContact.firstName;
    String name = foundContact.name;
    String? profilePicture = foundContact.profilePicture;

    return Padding(
      padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildProfileWidget(profilePicture, name),
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
  final Contact foundContact;

  const HomeCard({
    Key? key,
    required this.foundContact,
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
    double balance = widget.foundContact.balance ?? 0.0;
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
                showSpentToday
                    ? widget.foundContact.calculateTotalAmountForToday()
                    : 0.0,
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
  final Contact foundContact;

  const HomeMainButtons({
    super.key,
    required this.foundContact,
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
  final Contact foundContact;

  const HomeQuickTransfer({
    Key? key,
    required this.foundContact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BuildContext? parentContext = context;

    return Consumer<ContactProvider>(
      builder: (context, contactProvider, child) {
        final recentTransferTransactions =
            contactProvider.getFrequentTransferTransactions(foundContact, 5);

        if (recentTransferTransactions.isEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
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
                Container(
                  width: double.infinity,
                  height: 65,
                  color: AppColors.lightGrey,
                  child: Center(
                    child: Text(
                      'No Transfers Yet',
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

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
                  children: recentTransferTransactions.map((transaction) {
                    return buildTransferWidget(transaction, parentContext);
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTransferWidget(Transaction transaction, BuildContext? context) {
    Contact transferContact = findContactByFullName(transaction.name);

    return HomeCircleButtonIconText(
      width: 65,
      height: 65,
      circleColor: Colors.white,
      strokeColor: AppColors.lightGrey,
      strokeSize: 2,
      insideWidget: Text(
        getInitials(transferContact.name),
        style: GoogleFonts.montserrat(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
      buttonTextWidget: Text(
        transferContact.firstName,
        style: GoogleFonts.montserrat(
          fontSize: 10,
          color: AppColors.darkGrey,
        ),
      ),
      textCircleSpacing: 4,
      navigateToGesture: GestureDetector(
        onTap: () {
          if (context != null) {
            Navigator.of(context).push(
              BouncyPageRoute(
                destinationPage: Transfer(
                  foundContact: foundContact,
                  transferContact: transferContact,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class HomeRecentTransactions extends StatelessWidget {
  final Contact foundContact;

  const HomeRecentTransactions({
    Key? key,
    required this.foundContact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, contactProvider, child) {
        final contactIndex = contacts.indexOf(foundContact);
        final recentTransactions =
            contactProvider.getRecentTransactions(contactIndex, 5).reversed;

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
                  children: recentTransactions.map((transaction) {
                    return buildTransactionWidget(transaction);
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTransactionWidget(Transaction transaction) {
    Widget insideWidget;
    Color circleColor = Colors.white;
    Color strokeColor = AppColors.lightGrey;

    if (transaction.type == 'topup') {
      insideWidget = Image.asset(
        'assets/images/home/topup.png',
        width: 30,
        height: 30,
      );
    } else {
      insideWidget = Text(
        getInitials(transaction.name),
        style: GoogleFonts.montserrat(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                HomeCircleButtonIconText(
                  width: 65,
                  height: 65,
                  circleColor: circleColor,
                  strokeColor: strokeColor,
                  strokeSize: 2,
                  insideWidget: insideWidget,
                ),
                SizedBox(width: 8),
                Container(
                  height: 30,
                  width: 140,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.name.toUpperCase(),
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
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
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 35,
              width: 138,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(
                          transaction.amount >= 0
                              ? Icons.add_circle
                              : Icons.remove_circle,
                          size: 15,
                          color: transaction.amount >= 0
                              ? AppColors.black
                              : AppColors.red,
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
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
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
  final Contact foundContact;
  final String activeScreen;

  const HomeNavBar({
    Key? key,
    required this.foundContact,
    required this.activeScreen,
  }) : super(key: key);

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
                if (activeScreen != 'home') {
                  Navigator.of(context).push(BouncyPageRoute(
                    destinationPage: Home(foundContact: foundContact),
                  ));
                }
              },
              child: Icon(
                Icons.home_filled,
                color: activeScreen == 'home' ? AppColors.red : AppColors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (activeScreen != 'transactions') {
                  Navigator.of(context).push(BouncyPageRoute(
                    destinationPage:
                        TransactionsHistory(foundContact: foundContact),
                  ));
                }
              },
              child: Icon(
                Icons.swap_vert,
                color: activeScreen == 'transactions'
                    ? AppColors.red
                    : AppColors.black,
              ),
            ),
            SizedBox(width: 50),
            GestureDetector(
              onTap: () {
                if (activeScreen != 'offers') {
                  // Navigate to the Offers screen
                }
              },
              child: Icon(
                Icons.local_offer,
                color:
                    activeScreen == 'offers' ? AppColors.red : AppColors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (activeScreen != 'profile') {
                  // Navigate to the Profile screen
                }
              },
              child: Icon(
                Icons.person,
                color:
                    activeScreen == 'profile' ? AppColors.red : AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
