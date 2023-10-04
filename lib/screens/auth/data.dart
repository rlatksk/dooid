import 'package:dooid/screens/auth/login.dart';
import 'package:dooid/screens/auth/pin.dart';
import 'package:dooid/utils/utils.dart';
import 'package:dooid/widgets/widget_auth.dart';
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Data extends StatefulWidget {
  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pin = TextEditingController();
  TextEditingController _confirmPin = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  String? value;

  bool _isLoading = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Widget _inputBirthday() {
    return Container(
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(8),
            ),
            child: GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                width: 320,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  selectedDate != null
                      ? "${selectedDate?.toLocal()}".split(' ')[0]
                      : "Birthday (dd/mm/yyyy)",
                  style: GoogleFonts.montserrat(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'You have to be at least 16 to join Dooid.',
            style: GoogleFonts.montserrat(color: Colors.black, fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _inputFirstName() {
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
                controller: _firstName,
                decoration: InputDecoration(
                  hintText: 'First Name',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (val) => uValidator(value: val!, isRequired: true),
                style: GoogleFonts.montserrat(),
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

  Widget _inputLastName() {
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
                controller: _lastName,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (val) => uValidator(value: val!, isRequired: true),
                style: GoogleFonts.montserrat(),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Make sure it matches your ID name.',
            style: GoogleFonts.montserrat(color: Colors.black, fontSize: 10),
          ), // Add some space between TextFormField and the hint text
        ],
      ),
    );
  }

  Widget _inputEmail() {
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
                controller: _email,
                decoration: InputDecoration(
                  hintText: 'Email (optional)',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (val) =>
                    uValidator(value: val!, isEmail: true, isRequired: false),
                style: GoogleFonts.montserrat(),
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
                onChanged: (text){
                  value = text;
                },
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
        if (!_formKey.currentState!.validate()) return;
        if (selectedDate == null) {
          showSnackbar(
            context: context,
            message: 'Please select your birthday',
          );
          return;
        }
        DateTime today = DateTime.now();
        DateTime minimumDate = today.subtract(Duration(days: 16 * 365));
        if (selectedDate!.isAfter(minimumDate)) {
          showSnackbar(
            context: context,
            message: 'You have to be at least 16 to join Dooid.',
          );
          return;
        }
        setState(() => _isLoading = true);
        finishUp(
          context: context,
          firstName: _firstName.text,
          lastName: _lastName.text,
          email: _email.text,
          pin: _pin.text,
          confirmPin: _confirmPin.text,
          selectedDate: selectedDate!,
        );
      },
    );
  }

  Widget _textRegister() {
    return wTextLink(
        text: 'By signing up, you have agreed to our',
        title: 'Terms and Conditions.',
        onTap: () => wPushReplaceTo(context, Login()),
        fontSize: 10);
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
                              height: 80,
                            ),
                            SizedBox(
                              height: 85,
                              child: Container(
                                width: 320,
                                child: wAuthTitle(
                                  title: 'Finish Up',
                                  subtitle:
                                      'It’s time to set up your Dooid profile.',
                                  titleFontSize: 32,
                                  subtitleFontSize: 15,
                                ),
                              ),
                            ),
                            _inputFirstName(),
                            SizedBox(
                              height: 10,
                            ),
                            _inputLastName(),
                            SizedBox(
                              height: 20,
                            ),
                            _inputBirthday(),
                            SizedBox(
                              height: 20,
                            ),
                            _inputEmail(),
                            SizedBox(
                              height: 15,
                            ),
                            _inputPin(),
                            _inputConfirmPin(),
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

  void finishUp({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String email,
    required String pin,
    required String confirmPin,
    required DateTime selectedDate,
  }) async {
    print(firstName);
    print(lastName);
    print(email);
    print(pin);
    print(confirmPin);
    print(selectedDate);

    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pin(value: _pin.text)));
  }
}
