import 'package:dooid/widgets/shortcuts/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  final VoidCallback onLogoutConfirmed;

  LogoutConfirmationDialog({required this.onLogoutConfirmed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Text(
        'Are you sure you want to Log Out?',
        style: GoogleFonts.montserrat(
          color: AppColors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.red,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'No',
              style: GoogleFonts.montserrat(),
            ),
          ),
          SizedBox(width: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
            ),
            onPressed: () {
              onLogoutConfirmed();
            },
            child: Text(
              'Yes',
              style: GoogleFonts.montserrat(),
            ),
          ),
        ],
      ),
    );
  }
}
