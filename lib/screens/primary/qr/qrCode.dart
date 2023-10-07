import 'package:dooid/data/accounts.dart';
import 'package:dooid/widgets/shortcuts/colors.dart';
import 'package:dooid/widgets/etc/topUpTransfer/wBackButtonBlack.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatefulWidget {
  final Contact foundContact;
  
  const QrCode({super.key, required this.foundContact});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          'QR Code',
          style: GoogleFonts.montserrat(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const wBackButtonBlack(),
        backgroundColor: AppColors.black,
      ),
      backgroundColor: AppColors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 50, 25, 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                data: contacts.indexOf(widget.foundContact).toString(),
                backgroundColor: Colors.white,
                size: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
