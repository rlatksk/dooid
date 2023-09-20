import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';

class Transfer extends StatelessWidget {
  const Transfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SlideAction(
              borderRadius: 50,
              innerColor: Color(0xFFFF5151),
              outerColor: Color(0xFF131313),
              text: 'Slide to confirm',
              alignment: Alignment.bottomCenter,
              sliderButtonIcon: SvgPicture.asset('assets/icons/slider_button.svg'),
              textStyle: TextStyle(
                fontFamily: 'Montserrat', 
                color: Color(0xFFBABABA)),
              onSubmit: () {
                  //Pindah ke screen selanjutnya
              },
            ),
          ),),
      )
    );
  }
}