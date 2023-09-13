import 'package:dooid/provider/auth_provider.dart';
import 'package:dooid/screens/auth/forgot_password.dart';
import 'package:dooid/utils/utils.dart';
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dooid/widgets/widget_auth.dart';
import 'package:dooid/screens/auth/register.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _inputPhoneNumber() {
    return Container(
      child: TextFormField(
        controller: _phoneNumber,
        decoration: InputDecoration(
            hintText: 'Phone Number', helperText: 'Enter your phone number'),
        validator: (val) => uValidator(value: val!, isRequired: true),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }

  Widget _inputPassword() {
    return Stack(
      children: <Widget>[
        Container(
          child: TextFormField(
            controller: _password,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
            validator: (val) =>
                uValidator(value: val!, isRequired: true, minLength: 6),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[400],
            ),
            onPressed: () {
              setState(() => _obscureText = !_obscureText);
            },
          ),
        )
      ],
    );
  }

  Widget _inputForgot() {
    return GestureDetector(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
            child: Text('Forgot Password?'),
          ),
        ),
        onTap: () => wPushTo(context, ForgotPassword()));
  }

  Widget _inputSubmit() {
    return wInputSubmit(
      context: context,
      title: 'Login',
      onPressed: () {
        if (!_formKey.currentState!.validate()) return;
        final auth = Provider.of<AuthProvider>(context, listen: false);
        setState(() => _isLoading = true);
        auth.loginWithEmail(
          context: context,
          phoneNumber: _phoneNumber.text,
          password: _password.text,
        );
      },
    );
  }

  Widget _googleSignIn() {
    return wGoogleSignIn(
      onPressed: () {},
    );
  }

  Widget _textRegister() {
    return wTextLink(
        text: 'Dont have an account yet?',
        title: 'Register',
        onTap: () => wPushReplaceTo(context, Register()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      wAuthTitle(
                          title: 'Login',
                          subtitle: 'Enter your phone number & password'),
                      _inputPhoneNumber(),
                      _inputPassword(),
                      _inputForgot(),
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
}
