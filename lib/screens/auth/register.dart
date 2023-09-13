import 'package:dooid/screens/auth/verify_phone_number.dart';
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dooid/widgets/widget_auth.dart';
import 'package:dooid/screens/auth/login.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordConf = TextEditingController();

  bool _isLoading = false;

  Widget _inputName() {
    return Container(
      child: TextField(
        controller: _name,
        decoration: InputDecoration(
            hintText: 'Name', helperText: 'Enter your fullname'),
      ),
    );
  }

  Widget _inputPhoneNumber() {
    return Container(
      child: TextField(
          controller: _phoneNumber,
          decoration: InputDecoration(
              hintText: 'Phone Number', helperText: 'Enter your phone number'),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ]),
    );
  }

  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration:
            InputDecoration(hintText: 'Email', helperText: 'Enter your email'),
      ),
    );
  }

  Widget _inputPassword() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: _password,
            decoration: InputDecoration(
                hintText: '*****', helperText: 'Enter your password'),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            controller: _passwordConf,
            decoration: InputDecoration(
                hintText: '*****', helperText: 'Confirm your password'),
          ),
        ),
      ],
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
        context: context, title: 'Register', onPressed: _registerSementara);
  }

  Widget _googleSignIn() {
    return wGoogleSignIn(
      onPressed: () {},
    );
  }

  Widget _textRegister() {
    return wTextLink(
        text: 'Already have an account?',
        title: 'Login',
        onTap: () => wPushReplaceTo(context, Login()));
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
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      wAuthTitle(
                          title: 'Register', subtitle: 'Fill in the form'),
                      _inputName(),
                      _inputPhoneNumber(),
                      _inputEmail(),
                      _inputPassword(),
                      SizedBox(
                        height: 30,
                      ),
                      _inputSubmit(),
                      wTextDivider(),
                      _googleSignIn(),
                      _textRegister(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void _registerSementara() async {
    print('Full Name: ${_email.text}');
    print('Phone Number: ${_phoneNumber.text}');
    print('Password: ${_password.text}');
    print('Password Confirmation: ${_passwordConf.text}');

    setState(() => _isLoading = true);

    await Future.delayed(Duration(seconds: 2));
    wPushReplaceTo(context, Login());

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return VerifyEmail();
        });
  }
}
