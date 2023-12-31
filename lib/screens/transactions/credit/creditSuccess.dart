import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class creditSuccess extends StatelessWidget {
  late String phoneNumber;
  late int nominal;
  late int harga;
  creditSuccess(this.phoneNumber, this.nominal, this.harga);

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.decimalPattern('id_ID');
    final hargaFormatted = formatter.format(harga);
    final nominalFormatted = formatter.format(nominal);

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          shadowColor: Colors.transparent,
          title: Text(
            'Credit',
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
                      SvgPicture.asset('assets/icons/ticketSuccess.svg',
                          width: 300),
                      Container(
                          margin: EdgeInsets.only(top: 90),
                          child: Center(
                              child: Column(children: [
                            Text('Payment Success',
                                style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 100,
                            ),
                            Text(phoneNumber,
                                style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'received',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, color: Color(0xFF8A8A8A)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Credit Voucher",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text('$nominalFormatted',
                                style: GoogleFonts.montserrat(
                                    fontSize: 22,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 16,
                            ),
                            Text("Pay Amount",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Rp$hargaFormatted',
                                style: GoogleFonts.montserrat(
                                    fontSize: 22,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                          ])))
                    ],
                  ),
                  SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () { 
                    Navigator.popUntil(context, (route) => route.isFirst); //--------------------- NEED TO ADJUST WHEN MERGING -----------------------
                  },
                  style: ButtonStyle( 
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(0)
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0))),
                        ),
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFFFF5151), Color(0xFFFF9999)]),
                      borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text(
                        'Back to Home',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
                ]))));
  }
}