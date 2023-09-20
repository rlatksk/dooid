import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text('WELCOME',style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 32,
          shadows:<Shadow>[
          Shadow(
          offset: Offset(5.0, 4.0),
          blurRadius: 5.0,
          color: Colors.grey.shade400
          ),
          ]
          ),
        ),
      ),
    );
  }
}
