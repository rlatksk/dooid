import 'package:dooid/screens/auth/data.dart';
import 'package:dooid/screens/auth/login.dart';
import 'package:dooid/utils/utils.dart';
import 'package:dooid/widgets/widget_auth.dart';
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Otp extends StatefulWidget {
  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  TextEditingController _otpNumber = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  Widget _inputPhoneNumber() {
    return Container(
      width: 320,
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: _otpNumber,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: InputBorder.none,
                ),
                validator: (val) =>
                    uValidator(value: val!, minLength: 12, isRequired: true),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
          ),
          SizedBox(
              height:
                  8), // Add some space between TextFormField and the hint text
          Text(
            'We will send a verification code to your number to confirm it’s you.',
            style: GoogleFonts.montserrat(color: Colors.black, fontSize: 8),
          ),
        ],
      ),
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
      context: context,
      title: 'Continue',
      onPressed: () {
        if (!_formKey.currentState!.validate()) return;
        setState(() => _isLoading = true);
        otpInput(
          context: context,
          otpNumber: _otpNumber.text,
        );
      },
    );
  }

  Widget _textResend() {
    return wTextLink(
      text: "Didn't receive an OTP code?",
      title: 'Resend',
      onTap: () => wPushReplaceTo(context, Login()),
      fontSize: 12,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Background.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 110,
                            ),
                            SizedBox(
                              height: 110,
                              child: Container(
                                width: 320,
                                child: wAuthTitle(
                                  title: 'OTP Verification',
                                  subtitle:
                                      'We have sent an OTP code to your phone number.',
                                  titleFontSize: 32,
                                  subtitleFontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < 5; i++)
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: SizedBox(
                                      height: 70,
                                      width: 57,
                                      child: TextField(
                                        controller: controllers[i],
                                        style: GoogleFonts.montserrat(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(1),
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        onChanged: (value) {
                                          if (i < 4 && value.isNotEmpty) {
                                            FocusScope.of(context).nextFocus();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Do NOT send your OTP code to anybody else.',
                              style: GoogleFonts.montserrat(
                                  color: Colors.black, fontSize: 9),
                            ),
                            SizedBox(height: 40),
                            _inputSubmit(),
                            _textResend(),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(10),
                          ),
                          Container(
                            height: 10,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(10),
                          ),
                          Container(
                            height: 10,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void otpInput({
    required BuildContext context,
    required String otpNumber,
  }) async {
    print(otpNumber);

    await Future.delayed(Duration(seconds: 2));
    wPushReplaceTo(context, Data());
  }
}
