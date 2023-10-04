import 'package:dooid/screens/home.dart';
import 'package:dooid/widgets/format.dart';
import 'package:dooid/widgets/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TopUpSuccess extends StatelessWidget {
  final String name;
  final double newBalance;
  final double addedAmount;

  TopUpSuccess({
    super.key,
    required this.name,
    required this.newBalance,
    required this.addedAmount,
  });

  @override
  Widget build(BuildContext context) {
    String formattedBalance = formatBalance(newBalance);
    String formmattedAmount = formatBalance(addedAmount);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          'Send',
          style: GoogleFonts.montserrat(
              fontSize: 28,
              color: const Color(0xFF333333),
              fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(25, 0, 25, 200),
        alignment: Alignment.center,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                SvgPicture.asset(
                    'assets/images/transfer_topup/ticketSuccess.svg',
                    width: 300),
                Container(
                  margin: EdgeInsets.only(top: 90),
                  child: Center(
                    child: Column(
                      children: [
                        Text('Transfer Success',
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 110,
                        ),
                        Text(name, //name
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'received',
                          style: GoogleFonts.montserrat(
                              fontSize: 12, color: Color(0xFF8A8A8A)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Rp',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFEDEDED))),
                          TextSpan(
                              text: formmattedAmount,
                              style: GoogleFonts.montserrat(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF5151)))
                        ])),
                        SizedBox(
                          height: 20,
                        ),
                        Text('new balance',
                            style: GoogleFonts.montserrat(
                                fontSize: 12, color: Color(0xFF8A8A8A))),
                        SizedBox(
                          height: 5,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Rp',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFEDEDED))),
                          TextSpan(
                              text: formattedBalance,
                              style: GoogleFonts.montserrat(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFEDEDED)))
                        ]))
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(BouncyPageRoute(destinationPage: Home()));
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0))),
              ),
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFFFF5151), Color(0xFFFF9999)]),
                  borderRadius: BorderRadius.all(Radius.circular(60.0)),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                      minWidth: 88.0,
                      minHeight: 36.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Back to Home',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
