import 'dart:io';
import 'package:dooid/screens/auth/login.dart';
import 'package:dooid/screens/changePin.dart';
import 'package:dooid/screens/home.dart';
import 'package:dooid/splash.dart';
import 'package:dooid/utils/utils.dart';
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dooid/screens/TNC.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:dooid/provider/UserDataProvider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile? tempo;
  XFile? profile_image;
  TextEditingController pincur = TextEditingController();

  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataProvider>(context);

    String name = userData.firstname;
    String phone = userData.phone;
    String photo = userData.photo;

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
                  height: 150,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 8, 8, 0),
                                            child: Container(
                                                height: 50,
                                                child: Expanded(
                                                  child: Text(
                                                    "Enter Your Currenct Pin : ",
                                                  ),
                                                ))),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 15),
                                          child: _inputPin(),
                                        ),
                                        Center(child: _inputSubmit())
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ));
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
            wPushReplaceTo(context, Login());
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
          width: 120,
          height: 350,
          child: Text(
            phone,
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black38,
                fontSize: 14,
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
                  backgroundImage: photo == "" ? null : FileImage(File(photo)),
                  child: photo == ""
                      ? CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.grey.shade500,
                          child: SvgPicture.asset("assets/default.svg"))
                      : null),
            ),
          )),
    ]);
  }

  Widget _inputPin() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFBFBFBF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: pincur,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Your Current Pin',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
              height:
                  8), // Add some space between TextFormField and the hint text
        ],
      ),
    );
  }

  Widget _inputSubmit() {
    final userData = Provider.of<UserDataProvider>(context);
    String pin = userData.pin;
    return wInputSubmit(
      context: context,
      title: 'Continue',
      onPressed: () {
        // if (!_formKey.currentState!.validate()) return;

        String pinValue = pincur.text;

        if (pinValue.isEmpty || pinValue != pin) {
          showSnackbar(
            context: context,
            message: pinValue.isEmpty
                ? 'PIN can\'t be empty'
                : 'PIN doesn\'t match current PIN',
          );
          pincur.text = "";
        } else {
          Navigator.of(context).pop();
          pincur.text = "";
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangePin()),
          );
        }
      },
    );
  }

  getImageGallery() async {
    profile_image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (profile_image == null) return tempo;
    setState(() {
      profile_image;
      tempo = profile_image;
      final userDataProvider =
          Provider.of<UserDataProvider>(context, listen: false);
      userDataProvider.setUserPhoto(tempo!.path);
    });
  }

  _launchURL() async {
    final Uri url = Uri.parse('https://github.com/rlatksk/dooid');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
