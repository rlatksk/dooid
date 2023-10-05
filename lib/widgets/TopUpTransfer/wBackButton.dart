import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class wBackButton extends StatelessWidget {
  const wBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border.all(width: 3, color: Color(0xFFEDEDED)),
      //   shape: BoxShape.circle,

      // ),
      child: IconButton(
        iconSize: 40,
        splashRadius: 27,
        // splashColor: Color(0xFFFF5151),
        color: Colors.white,
        icon: SvgPicture.asset('assets/images/transfer_topup/Back.svg'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
