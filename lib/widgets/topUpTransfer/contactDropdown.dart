import 'package:dooid/data/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactDropdown extends StatefulWidget {
  final List<Contact> contacts;
  final Function(Contact?) onContactSelected;
  final Contact? initialSelection;

  ContactDropdown({
    required this.contacts,
    required this.onContactSelected,
    this.initialSelection,
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
                    Text(_selectedContact!.phoneNumber ?? '',
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
                      backgroundImage: contact.profilePicture != null &&
                              contact.profilePicture!.isNotEmpty
                          ? NetworkImage(contact.profilePicture!)
                          : null,
                      child: (contact.profilePicture == null ||
                              contact.profilePicture!.isEmpty)
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
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(contact.name.toUpperCase(),
                            style: GoogleFonts.montserrat(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Text(contact.phoneNumber ?? '',
                            style: GoogleFonts.montserrat(fontSize: 10)),
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
