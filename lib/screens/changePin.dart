import 'package:dooid/screens/auth/data.dart';
import 'package:dooid/screens/auth/login.dart';
import 'package:dooid/screens/auth/otp.dart';
import 'package:dooid/screens/auth/pin.dart';
import 'package:dooid/utils/utils.dart';
import 'package:dooid/widgets/widget_auth.dart';
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dooid/provider/UserDataProvider.dart';
import 'package:provider/provider.dart';

class ChangePin extends StatefulWidget {
  @override
  State<ChangePin> createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  TextEditingController _pin = TextEditingController();
  TextEditingController _confirmPin = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;

  bool _isLoading = false;

  Widget _inputPin() {
    return Container(
      width: 320,
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFBFBFBF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: _pin,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'PIN',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
                ),
                validator: (val) => uValidator(
                    value: val!, isRequired: true, match: _confirmPin.text),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
              height:
                  8), // Add some space between TextFormField and the hint text
        ],
      ),
    );
  }

  Widget _inputConfirmPin() {
    return Container(
      width: 320,
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFBFBFBF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: _confirmPin,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Pin',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
                ),
                validator: (val) =>
                    uValidator(value: val!, isRequired: true, match: _pin.text),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Text(
            'Choose an easy to remember 6-number combination.',
            style: GoogleFonts.montserrat(color: Colors.black, fontSize: 10),
          ),
          SizedBox(
              height:
                  8), // Add some space between TextFormField and the hint text
        ],
      ),
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
      context: context,
      title: 'Continue',
      onPressed: () {
        setState(() => _isLoading = true);
        changeUp(
          context: context, 
          pin: _pin.text,
          confirmPin: _confirmPin.text,
        );
      },
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
                  alignment: Alignment.center,
                  children: <Widget>[
                    // Center(
                    // child:
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Background.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 80,
                            ),
                            SizedBox(
                              height: 90,
                              child: Container(
                                width: 320,
                                child: wAuthTitle(
                                  title: 'Change Your Pin',
                                  subtitle:
                                      'It’s time to change your security pin.',
                                  titleFontSize: 32,
                                  subtitleFontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            _inputPin(),
                            SizedBox(
                              height: 15,
                            ),
                            _inputConfirmPin(),
                            SizedBox(
                              height: 50,
                            ),
                            _inputSubmit(),
                          ],
                        ),
                      ),
                    ),
                    // ),
                    // Positioned(
                    //   top: 20,
                    //   left: 0,
                    //   right: 0,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       Container(
                    //         height: 10,
                    //         width: 100,
                    //         decoration: BoxDecoration(
                    //           color: Colors.black,
                    //           borderRadius: BorderRadius.circular(100),
                    //         ),
                    //         margin: EdgeInsets.only(right: 10),
                    //         padding: EdgeInsets.all(10),
                    //       ),
                    //       Container(
                    //         height: 10,
                    //         width: 100,
                    //         decoration: BoxDecoration(
                    //           color: Colors.black,
                    //           borderRadius: BorderRadius.circular(100),
                    //         ),
                    //         margin: EdgeInsets.only(right: 10),
                    //         padding: EdgeInsets.all(10),
                    //       ),
                    //       Container(
                    //         height: 10,
                    //         width: 100,
                    //         decoration: BoxDecoration(
                    //           color: Colors.black,
                    //           borderRadius: BorderRadius.circular(100),
                    //         ),
                    //         padding: EdgeInsets.all(10),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
    );
  }

  void changeUp({
    required BuildContext context,
    required String pin,
    required String confirmPin,
  }) async {
    print(pin);
    print(confirmPin);

    final userData =
        Provider.of<UserDataProvider>(context, listen: false).userData;
    String? name = userData!.firstname;

    final userDataProvider =
        Provider.of<UserDataProvider>(context, listen: false);
    userDataProvider.setUserData(name, pin);
    await Future.delayed(Duration(seconds: 2));
    wPushReplaceTo(context, Pin());
  }

  // Getter for firstname

  // Getter for pin
  String get pin => _pin.text;
}
