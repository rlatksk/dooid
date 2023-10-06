import 'package:dooid/data/accounts.dart';
import 'package:dooid/screens/main/home.dart';
import 'package:dooid/widgets/colors.dart';
import 'package:dooid/data/contactProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileSetup extends StatefulWidget {
  final String countryCode;
  final String phoneNumber;

  const ProfileSetup(
      {super.key, required this.countryCode, required this.phoneNumber});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController pinController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    DateTime dateTime = DateTime.now();

    String _formatDate(DateTime date) {
      return DateFormat('dd/MM/yyyy').format(date);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
              'assets/images/register_login/profile_setup_background.png',
              fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
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
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 80),
                Container(
                  width: double.infinity,
                  height: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Finish Up',
                        style: GoogleFonts.montserrat(
                          fontSize: 32,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'It’s time to set up your Dooid profile.',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ],
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
                        controller: firstNameController,
                        keyboardType: TextInputType.text,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: AppColors.black,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'First Name',
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 17,
                            color: AppColors.darkGrey,
                          ),
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
                        controller: lastNameController,
                        keyboardType: TextInputType.text,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: AppColors.black,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Last Name',
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 17,
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Make sure it matches your ID name.',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 20),
                DateOfBirthButton(
                  dateController: dateController,
                  onDateTimeChanged: (DateTime newTime) {
                    dateTime = newTime;
                    dateController.text = _formatDate(newTime);
                  },
                ),
                SizedBox(height: 5),
                Text(
                  'You have to be at least 16 to join Dooid.',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 400,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Profile Picture (not done)',
                        style: GoogleFonts.montserrat(
                          fontSize: 17,
                          color: AppColors.darkGrey,
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
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: pinController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        maxLength: 6,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: AppColors.black,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter a 6-digit PIN',
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                          counterText: '',
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
                        if (firstNameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('First Name cannot be empty.'),
                              backgroundColor: AppColors.red,
                            ),
                          );
                          return;
                        }

                        DateTime currentDate = DateTime.now();
                        DateTime sixteenYearsAgo =
                            currentDate.subtract(Duration(days: 16 * 365));
                        if (dateTime.isAfter(sixteenYearsAgo)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('You must be at least 16 years old.'),
                              backgroundColor: AppColors.red,
                            ),
                          );
                          return;
                        }

                        if (pinController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter a 6-digit PIN.'),
                              backgroundColor: AppColors.red,
                            ),
                          );
                          return;
                        }

                        Contact newContact = Contact(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          pin: pinController.text,
                          countryCode: widget.countryCode,
                          phoneNumber: widget.phoneNumber,
                        );

                        ContactProvider contactProvider =
                            Provider.of<ContactProvider>(context,
                                listen: false);

                        contactProvider.addContact(newContact);

                        Contact foundContact =
                            findContactByCountryCodeAndPhoneNumber(
                                widget.countryCode, widget.phoneNumber);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Home(foundContact: foundContact),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Text(
                        'Finish',
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

class DateOfBirthButton extends StatefulWidget {
  final TextEditingController dateController;
  final Function(DateTime) onDateTimeChanged;

  DateOfBirthButton({
    required this.dateController,
    required this.onDateTimeChanged,
  });

  @override
  _DateOfBirthButtonState createState() => _DateOfBirthButtonState();
}

class _DateOfBirthButtonState extends State<DateOfBirthButton> {
  DateTime getInitialDateTime() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.dateController.text.isEmpty
                  ? 'Date of Birth'
                  : widget.dateController.text,
              style: GoogleFonts.montserrat(
                fontSize: 17,
                color: AppColors.darkGrey,
              ),
            ),
          ),
        ),
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                backgroundColor: Colors.white,
                initialDateTime: widget.dateController.text.isEmpty
                    ? getInitialDateTime()
                    : DateFormat('dd/MM/yyyy')
                        .parse(widget.dateController.text),
                maximumDate: DateTime.now().subtract(Duration(days: 1)),
                onDateTimeChanged: (DateTime newTime) {
                  setState(() {
                    widget.onDateTimeChanged(newTime);
                  });
                },
                mode: CupertinoDatePickerMode.date,
              ),
            ),
          );
        },
      ),
    );
  }
}
