
import 'package:dooid/screens/transferScreen/transferSuccess.dart';
import 'package:dooid/widgets/TopUpTransfer/contacts.dart';
import 'package:dooid/widgets/TopUpTransfer/wBackButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';


class Transfer extends StatefulWidget {

  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  late Contact _selectedContact;
  late String msg;
  late int amount;


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
          leading: const wBackButton(),
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
                  ContactDropdown(
                    onContactSelected: (selectedContact) {
                      setState(() {
                        _selectedContact = selectedContact!;
                      });
                    }, contacts: contacts
                  ),
                  SizedBox(height: 40,),
                  Text('Message', 
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 5,),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        msg = value;
                      });
                    },
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
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        amount = int.parse(value);
                      });
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: SlideAction(
                    height: 73,
                    borderRadius: 50,
                    innerColor: Color(0xFFFF5151),
                    outerColor: Color(0xFF131313),
                    text: 'Slide to confirm',
                    alignment: Alignment.bottomCenter,
                    sliderButtonIcon: SvgPicture.asset('assets/icons/slider_button.svg'),
                    sliderButtonIconPadding: 0,
                    textStyle: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFFBABABA),
                    ),
                    onSubmit: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TfSuccess(
                              name: _selectedContact.name,
                              amount: amount, 
                              msg: msg,
                            ),
                          ),
                        );
                      }
                      );
                    },
                  ),
                )
                ,)
            ],
          ),
          
        ),
      );
  }
}

