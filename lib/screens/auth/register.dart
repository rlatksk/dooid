import 'package:dooid/screens/auth/login.dart';
import 'package:dooid/screens/auth/otp.dart';
import 'package:dooid/utils/utils.dart';
import 'package:dooid/widgets/widget_auth.dart';
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class NationDropdown extends StatefulWidget {
  @override
  _NationDropdownState createState() => _NationDropdownState();
}

class _NationDropdownState extends State<NationDropdown> {
  String selectedNation = '🇮🇩 Indonesia'; // Default value

  List<Map<String, String>> nations = [
    {'name': '🇺🇸 United States', 'code': '+1'},
    {'name': '🇬🇧 United Kingdom', 'code': '+44'},
    {'name': '🇮🇩 Indonesia', 'code': '+62'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      child: DropdownButtonFormField(
        value: selectedNation,
        onChanged: (String? newValue) {
          setState(() {
            selectedNation = newValue!;
          });
        },
        items:
            nations.map<DropdownMenuItem<String>>((Map<String, String> nation) {
          return DropdownMenuItem<String>(
            value: nation['name'],
            child:
                Container(child: Text('${nation['name']} (${nation['code']})')),
          );
        }).toList(),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFEDEDED), // Set your desired background color
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _RegisterState extends State<Register> {
  TextEditingController _phoneNumber = TextEditingController();
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
                controller: _phoneNumber,
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
            style: GoogleFonts.montserrat(color: Colors.black, fontSize: 9),
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
        registerWithPhoneNumber(
            context: context,
            phoneNumber: _phoneNumber.text,
            );
      },
    );
  }

  Widget _textRegister() {
    return wTextLink(
        text: 'Already have an account?',
        title: 'Sign In',
        onTap: () => wPushReplaceTo(context, Login()),
        fontSize: 13,);
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
                          image: AssetImage('assets/BackgroundD.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 220,
                            ),
                            SizedBox(
                              height: 110,
                              child: Container(
                                width: 320,
                                child: wAuthTitle(
                                  title: 'Sign Up',
                                  subtitle:
                                      'Create your account and revolutionize your finances.',
                                  titleFontSize: 32,
                                  subtitleFontSize: 18,
                                ),
                              ),
                            ),
                            NationDropdown(),
                            SizedBox(
                              height: 20,
                            ),
                            _inputPhoneNumber(),
                            SizedBox(
                              height: 20,
                            ),
                            _inputSubmit(),
                            _textRegister(),
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
                              color: Colors.grey,
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

    void registerWithPhoneNumber(
      {required BuildContext context,
      required String phoneNumber,
      }) async {
    
    print(phoneNumber);
    
    await Future.delayed(Duration(seconds: 2));
    wPushReplaceTo(context, Otp());
  }
}
