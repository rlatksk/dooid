import 'package:dooid/screens/home.dart';
import 'package:dooid/screens/transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:io' show Platform;

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Returns a widget representing a loading indicator.
Widget wAppLoading(BuildContext context) {
  return Container(
    color: Theme.of(context).scaffoldBackgroundColor,
    child: Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(),
    ),
  );
}

// Navigates to a new screen using a MaterialPageRoute.
Future wPushTo(BuildContext context, Widget widget) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

// Replaces the current screen with a new screen using a MaterialPageRoute.
Future wPushReplaceTo(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

// Returns a widget representing a submit button.
Widget wInputSubmit(
    {required BuildContext context,
    required String title,
    required VoidCallback onPressed}) {
  return Container(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        fixedSize: const Size(400, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Text(title),
      onPressed: onPressed,
    ),
  );
}

// Displays a toast message using Fluttertoast.
Future wShowToast({required String msg}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
  );
}

class wSlider extends StatelessWidget {
    final String toWhere;

    const wSlider({
      super.key, required this.toWhere,
    });

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(15,0,15,0),
        child: SlideAction(
          height: 73,
          borderRadius: 50,
          innerColor: Color(0xFFFF5151),
          outerColor: Color(0xFF131313),
          text: 'Slide to confirm',
          alignment: Alignment.bottomCenter,
          sliderButtonIcon: SvgPicture.asset('assets/icons/slider_button.svg'),
          sliderButtonIconPadding: 0,
          textStyle: const TextStyle(
            fontFamily: 'Montserrat', 
            color: Color(0xFFBABABA)),
          onSubmit: () {
              if (toWhere == 'Home') {
                Home();
              }
          },
        ),
      );
    }
  }

  class wBackButtonHome extends StatelessWidget {
    
    const wBackButtonHome(String s, {
      super.key,
    });

    @override
    Widget build(BuildContext context) {
      return Container(
        // decoration: BoxDecoration(
        //   border: Border.all(width: 3, color: Color(0xFFEDEDED)),
        //   shape: BoxShape.circle,
          
        // ),
        child: IconButton(
          iconSize: 40,
          splashRadius: 27,
          // splashColor: Color(0xFFFF5151),
          color: Colors.white,
          icon: SvgPicture.asset('assets/icons/back.svg'),
          onPressed: () {
            Home();
          },
        ),
      );
    }
  }

  class ContactDropdown extends StatefulWidget {
    final List<Contact> contacts;

    ContactDropdown({required this.contacts});

    @override
    _ContactDropdownState createState() => _ContactDropdownState();
  }

  class _ContactDropdownState extends State<ContactDropdown> {
    Contact? _selectedContact;

    String _getAvatarText(Contact contact) {
      if (contact.avatarUrl.isNotEmpty) {
        return '';
      }
      final initials = contact.name.split(' ').map((word) => word[0]).take(2).join();
      return initials;
    }

    @override
    Widget build(BuildContext context) {
      return Container(
        width: 420, // Adjust the width as needed
        height: 70, // Adjust the height as needed
        decoration: BoxDecoration(
        border: Border.all(
        color: Color(0xFFEDEDED), // Specify the border color
        width: 2.0, // Specify the border width
      ),
      borderRadius: BorderRadius.circular(15), // Optional: Add rounded corners
    ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButton<Contact>(
            isExpanded: true,
            icon: SvgPicture.asset('assets/icons/down.svg'),
            borderRadius: BorderRadius.circular(15),
            hint: _selectedContact == null
                ? Text('Select a contact', style: GoogleFonts.montserrat())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_selectedContact!.name.toUpperCase(), style: GoogleFonts.montserrat(fontSize: 18)),
                      Text(_selectedContact!.phoneNumber, style: GoogleFonts.montserrat()),
                    ],
                  ),
            value: _selectedContact,
            onChanged: (newValue) {
              setState(() {
                
                  _selectedContact = newValue;
                
              });
            },
            items: widget.contacts.map<DropdownMenuItem<Contact>>((Contact contact) {
              return DropdownMenuItem<Contact>(
                
                value: contact,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFFEDEDED),
                      radius: 30,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                        backgroundImage: contact.avatarUrl.isNotEmpty
                            ? NetworkImage(contact.avatarUrl)
                            : null,
                        child: contact.avatarUrl.isEmpty
                            ? Text(
                                _getAvatarText(contact),
                                style: GoogleFonts.montserrat(fontSize: 20, color: Color(0xFF131313), fontWeight: FontWeight.w600),
                              )
                            : null,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contact.name.toUpperCase(), style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.bold)),
                          Text(contact.phoneNumber, style: GoogleFonts.montserrat(fontSize: 10)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            underline: Container(
              height: 0.0,
              color: Colors.transparent
            ),
          ),
        ),
      );
    }
  }