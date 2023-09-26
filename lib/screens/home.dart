
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
