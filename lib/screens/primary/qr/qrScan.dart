import 'dart:async';

import 'package:dooid/data/accounts.dart';
import 'package:dooid/screens/primary/qr/qrCode.dart';
import 'package:dooid/screens/transactions/transfer/transfer.dart';
import 'package:dooid/widgets/shortcuts/colors.dart';
import 'package:dooid/widgets/shortcuts/transition.dart';
import 'package:dooid/widgets/etc/topUpTransfer/wBackButtonBlack.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScan extends StatefulWidget {
  final Contact foundContact;

  const QrScan({super.key, required this.foundContact});

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  MobileScannerController cameraController = MobileScannerController();
  bool canScan = true;
  Timer? scanCooldownTimer;

  @override
  void dispose() {
    cameraController.dispose();
    scanCooldownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          'QR Scan',
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
      body: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            MobileScanner(
              allowDuplicates: true,
              controller: cameraController,
              onDetect: _foundBarcode,
            ),
            Positioned(
              bottom: 100,
              child: Container(
                width: 180,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.black,
                      Colors.black87,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(BouncyPageRoute(
                          destinationPage:
                              QrCode(foundContact: widget.foundContact)));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Text(
                      'Show your QR Code',
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startCamera() {
    cameraController.start();
  }

  void _stopCamera() {
    cameraController.stop();
  }

  void _foundBarcode(Barcode barcode, MobileScannerArguments? args) {
    if (!canScan) {
      return;
    }

    String code = barcode.rawValue ?? '';
    int? contactIndex = int.tryParse(code);

    setState(() {
      canScan = false;
    });

    if (contactIndex != null &&
        contactIndex >= 0 &&
        contactIndex < contacts.length) {
      if (contactIndex != null &&
          contactIndex >= 0 &&
          contactIndex < contacts.length) {
        if (contactIndex == contacts.indexOf(widget.foundContact)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You scanned your own QR code.'),
              backgroundColor: AppColors.red,
            ),
          );
        } else {
          _stopCamera();
          Contact transferContact = contacts[contactIndex];
          Navigator.of(context)
              .push(BouncyPageRoute(
            destinationPage: Transfer(
              foundContact: widget.foundContact,
              transferContact: transferContact,
            ),
          ))
              .then((_) {
            _startCamera();
          });
        }
      }
    }

    scanCooldownTimer = Timer(Duration(seconds: 2), () {
      setState(() {
        canScan = true;
      });
    });
  }
}
