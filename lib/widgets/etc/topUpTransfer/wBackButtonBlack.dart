import 'package:dooid/widgets/shortcuts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class wBackButtonBlack extends StatelessWidget {
  const wBackButtonBlack({
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
        color: AppColors.black, 
        icon: SvgPicture.asset(
          'assets/images/transfer_topup/Back.svg',
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
