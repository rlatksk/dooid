import 'package:flutter/material.dart';

class TNC extends StatefulWidget {
  @override
  State<TNC> createState() => _TNCState();
}

class _TNCState extends State<TNC> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
  TextSpan(
    children: [
      TextSpan(
        text: "Dooid E-Money Wallet App - Terms and Conditions\n\n",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: "Last Updated: [Date]\n\n",
      ),
      TextSpan(
        text: "1. Usage Agreement\n",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: "By using the Dooid E-Money Wallet Application, you agree to these terms.\n\n",
      ),
      TextSpan(
        text: "2. User Responsibility\n",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: "Protect your account info and adhere to the law while using the App.\n\n",
      ),
      TextSpan(
        text: "3. Privacy\n",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: "Our Privacy Policy governs data collection and use.\n\n",
      ),
      TextSpan(
        text: "4. Fees\n",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: "Certain transactions may incur fees; details are in the App.\n\n",
      ),
      TextSpan(
        text: "5. Termination\n",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: "We can terminate your access with or without notice.\n\n",
      ),
      TextSpan(
        text: "6. Disclaimer\n",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: "The App is provided \"as is\" with no warranties.\n\n",
      ),
      TextSpan(
        text: "7. Limitation of Liability\n",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: "We're not liable for any damages due to App use.\n\n",
      ),
      TextSpan(
        text: "8. Changes\n",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: "Terms may change without notice; continued use is acceptance.\n\n",
      ),
      TextSpan(
        text: "9. Governing Law\n",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: "These terms follow the laws of [Your Jurisdiction].\n\n",
      ),
      TextSpan(
        text: "10. Contact\n",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: "Questions? Contact us at [Contact Email Address].\n\n",
      ),
      TextSpan(
        text: "Using Dooid E-Money Wallet implies your agreement to these terms.",
      ),
    ],
  ),
);
  }
}
