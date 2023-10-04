import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TheCarouselSlider extends StatelessWidget {
  final List<String> carouselImages = ['assets/promoImage/umm.jpg'];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
          // scrollDirection: Axis.vertical,
          ),
      items: carouselImages.map((assetPath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Image.asset(
                assetPath,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
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
              title: '69% Discount', 
              description: 'Pay with Dooid on this restaurant to get your 69% Off', 
              cardImages: 'assets/promoImage/umm.jpg'),
            OfferCard(
              title: '69% Discount', 
              description: 'Pay with Dooid on this restaurant to get your 69% Off', 
              cardImages: 'assets/promoImage/umm.jpg'),
            OfferCard(
              title: '69% Discount', 
              description: 'Pay with Dooid on this restaurant to get your 69% Off', 
              cardImages: 'assets/promoImage/umm.jpg'),
          ],
        ),
      ),
    );
  }
}
