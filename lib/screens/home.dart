import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text('HOME',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
      ),
    );
  }
}