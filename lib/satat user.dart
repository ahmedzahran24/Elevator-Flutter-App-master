import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test2/entry_point.dart';
import 'package:test2/unlock.dart';
import 'package:test2/unlouck/screens/getstarted.dart';
import 'package:test2/unlouck/screens/lock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/userMain.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'dart:async';


class stateuser extends StatefulWidget {
  const stateuser({super.key});

  @override
  State<stateuser> createState() => _stateuserState();
}

class _stateuserState extends State<stateuser> {
  String? userName;
 String error1Value = ' ';
   StreamSubscription<DocumentSnapshot>? subscription1;


  @override
  void initState() {
    super.initState();
    subscribeToUpdates2();
  }



  void updateFloor1(String floorNumber) {
    
      setState(() {
        error1Value = floorNumber;
      });
    
  }

  void subscribeToUpdates2() {
    final collection = FirebaseFirestore.instance.collection('dataR');
    final document = collection.doc('recallStatee');

    subscription1 = document.snapshots().listen((snapshot) {
      if (snapshot.exists) {
        String fieldValue = snapshot.get('error1');
        updateFloor1(fieldValue);
      }
    });
  }






  @override
  Widget build(BuildContext context) {
    final ism1 = MediaQuery.of(context).size.width >= 350;
    final v = 1;
    final x = 1;

    return Scaffold(
      backgroundColor: Color.fromRGBO(1, 50, 73, 1),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(80),
                  bottomLeft: Radius.circular(80)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.teal,
                  Color.fromARGB(255, 1, 78, 88),
                ],
              ),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 5),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                  title: Center(
                    child: Text('Elevator State : $error1Value ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.white)),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/loading.png'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 60,
            ),
            child: Center(
              child: Column(
                children: [
                  if (v == 1)
                    Container(
                      height: 250,
                      width: 350,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 180,
                              width: 330,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.teal,
                                      Color.fromARGB(255, 128, 5, 108),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 40,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 193, 35),
                                  shape: BoxShape.circle),
                              child: Image.asset('assets/images/checked.png'),
                            ),
                          ),
                          Positioned(
                            top: 90,
                            left: 40,
                            child: Text(
                              "The Elevator\n is Working",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Container(
                      height: 250,
                      width: 350,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 180,
                              width: 330,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.teal,
                                      Color.fromARGB(255, 128, 5, 108),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 40,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 193, 35),
                                  shape: BoxShape.circle),
                              child: Image.asset('assets/images/cross.png'),
                            ),
                          ),
                          Positioned(
                            top: 90,
                            left: 40,
                            child: Text(
                              "The elevator\n stopped",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (x == 1)
                    Container(
                      height: 250,
                      width: 350,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 180,
                              width: 330,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.teal,
                                      Color.fromARGB(255, 128, 5, 108),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 40,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset('assets/images/shield.png'),
                            ),
                          ),
                          Positioned(
                            top: 90,
                            left: 40,
                            child: Text(
                              "There are \n No Problems",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Container(
                      height: 250,
                      width: 350,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 180,
                              width: 330,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.teal,
                                      Color.fromARGB(255, 128, 5, 108),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 40,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset('assets/images/cross.png'),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            left: 40,
                            child: Text(
                              "There are Problems \n With the Elevator",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromRGBO(1, 50, 73, 1),
          color: Color.fromRGBO(17, 87, 119, 1),
          buttonBackgroundColor: Colors.white,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyHomePageuser()));
          },
          items: const [
            Icon(Icons.exit_to_app_sharp),
          ]),
    );
  }
}