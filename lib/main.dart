// @dart=2.9

import 'package:advanced_splashscreen/advanced_splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test2/1.dart';
import 'package:test2/Emergency/Emergency.dart';
import 'package:test2/addUser.dart';
import 'package:test2/blinkingTimer.dart';
import 'package:test2/callElevator.dart';
import 'package:test2/cam.dart';
import 'package:test2/change_listener.dart';
import 'package:test2/esp32.dart';
import 'package:test2/entry_point.dart';
import 'package:test2/homePage.dart';
import 'package:test2/home_screen.dart';
import 'package:test2/login/login.dart';
import 'package:test2/plot.dart';
import 'package:test2/problems.dart';
import 'package:test2/satat%20user.dart';
import 'package:test2/start.dart';
import 'package:test2/team/screens/team_screen.dart';
import 'package:test2/time.dart';
import 'package:test2/time/selected.dart';
import 'package:test2/timer.dart';
import 'package:test2/unlock.dart';
import 'package:test2/unlouck/screens/getstarted.dart';
import 'package:test2/unlouck/screens/lock.dart';
import 'package:test2/userMain.dart';
import 'firebase_options.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'normal_userLogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('here we go u mfs >>>');
  //hello

  DatabaseChangeListener().startListening();
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // home: Floor1(),

      home: OnbodingScreen(),
    );
  }
}
