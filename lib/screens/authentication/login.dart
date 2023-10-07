import 'package:country_picker/country_picker.dart';
import 'package:dooid/data/accounts.dart';
import 'package:dooid/screens/authentication/pin.dart';
import 'package:dooid/widgets/colors.dart';
import 'package:dooid/widgets/shortcuts/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 260),
                Container(
                  width: double.infinity,
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: GoogleFonts.montserrat(
                          fontSize: 32,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Welcome back to Dooid!',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
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
                        Contact contact =
                            findContactByCountryCodeAndPhoneNumber(
                                countryCode, phoneNumber);
                        if (contact.firstName.isNotEmpty) {
                          Navigator.of(context).push(BouncyPageRoute(
                              destinationPage: Pin(contact: contact)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Account not found. Please try again.'),
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
        ],
      ),
    );
  }
}
