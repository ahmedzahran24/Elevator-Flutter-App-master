import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test2/homePage.dart';
import 'package:test2/login.dart';
import 'firebase_options.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 print('here we go u mfs >>>');
  //hello
  FirebaseFirestore db = FirebaseFirestore.instance;
  await db.collection("users").get().then((event) {   for (var doc in event.docs) {     print(" => ${doc.data()['username']}");   } });


  runApp(Myapp());

}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: LoginScreen(),

     );
  }

}