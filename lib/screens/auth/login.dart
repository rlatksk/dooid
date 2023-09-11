import 'package:dooid/screens/home.dart';
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(
          hintText: 'Email',
        ),
      ),
    );
  }

  Widget _inputPassword() {
    return Stack(
      children: <Widget>[
        Container(
          child: TextField(
            controller: _password,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
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

  Widget _forgotPassword() {
    return GestureDetector(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Text('Forgot Password?'),
        ),
      ),
      onTap: () {
        print('Forgot Password?');
      },
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
        context: context, title: 'Login', onPressed: _loginSementara);
  }

  Widget _googleSignIn() {
    return wGoogleSignIn(
      onPressed: () {},
    );
  }

  Widget _textRegister() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Dont have an account yet?'),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Register',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              print('Register');
            },
          )
        ],
      ),
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
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    wAuthTitle(
                        title: 'Login',
                        subtitle: 'Enter your email & password'),
                    _inputEmail(),
                    _inputPassword(),
                    _forgotPassword(),
                    _inputSubmit(),
                    wTextDivider(),
                    _googleSignIn(),
                    _textRegister(),
                  ],
                ),
              ),
            ),
    );
  }

  void _loginSementara() async {
    setState(() {
      _isLoading = true;
    });

    if (_email.text == 'demo@gmail.com' && _password.text == '123123') {
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      print('GAGAL');
    }
  }
}
