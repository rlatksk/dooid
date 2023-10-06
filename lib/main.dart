import 'package:dooid/data/accounts.dart';
import 'package:dooid/screens/onboarding.dart';
import 'package:dooid/data/contactProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ContactProvider(contacts), // Initialize with your data
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Onboarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
