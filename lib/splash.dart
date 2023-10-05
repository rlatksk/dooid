import 'package:dooid/screens/auth/login.dart';
import 'package:dooid/screens/home.dart';
import 'package:dooid/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Setelah 2 detik, atur isLoading menjadi false untuk menampilkan loading screen berwarna merah
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });

    _checkUserSementara(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isLoading
          ? null
          : Colors
              .transparent, // Hapus latar belakang merah saat isLoading false
      body: _isLoading
          ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'lib/screens/img/splash_scr.png'), // Ganti dengan path gambar dari asset Anda
                  fit: BoxFit.cover, // Atur sesuai kebutuhan tampilan gambar
                ),
              ),
            )
          : wAppLoading(context), // Tampilkan wAppLoading saat isLoading false
    );
  }

  void _checkUserSementara(bool user) async {
    // Ini dapat dipanggil saat isLoading false
    await Future.delayed(Duration(seconds: 2));
    wPushReplaceTo(context, user ? Home() : Login());
  }
}
