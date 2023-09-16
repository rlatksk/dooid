import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; // Indeks item yang dipilih

  @override
  Widget build(BuildContext context) {
    double fem = 1.0;

    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: _selectedIndex, // Indeks menentukan tampilan yang ditampilkan
          children: [
            // Laman Home (indeks 0)
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
              child: Center(
                child: Text(
                  'Home Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Color(0xff000000)),
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
              child: Center(
                child: Text(
                  'Pay Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),

            // Laman Account (indeks 2)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Color(0xff000000)),
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
              child: Center(
                child: Text(
                  'Account Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:
              Colors.white, // Ubah sesuai latar belakang yang Anda inginkan
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payments_outlined),
              label: 'Pay',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Account',
            ),
          ],
          selectedItemColor: Color(0xffc63c8f), // Warna teks item yang dipilih
          unselectedItemColor:
              Colors.grey, // Warna teks item yang tidak dipilih
          selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold), // Gaya teks item yang dipilih
          unselectedLabelStyle: TextStyle(
              fontWeight:
                  FontWeight.normal), // Gaya teks item yang tidak dipilih
          currentIndex: _selectedIndex, // Mengikuti indeks yang dipilih
          onTap: (int index) {
            setState(() {
              _selectedIndex = index; // Mengubah indeks yang dipilih
            });
          },
        ),
      ),
    );
  }
}
