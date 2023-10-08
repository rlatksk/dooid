import 'dart:io';

import 'package:dooid/data/accounts.dart';
import 'package:dooid/data/contactProvider.dart';
import 'package:dooid/screens/authentication/changePin.dart';
import 'package:dooid/screens/primary/home.dart';
import 'package:dooid/screens/onboarding.dart';
import 'package:dooid/widgets/shortcuts/colors.dart';
import 'package:dooid/widgets/etc/logOut.dart';
import 'package:dooid/widgets/shortcuts/initials.dart';
import 'package:dooid/widgets/etc/topUpTransfer/wBackButton.dart';
import 'package:dooid/widgets/etc/termsAndConditions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
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
  late ContactProvider contactProvider;

  @override
  void initState() {
    super.initState();
    name = widget.foundContact.name;
    profilePicture = widget.foundContact.profilePicture;

    contactProvider = Provider.of<ContactProvider>(context, listen: false);
    contactProvider.addListener(_onContactProviderChange);
  }

  @override
  void dispose() {
    contactProvider.removeListener(_onContactProviderChange);
    super.dispose();
  }

  void _onContactProviderChange() {
    final contactIndex = contactProvider.contacts.indexOf(widget.foundContact);
    if (contactIndex != -1) {
      setState(() {
        profilePicture = contactProvider.contacts[contactIndex].profilePicture;
      });
    }
  }

  Widget buildBigProfileWidget(String? profilePicture, String name) {
    if (profilePicture != null && profilePicture.isNotEmpty) {
      if (profilePicture.startsWith('assets/')) {
        return CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage(profilePicture),
        );
      } else {
        return CircleAvatar(
          radius: 100,
          backgroundImage: FileImage(File(profilePicture)),
        );
      }
    } else {
      return HomeCircleButtonIconText(
        width: 200,
        height: 200,
        circleColor: AppColors.black,
        strokeColor: AppColors.black,
        strokeSize: 2,
        insideWidget: Text(
          getInitials(name),
          style: GoogleFonts.montserrat(
            fontSize: 100,
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
      floatingActionButton: HomeQRScanButton(foundContact: widget.foundContact),
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
                    padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
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
                                navigateToGesture: GestureDetector(
                                  onTap: () {
                                    _showImageSelectionDialog(context);
                                  },
                                ),
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

  void _showImageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Select Profile Picture',
            style: GoogleFonts.montserrat(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildImageOption('None', null, Icons.clear),
              _buildImageOption('Ivander',
                  'assets/images/profile_pictures/ivander.png', null),
              _buildImageOption(
                  'Jason', 'assets/images/profile_pictures/jason.png', null),
              _buildImageOption(
                  'Justin', 'assets/images/profile_pictures/justin.png', null),
              _buildImageOption('Richard',
                  'assets/images/profile_pictures/richard.jpeg', null),
              _buildImageOption(
                  'Ruben', 'assets/images/profile_pictures/ruben.png', null),
              _buildImageOption(
                  'Tigo', 'assets/images/profile_pictures/tigo.jpeg', null),
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.add, size: 30, color: AppColors.red),
                ),
                title: Text('Upload',
                    style: GoogleFonts.montserrat(
                      color: AppColors.black,
                    )),
                onTap: () {
                  _getImageFromGallery(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImageOption(String title, String? imagePath, IconData? icon) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: (imagePath != null)
            ? CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(imagePath),
              )
            : Icon(
                icon,
                size: 30,
                color: AppColors.black,
              ),
      ),
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          color: AppColors.black,
        ),
      ),
      onTap: () {
        _updateProfilePicture(imagePath);
        Navigator.of(context).pop();
      },
    );
  }

  void _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _updateProfilePicture(pickedFile.path);
      Navigator.of(context).pop();
    }
  }

  void _updateProfilePicture(String? newProfilePicture) {
    final contactIndex = contacts.indexOf(widget.foundContact);
    if (contactIndex != -1) {
      Provider.of<ContactProvider>(context, listen: false)
          .changeProfilePicture(contactIndex, newProfilePicture);
    }
  }

  _launchURL() async {
    final Uri url = Uri.parse(
        'https://drive.google.com/file/d/17mZzV11YAnHlpD2tFWZ6K85ltRqCMbOO/view?usp=sharing');
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
