import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fem = 2.0; // Anda perlu mengganti ini dengan faktor skalanya

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Lapisan pertama: Latar belakang
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff000000)),
                color: Color(0xffffffff),
                gradient: LinearGradient(
                  begin: Alignment(1, -0.98),
                  end: Alignment(-1, 1),
                  colors: <Color>[
                    Color(0xffc63c8f),
                    Color(0xff952b2b),
                    Color(0xff5b1834),
                  ],
                  stops: <double>[0, 0.464, 1],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0 * fem, 4 * fem),
                    blurRadius: 2 * fem,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("img/log.jpg"),
                  Center(
                    child: Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 24, // Sesuaikan dengan ukuran yang Anda inginkan
                        color: Colors.white, // Sesuaikan dengan warna yang Anda inginkan
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
