import 'package:flutter/material.dart';

import 'package:just_audio/just_audio.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:test2/unlouck/helpers/colors.dart';
import 'package:test2/unlouck/screens/getstarted.dart';
import 'package:test2/unlouck/screens/lock.dart';
import 'package:test2/unlouck/widgets/backgroundcircle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    Future.delayed(Duration.zero, () {
      _updateSize();
    });
  }

  void _updateSize() {
    setState(() {
      _isContainerVisible = true;
    });
  }

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
              height: 10,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () async {
                // await _player.setAsset('assets/audio/success.m4a');
                // _player.play();
                unlockelv();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GetStarted()),
                );
              },
              child: Container(
                width: res_width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 27, 224, 198),
                      Color.fromARGB(255, 31, 236, 130),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 5),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.restart_alt,
                        color: Color.fromARGB(255, 115, 8, 8),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Lock',
                          style: Theme.of(context).textTheme.titleMedium!.merge(
                              const TextStyle(
                                  color: Color.fromARGB(255, 130, 11, 11),
                                  fontSize: 20)))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
