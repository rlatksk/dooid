import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Contact {
  final String name;
  final String phoneNumber;
  final String avatarUrl;

  Contact(
      {required this.name, required this.phoneNumber, required this.avatarUrl});
}

List<Contact> contacts = [
  Contact(
      name: 'Jason Chainara Putra',
      phoneNumber: '+62 895 3286 75755',
      avatarUrl: ''),
  Contact(name: 'Ivander', phoneNumber: '+1 (987) 654-3210', avatarUrl: ''),
  Contact(
      name: 'Justin Salim', phoneNumber: '+1 (555) 123-4567', avatarUrl: ''),
  Contact(name: 'Richard Souwiko', phoneNumber: '69', avatarUrl: ''),
  Contact(name: 'Tigo Ilhami Fasyah', phoneNumber: '420', avatarUrl: ''),
  Contact(name: 'Ruben Tobia Chaiyadi', phoneNumber: '123', avatarUrl: ''),
];

class ContactDropdown extends StatefulWidget {
  final List<Contact> contacts;
  final Function(Contact?) onContactSelected;

  ContactDropdown({required this.contacts, required this.onContactSelected});

  @override
  _ContactDropdownState createState() => _ContactDropdownState();
}

class _ContactDropdownState extends State<ContactDropdown> {
  Contact? _selectedContact;

  String _getAvatarText(Contact contact) {
    if (contact.avatarUrl.isNotEmpty) {
      return '';
    }
    final initials =
        contact.name.split(' ').map((word) => word[0]).take(2).join();
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
        borderRadius:
            BorderRadius.circular(15), // Optional: Add rounded corners
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
                    Text(_selectedContact!.name.toUpperCase(),
                        style: GoogleFonts.montserrat(fontSize: 18)),
                    Text(_selectedContact!.phoneNumber,
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
          items:
              widget.contacts.map<DropdownMenuItem<Contact>>((Contact contact) {
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
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: Color(0xFF131313),
                                  fontWeight: FontWeight.w600),
                            )
                          : null,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(contact.name.toUpperCase(),
                            style: GoogleFonts.montserrat(
                                fontSize: 17, 
                                fontWeight: FontWeight.bold)),
                        Text(contact.phoneNumber,
                            style: GoogleFonts.montserrat(fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          underline: Container(height: 0.0, color: Colors.transparent),
        ),
      ),
    );
  }
}
