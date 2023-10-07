import 'package:country_picker/country_picker.dart';
import 'package:dooid/screens/authentication/data.dart';
import 'package:dooid/widgets/shortcuts/colors.dart';
import 'package:dooid/widgets/shortcuts/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dooid/data/accounts.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
      phoneCode: "62",
      countryCode: "ID",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Indonesia",
      example: "Indonesia",
      displayName: "Indonesia",
      displayNameNoCountryCode: "ID",
      e164Key: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/register_login/register_login_background.png',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 30,
                          height: 7,
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 30,
                          height: 7,
                          decoration: BoxDecoration(
                            color: AppColors.midGrey,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 205),
                  Container(
                    width: double.infinity,
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign Up',
                          style: GoogleFonts.montserrat(
                            fontSize: 32,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Create your account and revolutionize your finances.',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          onSelect: (value) {
                            setState(() {
                              selectedCountry = value;
                            });
                          });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(selectedCountry.flagEmoji,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        color: AppColors.black,
                                      )),
                                  SizedBox(width: 20),
                                  Text(
                                    '${selectedCountry.name} (+${selectedCountry.phoneCode})',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: AppColors.black,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Phone number',
                            hintStyle: GoogleFonts.montserrat(
                              fontSize: 20,
                              color: AppColors.darkGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.black,
                          Color(0xFF505050),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: ElevatedButton(
                        onPressed: () {
                          String countryCode = selectedCountry.phoneCode;
                          String phoneNumber = phoneController.text;
          
                          if (countryCode.isNotEmpty && phoneNumber.isNotEmpty) {
                            if (phoneNumber.length >= 7) {
                              Contact existingContact =
                                  findContactByCountryCodeAndPhoneNumber(
                                      countryCode, phoneNumber);
                              if (existingContact.firstName.isNotEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'A user with the same country code and phone number already exists.'),
                                    backgroundColor: AppColors.red,
                                  ),
                                );
                                FocusScope.of(context).requestFocus(FocusNode());
                              } else {
                                Navigator.of(context).push(BouncyPageRoute(
                                    destinationPage: ProfileSetup(
                                        countryCode: countryCode,
                                        phoneNumber: phoneNumber)));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Phone number must be at least 7 characters.'),
                                  backgroundColor: AppColors.red,
                                ),
                              );
                              FocusScope.of(context).requestFocus(FocusNode());
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Please enter a valid country code and phone number.'),
                                backgroundColor: AppColors.red,
                              ),
                            );
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Text(
                          'Continue',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
