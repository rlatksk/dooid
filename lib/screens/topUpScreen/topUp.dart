import 'package:dooid/screens/topUpScreen/topUpSuccess.dart';
import 'package:dooid/widgets/TopUpTransfer/wBackButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';

class TopUp extends StatefulWidget {
  
  

  @override
  State<TopUp> createState() => TopUpState();
}

class TopUpState extends State<TopUp> {
  int balance = 100000; // change this
  String userName = 'Leonardo'; // this aswell
  bool isBalanceVisible = true;
  late final String formatted = NumberFormat("#,###.00", "en_US").format(balance);
  late int amount = 0;
  final TextEditingController _controller = TextEditingController();

  void toggleBalanceVisibility() {
    setState(() {
      isBalanceVisible = !isBalanceVisible;
    });
  }

  void updateTextField(int newAmount) {
    setState(() {
      amount = newAmount;
      _controller.text = amount.toString();
    });
  }

  //for that setted amount button
  double btnpaddinghorizontal = 25;
  double btnpaddingvertical = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          'Top Up',
          style: GoogleFonts.montserrat(
              fontSize: 28,
              color: const Color(0xFF333333),
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
                  'Balance',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Color(0xFFECECEC)),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: 'Rp',
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF131313)),
                          ),
                          TextSpan(
                              text: isBalanceVisible ? '******' : formatted,
                              style: GoogleFonts.montserrat(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF131313)))
                        ])),
                        ToogleBalanceButton(
                          isOn: !isBalanceVisible,
                          toggleVisibility: toggleBalanceVisibility,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Text('Set Amount', 
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),),
                TextFormField(
                  controller: _controller,
                    onChanged: (value) {
                      setState(() {
                        try {
                        amount = int.parse(value);
                      } catch (e) {
                        amount = 0;
                      }
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
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddAmountBtn(add: 25, onUpdate: updateTextField,),
                      AddAmountBtn(add: 50, onUpdate: updateTextField,),
                      AddAmountBtn(add: 100, onUpdate: updateTextField,),
                      AddAmountBtn(add: 300, onUpdate: updateTextField,),
                    ],
                  )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Visibility(
                    visible: amount != 0,
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
                        setState(() async {
                          await Future.delayed(const Duration(seconds: 1));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TopUpSuccess(
                                name: userName,
                                newBalance: balance + amount,
                                addedAmount: amount,
                              ),
                            ),
                          );
                        }
                        );
                      },
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AddAmountBtn extends StatelessWidget {
  final int add;
  final Function(int) onUpdate;
  const AddAmountBtn({
    super.key, required this.add, required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onUpdate(add*1000);
      }, 
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Rp',
              style: GoogleFonts.montserrat(
                color: Color(0xFFBABABA),
                fontWeight: FontWeight.bold,
                fontSize: 10)),
              TextSpan(
                text: (add.toString()+"k"),
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                ))
              ]
            )
          ),
        style: TextButton.styleFrom(
          fixedSize: Size(90, 30),
          padding: EdgeInsets.symmetric(
            horizontal: 15, 
            vertical: 10),
          backgroundColor: Color(0xFF131313),
          foregroundColor: Color(0xFFEDEDED),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          )
        ),
        );
  }
}

class ToogleBalanceButton extends StatefulWidget {
  final bool isOn;
  final VoidCallback toggleVisibility;

  ToogleBalanceButton({required this.isOn, required this.toggleVisibility});

  @override
  _ToogleBalanceButtonState createState() => _ToogleBalanceButtonState();
}

class _ToogleBalanceButtonState extends State<ToogleBalanceButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 35,
      icon: widget.isOn
          ? SvgPicture.asset('assets/icons/eye.svg',)
          : SvgPicture.asset('assets/icons/eye_closed.svg'),
      onPressed: () {
        widget.toggleVisibility(); // Toggle the balance visibility
      },
      iconSize: 48.0,
    );
  }
}