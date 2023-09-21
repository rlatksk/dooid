import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';


class wSlider extends StatelessWidget {
  const wSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SlideAction(
        borderRadius: 50,
        innerColor: Color(0xFFFF5151),
        outerColor: Color(0xFF131313),
        text: 'Slide to confirm',
        alignment: Alignment.bottomCenter,
        sliderButtonIcon: SvgPicture.asset('assets/icons/slider_button.svg'),
        sliderButtonIconPadding: 0,
        textStyle: TextStyle(
          fontFamily: 'Montserrat', 
          color: Color(0xFFBABABA)),
        onSubmit: () {
            //Pindah ke screen selanjutnya
        },
      ),
    );
  }
}

class wBackButton extends StatelessWidget {
  const wBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Color(0xFFEDEDED)),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        iconSize: 46,
        icon: SvgPicture.asset('assets/icons/back.svg'),
        onPressed: () {
          //go back
        },
      ),
    );
  }
}