import 'dart:io';
import 'package:dooid/screens/auth/pin.dart';
import 'package:dooid/screens/changePin.dart';
import 'package:dooid/splash.dart';
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dooid/screens/TNC.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dooid/screens/auth/data.dart';
import 'package:provider/provider.dart';
import 'package:dooid/provider/UserDataProvider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile? tempo;
  XFile? profile_image;
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataProvider>(context).userData;

    String name = userData!.firstname;
    return Stack(alignment: Alignment.topCenter, children: [
      Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Text(
            'Profile',
            style: GoogleFonts.montserrat(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
              padding: const EdgeInsets.fromLTRB(
                  15, 0, 15, 0), // Remove or reduce top padding
              children: <Widget>[
                SizedBox(
                  height: 140,
                ),
                Text(
                  "Security",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Material(
                    child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePin()),
                    );
                  },
                  title: Text("Change Security Pin"),
                  leading: SvgPicture.asset(
                    "assets/lock.svg",
                    height: 35,
                    width: 35,
                  ),
                  tileColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2.5),
                      borderRadius: BorderRadius.circular(10)),
                )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Help",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Material(
                    child: ListTile(
                  onTap: () async {
                    // ignore: deprecated_member_use
                    launch('tel://021 567 1747');
                  },
                  title: Text("Call Center"),
                  leading: SvgPicture.asset("assets/Call.svg"),
                  tileColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2.5),
                      borderRadius: BorderRadius.circular(10)),
                )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "About Us",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Material(
                    child: ListTile(
                  onTap: () {
                    _launchURL();
                  },
                  title: Text("Dooid Guideline"),
                  leading: SvgPicture.asset(
                    "assets/Guide.svg",
                    height: 35,
                    width: 35,
                  ),
                  tileColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2.5),
                      borderRadius: BorderRadius.circular(10)),
                )),
                SizedBox(
                  height: 10,
                ),
                Material(
                    child: ListTile(
                  onTap: () async {
                    await showDialog<void>(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: Stack(
                                clipBehavior: Clip.none,
                                children: <Widget>[
                                  Form(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Container(
                                                height: 400,
                                                child: Expanded(
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    child: RichText(
                                                      text: TNC.TNCSpan,
                                                    ),
                                                  ),
                                                ))),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: ElevatedButton(
                                            child: const Text(
                                              'Close',
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ));
                  },
                  title: Text(" Terms and Conditions"),
                  leading: SvgPicture.asset(
                    "assets/TNC.svg",
                    height: 35,
                    width: 35,
                  ),
                  tileColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2.5),
                      borderRadius: BorderRadius.circular(10)),
                )),
              ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 700),
        child: GestureDetector(
          onTap: () {
            wPushReplaceTo(
                context, Splash() // This predicate removes all routes
                );
          },
          child: SvgPicture.asset(
            "assets/logout.svg",
            width: MediaQuery.sizeOf(context).width - 30,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 160),
        child: Container(
          width: MediaQuery.sizeOf(context).width - 35,
          height: 125,
          decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(
                width: 2.5,
                style: BorderStyle.solid,
                color: Colors.black26,
              )),
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(130, 205, 0, 0),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width - 25,
          height: 350,
          child: Text(
            "Hello " + name,
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 21),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(0, 230, 0, 0),
        child: SizedBox(
          width: 100,
          height: 350,
          child: Text(
            "",
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(280, 200, 0, 0),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 2.0,
              color: Colors.grey.shade400,
              style: BorderStyle.solid,
            ),
          ),
          onPressed: () {
            getImageGallery();
            // Add the functionality you want when the button is clicked
          },
          child: const Text(
            "Edit",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
      Container(
          padding: const EdgeInsets.fromLTRB(0, 190, 270, 0),
          child: SizedBox(
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.grey.shade600,
              child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.grey.shade500,
                  backgroundImage: profile_image == null
                      ? null
                      : FileImage(File(profile_image!.path)),
                  child: profile_image == null
                      ? CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.grey.shade500,
                          child: SvgPicture.asset("assets/default.svg"))
                      : null),
            ),
          )),
      Container(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 140,
          child: SvgPicture.asset("assets/Bottom.svg"),
        ),
      )
    ]);
    // ]);
  }

  getImageGallery() async {
    profile_image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (profile_image == null) return tempo;
    setState(() {
      profile_image;
      tempo = profile_image;
    });
  }

  _launchURL() async {
    final Uri url = Uri.parse('https://github.com/rlatksk/dooid');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
