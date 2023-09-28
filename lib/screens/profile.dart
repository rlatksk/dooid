import 'package:dooid/splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dooid/screens/TNC.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Text(
            'Profile',
            style: GoogleFonts.montserrat(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
              padding: const EdgeInsets.fromLTRB(15, 140, 15, 0),
              children: <Widget>[
                Text(
                  "Security",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Material(
                    child: ListTile(
                  onTap: () {
                    debugPrint("Ayam");
                  },
                  title: Text("Change Security Pin"),
                  leading: SvgPicture.asset(
                    "assets/lock.svg",
                    height: 35,
                    width: 35,
                  ),
                  tileColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2.5),
                      borderRadius: BorderRadius.circular(10)),
                )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Help",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Material(
                    child: ListTile(
                  onTap: () {
                    debugPrint("Ayam");
                  },
                  title: Text("Call Center"),
                  leading: SvgPicture.asset("assets/Call.svg"),
                  tileColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2.5),
                      borderRadius: BorderRadius.circular(10)),
                )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "About Us",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Material(
                    child: ListTile(
                  onTap: () {
                    debugPrint("Ayam");
                  },
                  title: Text("Dooid Guideline"),
                  leading: SvgPicture.asset(
                    "assets/Guide3.svg",
                    height: 35,
                    width: 35,
                  ),
                  tileColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2.5),
                      borderRadius: BorderRadius.circular(10)),
                )),
                SizedBox(
                  height: 10,
                ),
                Material(
                    child: ListTile(
                  onTap: () async {
                    await showDialog<void>(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: Stack(
                                clipBehavior: Clip.none,
                                children: <Widget>[
                                  Form(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Container(
                                                height: 400,
                                                child: const Expanded(
                                                  child: SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  "Dooid E-Money Wallet App - Terms and Conditions\n\n",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "Last Updated: [Date]\n\n",
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "1. Usage Agreement\n",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "By using the Dooid E-Money Wallet Application, you agree to these terms and conditions. This agreement encompasses your responsibilities while using the app, your acceptance of our privacy policy, and your acknowledgment of any applicable fees associated with certain transactions. It also outlines the procedures for account termination and the disclaimer regarding the app's warranty.\n\n",
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "2. User Responsibility\n",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "Your responsibility as a user of the Dooid E-Money Wallet App includes safeguarding your account information, adhering to all relevant laws and regulations, and refraining from engaging in any illegal activities while using the app. Your conduct should align with ethical standards and good practices, and any violation may result in account termination and legal action.\n\n",
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "3. Privacy\n",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "Our commitment to your privacy is paramount. Our Privacy Policy governs the collection, use, and protection of your data while using the app. By using the Dooid E-Money Wallet App, you provide consent to our privacy practices as described in the Privacy Policy.\n\n",
                                                            ),
                                                            TextSpan(
                                                              text: "4. Fees\n",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "Certain transactions conducted through the Dooid E-Money Wallet App may incur fees. Comprehensive details regarding these fees can be found within the app. It is important to review and understand these fees to make informed decisions when using the app for financial transactions.\n\n",
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "5. Termination\n",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "We reserve the right to terminate your access to the Dooid E-Money Wallet App with or without prior notice. We may take this action if you violate these terms and conditions, engage in fraudulent activities, or pose a security risk to the app. Our commitment is to ensure the safety and integrity of the app and its user community.\n\n",
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "6. Disclaimer\n",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "The Dooid E-Money Wallet App is provided \"as is\" without any warranties or guarantees. We do not make any representations or warranties, express or implied, regarding the app's functionality, reliability, or suitability for any particular purpose. Your use of the app is at your own risk, and we disclaim any liability for any damages that may arise from using the app.\n\n",
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "7. Limitation of Liability\n",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "To the maximum extent permitted by applicable law, we shall not be liable for any direct, indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues arising out of or in connection with your use of the Dooid E-Money Wallet App. This limitation of liability applies regardless of whether the damages arise from contract, tort, negligence, or any other legal theory.\n\n",
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "8. Changes\n",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "These terms and conditions may change without prior notice. It is your responsibility to review them periodically. Your continued use of the Dooid E-Money Wallet App following any modifications to these terms constitutes acceptance of those changes.\n\n",
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "9. Governing Law\n",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "These terms and conditions are governed by the laws of [Your Jurisdiction]. Any disputes arising out of or in connection with these terms shall be subject to the exclusive jurisdiction of the courts in [Your Jurisdiction].\n\n",
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "10. Contact\n",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "If you have any questions or concerns about these Terms and Conditions or the Dooid E-Money Wallet App, please feel free to contact us at [Contact Email Address]. We value your feedback and are here to assist you with any inquiries you may have.\n\n",
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  "Using the Dooid E-Money Wallet App implies your agreement to these terms and conditions.",
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                ))),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: ElevatedButton(
                                            child: const Text('Close'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ));
                  },
                  title: Text(" Terms and Conditions"),
                  leading: SvgPicture.asset(
                    "assets/TAC2.svg",
                    height: 35,
                    width: 35,
                  ),
                  tileColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2.5),
                      borderRadius: BorderRadius.circular(10)),
                )),
              ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 700),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Splash()),
            );
          },
          child: SvgPicture.asset(
            "assets/logout.svg",
            width: MediaQuery.sizeOf(context).width - 30,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 160),
        child: Container(
          width: MediaQuery.sizeOf(context).width - 35,
          height: 125,
          decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(
                width: 2.5,
                style: BorderStyle.solid,
                color: Colors.black26,
              )),
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(130, 205, 0, 0),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width - 25,
          height: 350,
          child: Text(
            "Hello Kevin!",
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 21),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(0, 230, 0, 0),
        child: SizedBox(
          width: 100,
          height: 350,
          child: Text(
            "08123123123",
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(280, 200, 0, 0),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 2.0,
              color: Colors.grey.shade400,
              style: BorderStyle.solid,
            ),
          ),
          onPressed: () {
            getImageGallery();
            // Add the functionality you want when the button is clicked
          },
          child: const Text(
            "Edit",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
      Container(
          padding: const EdgeInsets.fromLTRB(0, 190, 270, 0),
          child: SizedBox(
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.grey.shade600,
              child: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.grey.shade500,
                foregroundImage: const AssetImage("assets/cat.png"),
                child: SvgPicture.asset("assets/default.svg"),
              ),
            ),
          )),
      Container(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 140,
          child: SvgPicture.asset("assets/Bottom.svg"),
        ),
      )
    ]);
    // ]);
  }

  XFile? imgSet;
  getImageGallery() async {
    try{
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null)  return;
    final imageTemporary = XFile(img.path);
    setState(() {
      imgSet = imageTemporary;
    });
  } 
  catch(error) {
    print("error: $error");
  }
  }
}
