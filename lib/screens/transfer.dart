
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contact {
    final String name;
    final String phoneNumber;
    final String avatarUrl;

    Contact({required this.name, required this.phoneNumber, required this.avatarUrl});
  }

class Transfer extends StatelessWidget {
  final List<Contact> contacts = [
      Contact(name: 'Jason Chainara Putra', phoneNumber: '+62 895 3286 75755', avatarUrl: ''),
      Contact(name: 'Ivander', phoneNumber: '+1 (987) 654-3210', avatarUrl: ''),
      Contact(name: 'Justin Salim', phoneNumber: '+1 (555) 123-4567', avatarUrl: ''),
      Contact(name: 'Richard Souwiko', phoneNumber: '69', avatarUrl: ''),
      Contact(name: 'Tigo Ilhami Fasyah', phoneNumber: '420', avatarUrl: ''),
      Contact(name: 'Ruben Tobia Chaiyadi', phoneNumber: '123', avatarUrl: ''),
    ];
  final TextEditingController _MsgController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  Transfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          shadowColor: Colors.transparent,
          title: Text('Send', 
          style: GoogleFonts.montserrat(
            fontSize: 28, 
            color: const Color(0xFF333333), 
            fontWeight: FontWeight.bold),
            ),
          centerTitle: true,
          leading: wBackButtonHome('Home'),
          backgroundColor: Colors.white,
          shape:  const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25)),
          
          ),
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(20,20,20,40),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Send to', 
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 20,),
                  ContactDropdown(contacts: contacts),
                  SizedBox(height: 40,),
                  Text('Message', 
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 5,),
                  TextField(
                    controller: _MsgController,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                      fillColor: Color(0xFFBFBFBF),
                      filled: true,
                      hintText: 'Write your messsage',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.transparent),
                      )),
                    minLines: 4,
                    maxLines: 4,
                    style: GoogleFonts.montserrat(),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: _amountController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.montserrat(
                      fontSize: 30, 
                      fontWeight: FontWeight.bold, 
                      color: Color(0xFF131313)),
                    decoration: InputDecoration(
                      label: Center(
                        child: Text('Enter Amount'),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20,10,20,15),
                      labelStyle: GoogleFonts.montserrat( 
                        fontWeight: FontWeight.bold, 
                        color: Color(0xFFBABABA)),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFEDEDED))
                      ),
                      prefixText: 'Rp.',
                      suffixText: '.00',
                      alignLabelWithHint: true,
                      prefixStyle: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFBABABA),
                      ),
                    ),
                  ),
                ],
                
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: wSlider(toWhere: 'Home'),)
            ],
          ),
          
        ),
      );
  }
}

