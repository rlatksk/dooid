import 'package:dooid/data/accounts.dart';
import 'package:dooid/screens/authentication/changePin.dart';
import 'package:dooid/screens/main/home.dart';
import 'package:dooid/screens/onboarding.dart';
import 'package:dooid/widgets/colors.dart';
import 'package:dooid/widgets/logOut.dart';
import 'package:dooid/widgets/shortcuts/initials.dart';
import 'package:dooid/widgets/shortcuts/wBackButton.dart';
import 'package:dooid/widgets/termsAndConditions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  final Contact foundContact;

  const Profile({super.key, required this.foundContact});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '';
  String? profilePicture;

  @override
  void initState() {
    super.initState();
    name = widget.foundContact.name;
    profilePicture = widget.foundContact.profilePicture;
  }

  Widget buildBigProfileWidget(String? profilePicture, String name) {
    if (profilePicture != null && profilePicture.isNotEmpty) {
      return CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage(profilePicture),
      );
    } else {
      return HomeCircleButtonIconText(
        width: 100,
        height: 100,
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          'Profile',
          style: GoogleFonts.montserrat(
            fontSize: 28,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const wBackButton(),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      floatingActionButton: HomeQRScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: HomeNavBar(
        foundContact: widget.foundContact,
        activeScreen: 'profile',
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Container(
                      width: 200,
                      height: 200,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          buildBigProfileWidget(profilePicture, name),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: HomeCircleButtonIconText(
                                width: 30,
                                height: 30,
                                circleColor: AppColors.red,
                                strokeColor: AppColors.red,
                                insideWidget: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                strokeSize: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        height: 40,
                        child: Text(
                          widget.foundContact.name,
                          style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      widget.foundContact.completePhoneNumber,
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                ProfileButtonList(
                  icon: Icons.lock,
                  text: 'Change your PIN',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PinChangeDialog(
                            foundContact: widget.foundContact);
                      },
                    );
                  },
                ),
                SizedBox(height: 10),
                ProfileButtonList(
                  icon: Icons.read_more,
                  text: 'Check Dooid Guidelines',
                  onTap: () {
                    _launchURL();
                  },
                ),
                SizedBox(height: 10),
                ProfileButtonList(
                  icon: Icons.newspaper,
                  text: 'Terms & Conditions',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          elevation: 0.0,
                          backgroundColor: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dooid E-Money Wallet App - Terms and Conditions',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    text: TNC.TNCSpan,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 10),
                ProfileButtonList(
                  icon: Icons.exit_to_app,
                  text: 'Log Out',
                  onTap: () {
                    showLogoutConfirmationDialog(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse('https://github.com/rlatksk/dooid');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

Future<void> showLogoutConfirmationDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return LogoutConfirmationDialog(
        onLogoutConfirmed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Onboarding()),
            (route) => false,
          );
        },
      );
    },
  );
}

class ProfileButtonList extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ProfileButtonList({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                HomeCircleButtonIconText(
                  width: 35,
                  height: 35,
                  circleColor: AppColors.black,
                  strokeColor: AppColors.black,
                  insideWidget: Icon(
                    icon,
                    color: Colors.white,
                    size: 15,
                  ),
                  strokeSize: 0,
                ),
                SizedBox(width: 10),
                Text(
                  text,
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_right),
          ],
        ),
      ),
    );
  }
}
