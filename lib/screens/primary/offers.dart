import 'package:dooid/data/accounts.dart';
import 'package:dooid/screens/primary/home.dart';
import 'package:dooid/widgets/etc/offerWidget.dart';
import 'package:dooid/widgets/etc/topUpTransfer/wBackButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Offers extends StatelessWidget {
  final Contact foundContact;

  const Offers({super.key, required this.foundContact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          'Offer',
          style: GoogleFonts.montserrat(
              fontSize: 28,
              color: const Color(0xFF333333),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const wBackButton(),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
        ),
      ),
      floatingActionButton: HomeQRScanButton(foundContact: foundContact),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: HomeNavBar(
        foundContact: foundContact,
        activeScreen: 'offers',
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hot Deals 🔥',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TheCarouselSlider(),
              SizedBox(
                height: 30,
              ),
              Text(
                'Monthly Offer',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: 10),
              CardSroll(),
            ],
          ),
        ),
      ),
    );
  }
}