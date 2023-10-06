import 'package:dooid/screens/more/creditScreen/creditSuccess.dart';
import 'package:dooid/widgets/TopUpTransfer/wBackButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';

void main() => runApp(Credit());

class Credit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreditScreen(),
    );
  }
}

class CreditScreen extends StatefulWidget {
  @override
  _CreditScreenState createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  bool _validatePhoneNumber = false;
  TextEditingController phoneNumberController = TextEditingController();
  late int harga;
  late int nominal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        shadowColor: Colors.grey,
        title: Text(
          'Credit',
          style: GoogleFonts.montserrat(
            fontSize: 28,
            color: const Color(0xFF333333),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const wBackButton(),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone number',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                color: const Color(0xFF333333),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: phoneNumberController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Example: 08123567890',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorStyle: TextStyle(color: Colors.red, fontSize: 14),
                  errorText: _validatePhoneNumber
                      ? 'Phone number must be at least 12 characters'
                      : null,
                ),
                onChanged: (value) {
                  setState(() {
                    _validatePhoneNumber = value.length < 12;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  creditCard(
                    nominal: 5000,
                    harga: 6500,
                    onTap: () {
                      _showConfirmationSheet(5000, 6500);
                    },
                  ),
                  creditCard(
                    nominal: 10000,
                    harga: 11000,
                    onTap: () {
                      _showConfirmationSheet(10000, 11000);
                    },
                  ),
                  creditCard(
                    nominal: 20000,
                    harga: 21000,
                    onTap: () {
                      _showConfirmationSheet(20000, 21000);
                    },
                  ),
                  creditCard(
                    nominal: 50000,
                    harga: 51000,
                    onTap: () {
                      _showConfirmationSheet(50000, 51000);
                    },
                  ),
                  creditCard(
                    nominal: 100000,
                    harga: 101000,
                    onTap: () {
                      _showConfirmationSheet(100000, 101000);
                    },
                  ),
                  creditCard(
                    nominal: 200000,
                    harga: 201000,
                    onTap: () {
                      _showConfirmationSheet(200000, 201000);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationSheet(nominal, harga) {
    final phoneNumber = phoneNumberController.text;

    if (phoneNumber.length >= 12) {
      setState(() {
        _validatePhoneNumber = false; // Reset validasi jika nomor telepon valid
      });

      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          final formatter = NumberFormat.decimalPattern('id_ID');
          final hargaFormatted = formatter.format(harga);
          final nominalFormatted = formatter.format(nominal);

          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              )
            ),
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Information',
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Phone Number',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    Text(
                      '$phoneNumber',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Credit',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    Text(
                      '$nominalFormatted',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  'Purchase Detail',
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    Text(
                      'Rp $hargaFormatted',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fee:',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    Text(
                      'Rp0',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                  indent: 6,
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color(0xFF333333),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp $hargaFormatted',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color(0xFF333333),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: SlideAction(
                  height: 73,
                  borderRadius: 50,
                  innerColor: Color(0xFFFF5151),
                  outerColor: Color(0xFF131313),
                  text: 'Slide to confirm',
                  alignment: Alignment.bottomCenter,
                  sliderButtonIcon:
                      SvgPicture.asset('assets/icons/slider_button.svg'),
                  sliderButtonIconPadding: 0,
                  textStyle: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFFBABABA),
                  ),
                  onSubmit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => creditSuccess(phoneNumber, nominal, harga)
                        ),
                      );
                    ;
                  },
                ),
              ),
            )
              ],
            ),
          );
        },
      );
    } else {
      setState(() {
        _validatePhoneNumber =
            true; // Set validasi jika nomor telepon tidak valid
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Phone number must be at least 12 characters'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

class creditCard extends StatelessWidget {
  final int nominal;
  final int harga;
  final VoidCallback? onTap;

  creditCard({required this.nominal, required this.harga, this.onTap});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.decimalPattern('id_ID');
    final hargaFormatted = formatter.format(harga);
    final nominalFormatted = formatter.format(nominal);

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                '${nominalFormatted}',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Price:',
                style: GoogleFonts.montserrat(
                    fontSize: 14, color: const Color(0xFF333333)),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Rp${hargaFormatted}',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
