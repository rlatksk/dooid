import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.topCenter, children: [
      Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Text(
            'Send',
            style: GoogleFonts.montserrat(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          centerTitle: true,
        ),
      ),
      ListView(
        padding: const EdgeInsets.all(1.0),
      )
      // Container(
      //   color: Colors.white,
      // ),
      // SafeArea(
      //   child: Container(
      //       height: 50,
      //       // color: Colors.red,
      //       child: Text(
      //         "Profile",
      //         style: TextStyle(
      //           color: Colors.black,
      //           decoration: TextDecoration.none,
      //         ),
      //         textAlign: TextAlign.center,
      //       )),
      // )
    ]);
    // ]);
  }
}
      // SafeArea(
      //     child: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
      //   Container(
      //       height: 50,
      //       color: Colors.red,
      //       child: Text(
      //         "Ayam",
      //         style: TextStyle(
      //           color: Colors.black,
      //           decoration: TextDecoration.none,
      //         ),
      //         textAlign: TextAlign.center,
      //       ))
      // ]))
      // Positioned(
      //   top: 80,
      //   child: Container(
      //     child: Text(
      //       "Profile",
      //       style: TextStyle(
      //           fontSize: 25,
      //           decoration: TextDecoration.none,
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold),
      //     ),
      //   ),
      // ),
      // Positioned(
      //   top: 185,
      //   child: Container(
      //     width: MediaQuery.of(context).size.width - 30,
      //     height: 110,
      //     color: Colors.black12,
      //   ),
      // ),
      // Positioned(
      //   top: 340,
      //   child: Container(
      //     width: MediaQuery.of(context).size.width - 30,
      //     height: 370,
      //     color: Colors.black12,
      //   ),
      // ),
      // // Positioned(
      // //   top: 450,
      // //   child: Container(
      // //     width: MediaQuery.of(context).size.width - 30,
      // //     height: 90,
      // //     color: Colors.black12,
      // //   ),
      // // ),
      // // Positioned(
      // //   top: 560,
      // //   child: Container(
      // //     width: MediaQuery.of(context).size.width - 30,
      // //     height: 150,
      // //     color: Colors.black12,
      // //   ),
      // // ),
      // Positioned(
      //     top: 220,
      //     right: 0,
      //     left: 0,
      //     child: Container(
      //         child: Column(
      //       children: <Widget>[
      //         Text(
      //           "Hello Kevin!",
      //           style: TextStyle(
      //             decoration: TextDecoration.none,
      //             color: Colors.black,
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold,
      //           ),
      //           textAlign: TextAlign.center,
      //         ),
      //         Text(
      //           "08123123",
      //           style: TextStyle(
      //             decoration: TextDecoration.none,
      //             color: Colors.black,
      //             fontSize: 12,
      //             fontWeight: FontWeight.w300,
      //           ),
      //           textAlign: TextAlign.center,
      //         ),
      //       ],
      //     ))),
      // Positioned(
      //   top: 230,
      //   right: 40,
      //   child: Container(
      //     child: Text("Edit",
      //         style: TextStyle(
      //           decoration: TextDecoration.none,
      //           color: Colors.black,
      //           fontSize: 15,
      //         )),
      //   ),
      // ),
      // Positioned(
      //     top: 210,
      //     left: 30,
      //     child: CircleAvatar(
      //       radius: 35,
      //       backgroundImage: AssetImage("assets/nair_guy.png"),
      //     )),
      // Positioned(
      //     top: 390,
      //     right: 0,
      //     left: 20,
      //     child: Container(
      //         height: 40,
      //         padding: const EdgeInsets.all(5.0),
      //         margin: const EdgeInsets.fromLTRB(10, 0, 30, 0),
      //         decoration: BoxDecoration(
      //             border: Border(
      //                 bottom: BorderSide(color: Colors.black26, width: 2.0))),
      //         child: Column(
      //           children: <Widget>[
      //             Text(
      //               "Change Security Pin",
      //               style: TextStyle(
      //                 decoration: TextDecoration.none,
      //                 color: Colors.black,
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ],
      //         ))),
      // Positioned(
      //   top: 360,
      //   left: 25,
      //   child: Container(
      //     width: 60,
      //     height: 60,
      //     child: SvgPicture.asset("assets/lock.svg"),
      //   ),
      // ),
      // Positioned(
      //     top: 470,
      //     right: 0,
      //     left: 20,
      //     child: Container(
      //         height: 40,
      //         padding: const EdgeInsets.all(5.0),
      //         margin: const EdgeInsets.fromLTRB(10, 0, 30, 0),
      //         decoration: BoxDecoration(
      //             border: Border(
      //                 bottom: BorderSide(color: Colors.black26, width: 2.0))),
      //         child: Column(
      //           children: <Widget>[
      //             Text(
      //               "Call Center",
      //               style: TextStyle(
      //                 decoration: TextDecoration.none,
      //                 color: Colors.black,
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ],
      //         ))),
      // Positioned(
      //   top: 450,
      //   left: 30,
      //   child: Container(
      //     width: 60,
      //     height: 60,
      //     child: SvgPicture.asset("assets/Call.svg"),
      //     // decoration: BoxDecoration(
      //     //   image: DecorationImage(
      //     //     fit: BoxFit.fitHeight,
      //     //   ),
      //     // ),
      //   ),
      // ),
      // Positioned(
      //     top: 550,
      //     right: 0,
      //     left: 20,
      //     child: Container(
      //         height: 40,
      //         padding: const EdgeInsets.all(5.0),
      //         margin: const EdgeInsets.fromLTRB(10, 0, 30, 0),
      //         decoration: BoxDecoration(
      //             border: Border(
      //                 bottom: BorderSide(color: Colors.black26, width: 2.0))),
      //         child: Column(
      //           children: <Widget>[
      //             Text(
      //               "Dooid Guideline",
      //               style: TextStyle(
      //                 decoration: TextDecoration.none,
      //                 color: Colors.black,
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ],
      //         ))),
      // Positioned(
      //   top: 530,
      //   left: 30,
      //   child: Container(
      //     width: 60,
      //     height: 60,
      //     child: SvgPicture.asset("assets/Guide.svg"),
      //     // decoration: BoxDecoration(
      //     //   image: DecorationImage(
      //     //     fit: BoxFit.fitHeight,
      //     //   ),
      //     // ),
      //   ),
      // ),
      // Positioned(
      //     top: 630,
      //     right: 0,
      //     left: 20,
      //     child: Container(
      //         height: 40,
      //         padding: const EdgeInsets.all(5.0),
      //         margin: const EdgeInsets.fromLTRB(10, 0, 30, 0),
      //         decoration: BoxDecoration(
      //             border: Border(
      //                 bottom: BorderSide(color: Colors.black26, width: 2.0))),
      //         child: Column(
      //           children: <Widget>[
      //             Text(
      //               "Terms and Conditions",
      //               style: TextStyle(
      //                 decoration: TextDecoration.none,
      //                 color: Colors.black,
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ],
      //         ))),
      // Positioned(
      //   top: 610,
      //   left: 30,
      //   child: SizedBox(
      //     width: 60,
      //     height: 60,
      //     child: SvgPicture.asset("assets/TAC.svg"),
      //     // decoration: BoxDecoration(
      //     //   image: DecorationImage(
      //     //     fit: BoxFit.fitHeight,
      //     //   ),
      //     // ),
      //   ),
      // ),
      // Positioned(
      //   top: 715,
      //   left: 0,
      //   right: 0,
      //   child: Container(
      //     width: 60,
      //     height: 60,
      //     padding: const EdgeInsets.all(5.0),
      //     margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      //     child: SvgPicture.asset("assets/logout.svg"),
      //     // decoration: BoxDecoration(
      //     //   image: DecorationImage(
      //     //     fit: BoxFit.fitHeight,
      //     //   ),
      //     // ),
      //   ),
      // ),
      // Positioned(
      //   top: 700,
      //   // left: 0,
      //   // right: 0,
      //   child: SizedBox(
      //     width: MediaQuery.of(context).size.width,
      //     height: 200,
      //     child: SvgPicture.asset("assets/Bottom.svg"),
      //   ),
      // ),
      // // Scaffold(
      // //   body: Center(
      // //     child: SvgPicture.asset("assets/lock.svg"),
      // //   ),
      // // )

