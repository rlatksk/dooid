import 'package:dooid/data/accounts.dart';
import 'package:dooid/data/contactProvider.dart';
import 'package:dooid/widgets/shortcuts/colors.dart';
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
  final TextEditingController _currentPinController = TextEditingController();
  final TextEditingController _newPinController = TextEditingController();
  String? _errorMessage;
  bool _isNewPinEnabled = false;

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
          fontSize: 18.0,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _currentPinController,
            decoration: InputDecoration(
              labelText: 'Enter current 6-digit PIN',
              labelStyle: GoogleFonts.montserrat(),
            ),
            keyboardType: TextInputType.number,
            maxLength: 6,
            obscureText: true,
            onChanged: (pin) {
              setState(() {
                if (pin.length == 6 && pin == widget.foundContact.pin) {
                  _isNewPinEnabled = true;
                  _errorMessage = null;
                } else {
                  _isNewPinEnabled = false;
                  _errorMessage = 'Incorrect current PIN';
                }
              });
            },
          ),
          TextField(
            controller: _newPinController,
            decoration: InputDecoration(
              labelText: 'Enter new 6-digit PIN',
              labelStyle: GoogleFonts.montserrat(),
              enabled: _isNewPinEnabled,
            ),
            keyboardType: TextInputType.number,
            maxLength: 6,
            obscureText: true,
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
                style: GoogleFonts.montserrat(
                  color: Colors.red,
                  fontSize: 12.0,
                ),
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
          onPressed: (_isNewPinEnabled)
              ? () {
                  String newPin = _newPinController.text;
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
                }
              : null,
          child: Text(
            'Change',
            style: GoogleFonts.montserrat(),
          ),
        ),
      ],
    );
  }
}
