import 'package:dooid/data/accounts.dart';
import 'package:dooid/data/contactProvider.dart';
import 'package:dooid/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class PinChangeDialog extends StatefulWidget {
  final Contact foundContact;

  PinChangeDialog({required this.foundContact});

  @override
  _PinChangeDialogState createState() => _PinChangeDialogState();
}

class _PinChangeDialogState extends State<PinChangeDialog> {
  final TextEditingController _pinController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Text(
        'Change PIN',
        style: GoogleFonts.montserrat(
          color: AppColors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _pinController,
            decoration: InputDecoration(labelText: 'Enter new 6-digit PIN'),
            keyboardType: TextInputType.number,
            maxLength: 6,
            obscureText: true, // Hide the entered PIN
            onChanged: (pin) {
              setState(() {
                _errorMessage =
                    (pin.length == 6) ? null : 'Please enter a 6-digit PIN.';
              });
            },
          ),
          if (_errorMessage != null)
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                _errorMessage!,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 12), // Adjust the fontSize here
              ),
            ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.red,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
          ),
          onPressed: () {
            String newPin = _pinController.text;
            if (newPin.length == 6) {
              int contactIndex = contacts.indexOf(widget.foundContact);
              if (contactIndex != -1) {
                Provider.of<ContactProvider>(context, listen: false)
                    .changePin(contactIndex, newPin);
              }
              Navigator.of(context).pop();
            } else {
              setState(() {
                _errorMessage = 'Please enter a 6-digit PIN.';
              });
            }
          },
          child: Text(
            'Change',
            style: GoogleFonts.montserrat(),
          ),
        ),
      ],
    );
  }
}
