import 'package:dooid/data/accounts.dart';
import 'package:dooid/screens/main/home.dart';
import 'package:dooid/widgets/colors.dart';
import 'package:dooid/widgets/shortcuts/transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pin extends StatefulWidget {
  final Contact contact;

  const Pin({super.key, required this.contact});

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  var inputText = '';
  var actives = [false, false, false, false, false, false];
  var clears = [false, false, false, false, false, false];
  var values = [1, 2, 3, 4, 5, 6];
  var currentIndex = 0;
  var message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 150, 30, 100),
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Enter Your PIN',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < actives.length; i++)
                        AnimationBox(
                          clear: clears[i],
                          active: actives[i],
                          value: values[i],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: GridView.builder(
                padding: EdgeInsets.all(0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(4),
                  width: 50,
                  height: 50,
                  child: index == 9
                      ? SizedBox()
                      : Center(
                          child: MaterialButton(
                            onPressed: () {
                              if (index == 11) {
                                if (inputText.isNotEmpty) {
                                  inputText = inputText.substring(
                                      0, inputText.length - 1);
                                  clears = clears.map((e) => false).toList();
                                  currentIndex--;
                                  if (currentIndex >= 0) {
                                    setState(() {
                                      clears[currentIndex] = true;
                                      actives[currentIndex] = false;
                                    });
                                  } else {
                                    currentIndex = 0;
                                  }
                                }
                                return;
                              } else {
                                inputText +=
                                    numbers[index == 10 ? index - 1 : index]
                                        .toString();
                              }
                              if (inputText.length == 6) {
                                setState(() {
                                  clears = clears.map((e) => true).toList();
                                  actives = actives.map((e) => false).toList();
                                });
                                if (inputText == widget.contact.pin) {
                                  Navigator.of(context).push(BouncyPageRoute(
                                      destinationPage:
                                          Home(foundContact: widget.contact)));
                                  return;
                                }
                                inputText = '';
                                currentIndex = 0;
                                return;
                              }
                              clears = clears.map((e) => false).toList();
                              setState(() {
                                actives[currentIndex] = true;
                                currentIndex++;
                              });
                            },
                            color: Colors.white,
                            minWidth: 50,
                            height: 50,
                            child: index == 11
                                ? Icon(Icons.backspace)
                                : Text(
                                    '${numbers[index == 10 ? index - 1 : index]}',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                ),
                itemCount: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimationBox extends StatefulWidget {
  final clear;
  final value;
  final active;

  const AnimationBox(
      {super.key, this.clear = false, this.active = false, this.value});

  @override
  State<AnimationBox> createState() => _AnimationBoxState();
}

class _AnimationBoxState extends State<AnimationBox>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.clear) {
      animationController.forward(from: 0);
    }
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(),
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.active ? AppColors.black : AppColors.midGrey,
              ),
            ),
            Align(
              alignment:
                  Alignment(0, animationController.value / widget.value - 1),
              child: Opacity(
                opacity: 1 - animationController.value,
                child: Container(
                  width: 25,
                  height: 1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.active ? AppColors.black : AppColors.midGrey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
