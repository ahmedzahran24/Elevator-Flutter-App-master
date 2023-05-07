import 'package:flutter/material.dart';

import 'package:just_audio/just_audio.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:test2/unlouck/screens/lock.dart';
import 'package:test2/unlouck/widgets/backgroundcircle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/userMain.dart';

void unlockelv() async {
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('dataR');
  usersRef.doc('unlock').update({
    'state': "true",
  });
}

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted>
    with SingleTickerProviderStateMixin {
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
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePageuser()));
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromARGB(255, 27, 224, 198),
                          Color.fromARGB(255, 57, 193, 227),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 5),
                      ],
                    ),
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Align(
                alignment: Alignment.center,
                child: Text("Locked.",
                    style: Theme.of(context).textTheme.headline2!.merge(
                        const TextStyle(
                            color: Colors.white, fontFamily: 'UbuntuBold'))),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
                "The lock can be unlocked by moving \nthe button at the bottom of the screen.",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .merge(const TextStyle(color: Colors.white, fontSize: 16))),
          ),
          const SizedBox(
            height: 10,
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
                              'assets/images/key1.png',
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
          Builder(
            builder: (context) {
              final GlobalKey<SlideActionState> _key = GlobalKey();
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: res_width * 0.8,
                  child: SlideAction(
                    text: "Drag To Unlock",
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline6!
                        .merge(const TextStyle(color: Color(0xff28a5da))),
                    key: _key,
                    onSubmit: () async {
                      // await _player.setAsset('assets/audio/chimeup.mp3');
                      // _player.play();
                      unlockelv();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const lock()),
                      );
                    },
                    innerColor: Color(0xff28a5da),
                    outerColor: Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
