import 'package:dooid/data/accounts.dart';
import 'package:dooid/screens/main/home.dart';
import 'package:dooid/widgets/colors.dart';
import 'package:dooid/widgets/shortcuts/format.dart';
import 'package:dooid/widgets/shortcuts/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TfSuccess extends StatelessWidget {
  final Contact foundContact;
  String name;
  double? amount;
  String msg;

  TfSuccess({
    super.key,
    required this.foundContact,
    required this.name,
    required this.amount,
    required this.msg,
  });

  @override
  Widget build(BuildContext context) {
    String formattedAmount = formatBalance(amount);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          'Send',
          style: GoogleFonts.montserrat(
              fontSize: 28,
              color: AppColors.black,
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
                          height: 100,
                        ),
                        Text(name,
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text(
                          'received',
                          style: GoogleFonts.montserrat(
                              fontSize: 12, color: AppColors.darkGrey),
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
                              text: formattedAmount,
                              style: GoogleFonts.montserrat(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.red))
                        ])),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 100,
                            width: 230,
                            decoration: BoxDecoration(
                                color: Color(0xFFEDEDED),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                msg,
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, color: AppColors.black),
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(BouncyPageRoute(destinationPage: Home(foundContact: foundContact)));
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
                      colors: [AppColors.red, Color(0xFFFF9999)]),
                  borderRadius: BorderRadius.all(Radius.circular(60.0)),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                      minWidth: 88.0,
                      minHeight: 36.0), // min sizes for Material buttons
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
