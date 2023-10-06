import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_countdown/slide_countdown.dart';

class TheCarouselSlider extends StatelessWidget {
  final List<String> carouselImages = [
    'assets/images/promoImage/umm.jpg',
    'assets/images/promoImage/whatif.jpg'
  ];
  final List<DateTime> targetDates = [DateTime(2024), DateTime(2023)];
  //The DateTime format, DateTime(2023, 12, 31, 23, 59, 59)
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselImages.length,
      options: CarouselOptions(
        height: 200.0,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return _buildCarouselItem(context, index, realIndex);
      },
    );
  }

  Widget _buildCarouselItem(BuildContext context, int index, int realIndex) {
    String carouselImage = carouselImages[index];
    DateTime targetDate = targetDates[index];
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            image: AssetImage(carouselImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TimerCountdown(targetDate: targetDate),
            )));
  }
}

class OfferCard extends StatelessWidget {
  final String title;
  final String description;
  final String cardImages;

  const OfferCard({
    super.key,
    required this.title,
    required this.description,
    required this.cardImages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: Image(
                image: AssetImage(cardImages),
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Text(
                    description,
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          //idk its still empty, or just keep it empty,
                        },
                        style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xFF131313)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'See Offer',
                            style: GoogleFonts.montserrat(
                                color: Color(0xFFFF5151),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class CardSroll extends StatelessWidget {
  const CardSroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400, // adjust aja
      child: SingleChildScrollView(
        child: Column(
          children: [
            OfferCard(
                title: '420% Discount',
                description: 'NO NEED TO FKIN PAY',
                cardImages: 'assets/images/promoImage/whatif.jpg'),
            OfferCard(
                title: '69% Discount',
                description:
                    'Pay with Dooid on this restaurant to get your 69% Off',
                cardImages: 'assets/images/promoImage/umm.jpg'),
            OfferCard(
                title: '69% Discount',
                description:
                    'Pay with Dooid on this restaurant to get your 69% Off',
                cardImages: 'assets/images/promoImage/umm.jpg'),
          ],
        ),
      ),
    );
  }
}

class TimerCountdown extends StatefulWidget {
  final DateTime targetDate;
  const TimerCountdown({super.key, required this.targetDate});
  @override
  State<TimerCountdown> createState() => _TimerCountdownState();
}

class _TimerCountdownState extends State<TimerCountdown> {
  late Duration _duration;
  late bool _isTimerDone;

  @override
  void initState() {
    super.initState();
    _isTimerDone = false;
    _calculateTimeRemaining();
  }

  void _calculateTimeRemaining() {
    Duration remainingTime = widget.targetDate.difference(DateTime.now());
    setState(() {
      _duration = remainingTime;
    });

    if (_duration.inMilliseconds <= 0) {
      setState(() {
        _isTimerDone = true;
      });
    } else {
      Future.delayed(Duration(seconds: 1), _calculateTimeRemaining);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isTimerDone
        ? Container(
            decoration: BoxDecoration(
              color: Color(0xFFFF5151),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Expired",
                style:
                    GoogleFonts.montserrat(
                      color: Color(0xFFBABABA), 
                      fontSize: 13),
              ),
            ))
        : SlideCountdown(
            padding: EdgeInsets.all(8),
            slideDirection: SlideDirection.up,
            duration: _duration,
            decoration: BoxDecoration(
                color: Color(0xFFFF5151),
                borderRadius: BorderRadius.circular(30)),
            textStyle:
                GoogleFonts.montserrat(color: Color(0xFFBABABA), fontSize: 13),
            separatorStyle: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 13,
            ),
            onDone: () {
              setState(() {
                _isTimerDone = true;
              });
            },
          );
  }
}