import 'package:dooid/utils/utils.dart';
import 'package:dooid/widgets/widget_auth.dart';
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _email = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Widget _inputEmail() {
    return Container(
      child: TextFormField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration:
            InputDecoration(hintText: 'Email', helperText: 'Enter your email'),
        validator: (val) =>
            uValidator(value: val!, isEmail: true, isRequired: true),
      ),
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
        context: context, title: 'Send', onPressed: _forgotPasswordSementara);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      wAuthTitle(
                        title: 'Forgot Password ?',
                        subtitle:
                            'Enter your email and we will send you a link \nto reset your password',
                      ),
                      _inputEmail(),
                      SizedBox(
                        height: 20,
                      ),
                      _inputSubmit(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void _forgotPasswordSementara() async {
    if (!_formKey.currentState!.validate()) return;
    if (_email.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      print('BERHASIL');
      await Future.delayed(Duration(seconds: 2));
      wShowToast(
          msg: 'Email sent! Please check your email to reset your password.');
      Navigator.pop(context);
    } else {
      print('GAGAL');
    }
  }
}
