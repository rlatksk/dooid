import 'package:dooid/data/profile.dart';
import 'package:dooid/screens/transfer/transferSuccess.dart';
import 'package:dooid/widgets/TopUpTransfer/wBackButton.dart';
import 'package:dooid/widgets/colors.dart';
import 'package:dooid/widgets/contactProvider.dart';
import 'package:dooid/widgets/format.dart';
import 'package:dooid/widgets/topUpTransfer/contactDropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';

class Transfer extends StatefulWidget {
  final Contact foundContact;

  const Transfer({Key? key, required this.foundContact}) : super(key: key);

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  late Contact _selectedContact;
  late String msg;
  late double amount = 0;
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          'Send',
          style: GoogleFonts.montserrat(
              fontSize: 28,
              color: AppColors.black,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const wBackButton(),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Send to',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ContactDropdown(
                    onContactSelected: (selectedContact) {
                      setState(() {
                        _selectedContact = selectedContact!;
                      });
                    },
                    contacts: contacts),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Message',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      msg = value;
                    });
                  },
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                      fillColor: AppColors.midGrey,
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
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _amountController,
                  onChanged: (value) {
                    setState(() {
                      _amountController.text =
                          formatBalance(double.parse(value));
                      amount = double.parse(value);
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
                      color: AppColors.black),
                  decoration: InputDecoration(
                    label: Center(
                      child: Text('Enter Amount'),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 15),
                    labelStyle: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, color: Color(0xFFBABABA)),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightGrey)),
                    prefixText: 'Rp.',
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
                  innerColor: AppColors.red,
                  outerColor: AppColors.black,
                  text: 'Slide to confirm',
                  alignment: Alignment.bottomCenter,
                  sliderButtonIcon: SvgPicture.asset(
                      'assets/images/transfer_topup/slider_button.svg'),
                  sliderButtonIconPadding: 0,
                  textStyle: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: AppColors.midGrey,
                  ),
                  onSubmit: () {
                    final double senderAmount = -amount;
                    final contactProvider =
                        Provider.of<ContactProvider>(context, listen: false);
                    contactProvider.addTransactionToContact(
                      contacts.indexOf(widget.foundContact),
                      Transaction(
                        name: _selectedContact.name,
                        amount: senderAmount,
                        date: DateTime.now(),
                        message: msg,
                      ),
                    );
                    contactProvider.addTransactionToContact(
                      contacts.indexOf(_selectedContact),
                      Transaction(
                        name: widget.foundContact.name,
                        amount: amount,
                        date: DateTime.now(),
                        message: msg,
                      ),
                    );
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
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
