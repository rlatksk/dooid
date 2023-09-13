import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool _isLoading = false;
  bool _isSent = false;

  Widget _resendEmailButton() {
    return Column(
      children: <Widget>[
        Text('did\'nt recieve an OTP?'),
        TextButton(
          child: Text( _isLoading ? 'Sending' : 'Resend'),
          onPressed: () async {
            setState(() =>
              _isLoading = true
            );

            await Future.delayed(Duration(seconds: 2));

            setState(() {
              _isLoading = false;
              _isSent = true;
            });
          },
        )
      ],
    );
  }

  Widget _resendEmailMsg() {
    return Container(
      child: Text(
        'Email sent!',
        style: TextStyle(color: Colors.green),
      ),
    );
  }

  Widget _bottomWidget() {
    return _isSent ? _resendEmailMsg() : _resendEmailButton();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.2,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(10),
            child: Icon(Icons.drag_handle),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.perm_phone_msg,
                  size: 50,
                ),
                SizedBox(height: 30),
                Text(
                  'Verify your phone number',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'We have sent an OTP to your phone number',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Divider(height: 40, indent: 50, endIndent: 50),
                Text(
                  'Click to verify your number',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Divider(height: 40, indent: 50, endIndent: 50),
                _bottomWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}
