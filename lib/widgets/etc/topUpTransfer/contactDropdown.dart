import 'dart:io';

import 'package:dooid/data/accounts.dart';
import 'package:dooid/data/contactProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContactDropdown extends StatefulWidget {
  final List<Contact> contacts;
  final Function(Contact?) onContactSelected;
  final Contact? initialSelection;
  final Contact? currentContact;

  ContactDropdown({
    required this.contacts,
    required this.onContactSelected,
    this.initialSelection,
    this.currentContact,
  });

  @override
  _ContactDropdownState createState() => _ContactDropdownState();
}

class _ContactDropdownState extends State<ContactDropdown> {
  Contact? _selectedContact;

  @override
  void initState() {
    super.initState();
    _selectedContact = widget.initialSelection;
  }

  @override
  Widget build(BuildContext context) {
    final filteredContacts = widget.contacts
        .where((contact) => contact != widget.currentContact)
        .toList();

    return Consumer<ContactProvider>(
      builder: (context, contactProvider, _) {
        return Container(
          width: 420,
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFEDEDED),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButton<Contact>(
              isExpanded: true,
              icon: SvgPicture.asset('assets/images/transfer_topup/down.svg'),
              borderRadius: BorderRadius.circular(15),
              hint: _selectedContact == null
                  ? Text('Select a contact', style: GoogleFonts.montserrat())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_selectedContact!.name.toUpperCase(),
                            style: GoogleFonts.montserrat(fontSize: 18)),
                        Text(_selectedContact!.completePhoneNumber ?? '',
                            style: GoogleFonts.montserrat()),
                      ],
                    ),
              value: _selectedContact,
              onChanged: (newValue) {
                setState(() {
                  _selectedContact = newValue;
                });
                widget.onContactSelected(newValue);
              },
              items: filteredContacts.map<DropdownMenuItem<Contact>>(
                (Contact contact) {
                  return DropdownMenuItem<Contact>(
                    value: contact,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFFEDEDED),
                          radius: 30,
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFEDEDED),
                            radius: 30,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.white,
                              backgroundImage: _getImageForContact(contact),
                              child: (_getImageForContact(contact) == null)
                                  ? Text(
                                      contact.displayProfilePicture,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          color: Color(0xFF131313),
                                          fontWeight: FontWeight.w600),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(contact.name.toUpperCase(),
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text(contact.completePhoneNumber ?? '',
                                  style: GoogleFonts.montserrat(fontSize: 10)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
              underline: Container(height: 0.0, color: Colors.transparent),
            ),
          ),
        );
      },
    );
  }

  ImageProvider? _getImageForContact(Contact contact) {
    final profilePicture = contact.profilePicture;

    if (profilePicture == null || profilePicture.isEmpty) {
      return null; // Show initials
    } else if (profilePicture.startsWith('assets/')) {
      return AssetImage(profilePicture); // Pre-defined asset image
    } else {
      return FileImage(File(profilePicture)); // User-uploaded image
    }
  }
}
