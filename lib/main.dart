// @dart=2.9

import 'package:advanced_splashscreen/advanced_splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test2/1.dart';
import 'package:test2/Emergency/Emergency.dart';
import 'package:test2/addUser.dart';
import 'package:test2/callElevator.dart';
import 'package:test2/cam.dart';
import 'package:test2/esp32.dart';
import 'package:test2/entry_point.dart';
import 'package:test2/homePage.dart';
import 'package:test2/home_screen.dart';
import 'package:test2/login/login.dart';
<<<<<<< HEAD
import 'package:test2/satat%20user.dart';

=======
>>>>>>> 346dd3d166dd5fea4df1b4f3d921c3b29e2290ee
import 'package:test2/start.dart';
import 'package:test2/team/screens/team_screen.dart';
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
<<<<<<< HEAD

=======
  
>>>>>>> 346dd3d166dd5fea4df1b4f3d921c3b29e2290ee
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
<<<<<<< HEAD
      // home: OnbodingScreen(),

      // home: LoginWidget(),
      home: stateuser(),
=======

        home: Recall(),

      // home: MyLogin(),
      //home: TeamScreen(),
      
>>>>>>> 346dd3d166dd5fea4df1b4f3d921c3b29e2290ee
    );
  }
}
