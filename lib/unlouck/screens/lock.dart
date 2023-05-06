import 'dart:async';

import 'package:flutter/material.dart';

import 'package:just_audio/just_audio.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:test2/unlouck/helpers/colors.dart';
import 'package:test2/unlouck/screens/getstarted.dart';
import 'package:test2/unlouck/screens/lock.dart';
import 'package:test2/unlouck/widgets/backgroundcircle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void unlockelv() async {
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('dataR');
  usersRef.doc('unlock').update({
    'state': false,
  });
}

class lock extends StatefulWidget {
  const lock({super.key});

  @override
  State<lock> createState() => _lockState();
}

class _lockState extends State<lock> with SingleTickerProviderStateMixin {
  final _player = AudioPlayer();

  bool _isContainerVisible = false;
  Offset offset = const Offset(120, 0);
  final double height = 200;
  final double width = 200;
  bool charactermoving = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 17), () {
      unlockelv();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GetStarted()),
      );
    });
    Future.delayed(Duration.zero, () {
      _updateSize();
    });
  }

  void _updateSize() {
    setState(() {
      _isContainerVisible = true;
    });
  }

  CountDownController _controller = CountDownController();
  bool _isPause = false;
  @override
  Widget build(BuildContext context) {
    final res_width = MediaQuery.of(context).size.width;
    final res_height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff28a5da),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text("UnLocked.",
                style: Theme.of(context).textTheme.headline2!.merge(
                    const TextStyle(
                        color: Colors.white, fontFamily: 'UbuntuBold'))),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
                "Press the lock button to re-lock \nelevator and return to the unlock screen.",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .merge(const TextStyle(color: Colors.white, fontSize: 16))),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: _isContainerVisible ? res_height * 0.5 : 0.0,
            width: _isContainerVisible ? res_width * 0.9 : 0.0,
            curve: Curves.easeOut,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  right: offset.dx - (width / 2),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      BackgroundCircle(
                        circleWidth: res_width * 0.9,
                        circleBorderWidth: 80.0,
                        circleOpacity: 0.2,
                        circleColor: Colors.white,
                      ),
                      BackgroundCircle(
                        circleWidth: res_width * 0.8,
                        circleBorderWidth: 40.0,
                        circleOpacity: 0.3,
                        circleColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onPanUpdate: (details) {
                    RenderBox getBox = context.findRenderObject() as RenderBox;
                    setState(() {
                      offset = getBox.localToGlobal(details.globalPosition);
                      charactermoving = true;
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      offset = const Offset(120, 0);
                      charactermoving = false;
                    });
                  },
                  child: SizedBox(
                    height: res_height * 0.5,
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                          left: offset.dx - (width / 1.6),
                          child: SizedBox(
                            width: res_width * 1,
                            height: res_height * 0.5,
                            child: Image.asset(
                              'assets/images/key.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onPanUpdate: (details) {
              RenderBox getBox = context.findRenderObject() as RenderBox;
              setState(() {
                offset = getBox.localToGlobal(details.globalPosition);
                charactermoving = true;
              });
            },
            onPanEnd: (details) {
              setState(() {
                offset = const Offset(120, 0);
                charactermoving = false;
              });
            },
            child: SizedBox(
              height: 1,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Center(
            child: CircularCountDownTimer(
              width: MediaQuery.of(context).size.width / 3.5,
              height: MediaQuery.of(context).size.height / 8,
              duration: 14,
              fillColor: Colors.amber,
              controller: _controller,
              backgroundColor: Colors.white54,
              strokeWidth: 10.0,
              strokeCap: StrokeCap.round,
              isTimerTextShown: true,
              isReverse: false,
              onComplete: () {
                Alert(
                        context: context,
                        title: 'The Elevator is locked',
                        style: AlertStyle(
                          isCloseButton: true,
                          isButtonVisible: false,
                          titleStyle: TextStyle(
                            color: Color.fromARGB(255, 43, 43, 43),
                            fontSize: 30.0,
                          ),
                        ),
                        type: AlertType.success)
                    .show();
              },
              textStyle: TextStyle(fontSize: 50.0, color: Colors.black),
              ringColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
