
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return SafeArea (
    child : Container (
      width: MediaQuery. of(context). size. width,
      height: MediaQuery. of(context). size. height,
      color: Colors.white,
        child: Stack(
          children: [
            Center(
            child: Container(
                width: 271,
                height: 271,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/logob.png"),
                          ),
                        ),
                      ),
            ),
              SizedBox(
                width: MediaQuery. of(context). size. width,
                height: MediaQuery. of(context). size. height,
                child: Stack(
                  children: [
                      Opacity(
                        opacity: 0.3,
                        child: Container(
                        width: MediaQuery. of(context). size. width,
                        height: MediaQuery. of(context). size. height,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                    "assets/back3.png"),
                                  fit: BoxFit.fill,
                            ),
                          ),
                        )
                        // ),
                      ),
                    ],
                  ),
                ),
            Stack(
              children: [
                Opacity(
                  opacity: 0.3,
                  child: SizedBox(
                    width: MediaQuery. of(context). size. width,
                    height: MediaQuery. of(context). size. height,
                    child: Stack(
                      children: [
                          Opacity(
                            opacity: 0.3,
                              child: Container(
                                width: MediaQuery. of(context). size. width,
                                height: MediaQuery. of(context). size. height,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                    "assets/back3.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          // ),
                        ],
                      ),    
                    ),
                  ),
                ]
              ),
              Positioned(
                left:120,
                top :700,
                child:
              SizedBox(
                width: 160,
                height: 40,
                  child: Text(
                  'Dooid',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF131313),
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    decoration: TextDecoration.none
                  ),
                ),
              )
            )
          ]
        ),
      ),
    );
  }
}
      // body: Center(
      //   child: Text('WELCOME',style: TextStyle(
      //     fontWeight: FontWeight.bold, 
      //     fontSize: 32,
      //     shadows:<Shadow>[
      //     Shadow(
      //     offset: Offset(5.0, 4.0),
      //     blurRadius: 5.0,
      //     color: Colors.grey.shade400
      //     ),
      //     ]
      //     ),
      //   ),
      // ),
      
    // );


    // Positioned(
            //           left: -784,
            //           top: -218,
            //           child: Container(
            //             width: 1600,
            //             height: 800,
            //             child: Stack(
            //               children: [
            //                 Positioned(
            //                   left: 0,
            //                   top: 0,
            //                   child: Container(
            //                     width: 1600,
            //                     height: 800,
            //                     decoration: BoxDecoration(
            //                       image: DecorationImage(
            //                         image: AssetImage(
            //                         "assets/logo.png"),
            //                         fit: BoxFit.fill,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 Positioned(
            //                   left: 739,
            //                   top: 0,
            //                   child: Container(
            //                     width: 360,
            //                     height: 800,
            //                     decoration: BoxDecoration(color: Color(0xFF131313)),
            //                   ),
            //                 ),
            //                 Positioned(
            //                   left: 739,
            //                   top: 0,
            //                   child: Container(
            //                     width: 360,
            //                     height: 800,
            //                     decoration: BoxDecoration(color: Color(0xFF131313)),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),