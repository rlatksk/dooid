import 'package:dooid/screens/auth/otp_login.dart';
import 'package:dooid/screens/auth/register.dart';
import 'package:dooid/utils/utils.dart';
import 'package:dooid/widgets/widget_auth.dart';
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
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
          fillColor: Color(0xFFEDEDED),
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

class _LoginState extends State<Login> {
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
            style: GoogleFonts.montserrat(fontSize: 9, color: Colors.black),
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
        String phoneNumberValue = _phoneNumber.text;

        if(phoneNumberValue.isEmpty || phoneNumberValue.length < 12){
          showSnackbar(
            context: context,
            message: phoneNumberValue.isEmpty
              ? 'Phone number can\'t be empty'
              : 'Phone number should be 12 digits',
        );
          return;
        }
        setState(() => _isLoading = true);
        registerWithEmail(
          context: context,
          phoneNumber: _phoneNumber.text,
        );
      },
    );
  }

  Widget _textRegister() {
    return wTextLink(
        text: 'Don’t have an account yet?',
        title: 'Sign Up',
        onTap: () => wPushReplaceTo(context, Register()),
        fontSize: 13);
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
                                  title: 'Sign In',
                                  subtitle: 'Welcome back to Dooid!',
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
                              height: 30,
                            ),
                            _inputSubmit(),
                            _textRegister(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void registerWithEmail({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    print(phoneNumber);

    await Future.delayed(Duration(seconds: 2));
    wPushReplaceTo(context, OtpLogin());
  }
}
