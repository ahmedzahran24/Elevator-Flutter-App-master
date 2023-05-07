// @dart=2.9

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test2/1.dart';
import 'package:test2/addUser.dart';
import 'package:test2/cam.dart';
import 'package:test2/entry_point.dart';
import 'package:test2/homePage.dart';
import 'package:test2/home_screen.dart';
import 'package:test2/start.dart';
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
  FirebaseFirestore db = FirebaseFirestore.instance;
  await db.collection("users").get().then((event) {
    for (var doc in event.docs) {
      print(" => ${doc.data()['username']}");
    }
  });

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
      // home: OnbodingScreen(),
      home: ExampleApp(),
    );
  }
}
