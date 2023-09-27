import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TfSuccess extends StatelessWidget {
  final String name;
  final int? amount;
  final String msg;
  TfSuccess({super.key, 
  required this.name, required this.amount, required this.msg, 
});

  @override
  Widget build(BuildContext context) {
    
    String formattedAmount = '';
    if (amount != null) {
      // Create a NumberFormat instance for the desired format
      NumberFormat formatter = NumberFormat("#,###.00", "en_US");

      // Format the integer using the formatter
      formattedAmount = formatter.format(amount); // Assuming you want two decimal places
    }
    
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          shadowColor: Colors.transparent,
          title: Text('Send', 
          style: GoogleFonts.montserrat(
            fontSize: 28, 
            color: const Color(0xFF333333), 
            fontWeight: FontWeight.bold),
            ),
            automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.white,
          shape:  const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25)),
          
          ),
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(25,0,25,200),
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
                        child: Column(
                          children: [
                            Text('Transfer Success', 
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              )),
                              SizedBox(height: 100,),
                              Text(name,
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                )),
                              Text('received', 
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  color: Color(0xFF8A8A8A)
                                ),),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Rp',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFEDEDED)
                                        )
                                    ),
                                    TextSpan(
                                      text: formattedAmount,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFF5151)
                                      )
                                    )
                                  ]
                              )),
                              SizedBox(height: 20,),
                              Container(
                                height: 100,
                                width: 230,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEDEDED),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: Center(
                                  child: Text(msg,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: Color(0xFF131313)
                                  ),),))
                          ],
                        ),
                      ),
                    )
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
              ],
            )),
        ),
    );
  }
}