import 'package:dooid/data/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeTop(),
            HomeCard(),
            SizedBox(height: 5),
            HomeMainButtons()
          ],
        ),
      ),
    );
  }
}

class HomeTop extends StatelessWidget {
  const HomeTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/home/nair_guy.jpeg'),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hello, ',
                        style: GoogleFonts.montserrat(
                          fontSize: 20, 
                          color: Color(0xFF131313)
                        ),
                      ),
                      Text(
                        '${kevinProfile.first_name ?? ''}!',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF131313)
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.verified_user,
                        size: 12,
                        color: Colors.grey.shade400
                      )
                    ],
                  ),
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Home()), // Change Home() to the Notifications Screen
              );
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1, 
                  color: Colors.grey.shade400
                ),
              ),
              child: Icon(
                Icons.notifications_none_sharp,
                color: Colors.grey.shade400,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatefulWidget {
  const HomeCard({
    Key? key,
  }) : super(key: key);

  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool showBalance = false;
  bool showSpentToday = false;

  void toggleBalanceVisibility() {
    setState(() {
      showBalance = !showBalance;
    });
  }

  void toggleSpentTodayVisibility() {
    setState(() {
      showSpentToday = !showSpentToday;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Image.asset(
            'assets/images/home/Card.png',
          ),
        ),
        Positioned(
          top: 40,
          left: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'your balance',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                ),
              ),
              SizedBox(height: 3),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'RP',
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF5151),
                    ),
                  ),
                  Text(
                    showBalance
                        ? kevinProfile.balance ?? ''
                        : '********',
                    style: GoogleFonts.montserrat(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF5151),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: toggleBalanceVisibility,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Icon(
                        showBalance
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(0xFFFF5151),
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 21),
              Text(
                'spent today',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                ),
              ),
              SizedBox(height: 3),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'RP',
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    showSpentToday
                        ? '5,223,447.01'
                        : '********',
                    style: GoogleFonts.montserrat(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: toggleSpentTodayVisibility,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Icon(
                        showSpentToday
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeCircleButtonIconText extends StatelessWidget {
  final double width;
  final double height;
  final Color circleColor;
  final Color strokeColor;
  final IconData? iconData;
  final double? iconSize;
  final ImageProvider? imageProvider;
  final double? imageSize;
  final String? buttonText;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final double? textCircleSpacing;
  final Widget? navigateTo;

  const HomeCircleButtonIconText({
    Key? key,
    required this.width,
    required this.height,
    required this.circleColor,
    required this.strokeColor,
    this.iconData,
    this.iconSize,
    this.imageProvider,
    this.imageSize,
    this.buttonText,
    this.textColor,
    this.textSize,
    this.fontWeight,
    this.textCircleSpacing,
    this.navigateTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (navigateTo != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigateTo!),
          );
        }
      },
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: strokeColor,
                width: 1.0,
              ),
            ),
            child: Center(
              child: iconData != null
                  ? Icon(
                      iconData,
                      size: iconSize,
                      color: Colors.white,
                    )
                  : imageProvider != null
                      ? Image(
                          image: imageProvider!,
                          width: imageSize,
                          height: imageSize,
                        )
                      : SizedBox.shrink(),
            ),
          ),
          if (buttonText != null)
            SizedBox(
              height: textCircleSpacing ?? 8.0,
            ),
          if (buttonText != null)
            Text(
              buttonText!,
              style: GoogleFonts.montserrat(
                fontSize: textSize ?? 14,
                color: textColor,
                fontWeight: fontWeight,
              ),
            ),
        ],
      ),
    );
  }
}

class HomeMainButtons extends StatelessWidget {
  const HomeMainButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
      horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeCircleButtonIconText(
            width: 85,
            height: 85,
            circleColor: Colors.grey.shade300,
            strokeColor: Colors.white,
            imageProvider: AssetImage('assets/images/home/topup.png'),
            imageSize: 40,
            buttonText: 'Send',
            textSize: 12,
            textCircleSpacing: 5,
            fontWeight: FontWeight.normal,
            navigateTo: Home(),
          ),
          HomeCircleButtonIconText(
            width: 85,
            height: 85,
            circleColor: Colors.grey.shade300,
            strokeColor: Colors.white,
            imageProvider: AssetImage('assets/images/home/transfer.png'),
            imageSize: 40,
            buttonText: 'Top Up',
            textSize: 12,
            textCircleSpacing: 5,
            fontWeight: FontWeight.normal,
            navigateTo: Home(),
          ),
          HomeCircleButtonIconText(
            width: 85,
            height: 85,
            circleColor: Colors.grey.shade300,
            strokeColor: Colors.white,
            imageProvider: AssetImage('assets/images/home/more.png'),
            imageSize: 40,
            buttonText: 'More',
            textSize: 12,
            textCircleSpacing: 5,
            fontWeight: FontWeight.normal,
            navigateTo: Home(),
          ),
        ],
      ),
    );
  }
}