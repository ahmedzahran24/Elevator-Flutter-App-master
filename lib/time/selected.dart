import 'dart:async';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:test2/time/floor1.dart';
import 'package:test2/time/floor3.dart';
import 'package:test2/userMain.dart';

import 'floor2.dart';

class selected extends StatefulWidget {
  @override
  _selected createState() => _selected();
}

class _selected extends State<selected> {
  String currentFloor = '0';
  var databaseval;
  String? incom;
  String? callpo;
  int _counterVal = 0;
  StreamSubscription<DocumentSnapshot>? subscription;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 30, 74, 1),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("Determine The FLoor"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60)),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 3, 52, 107),
                Color.fromARGB(255, 2, 79, 124),
                Color.fromARGB(255, 6, 64, 131),
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text(
                    'Select The Desired Floor',
                    style: TextStyle(
                        fontSize: 24, color: Color.fromARGB(255, 4, 231, 91)),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 200),
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        shrinkWrap: true,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Floor1()));
                            },
                            child: Container(
                              height: 60,
                              width: 40,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 4, 231, 12),
                                      Color.fromARGB(255, 62, 219, 119),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(60)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1',
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Floor2()));
                            },
                            child: Container(
                              height: 60,
                              width: 40,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 4, 231, 12),
                                      Color.fromARGB(255, 62, 219, 119),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(60)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2',
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Floor3()));
                            },
                            child: Container(
                              height: 60,
                              width: 40,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 4, 231, 12),
                                      Color.fromARGB(255, 62, 219, 119),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(60)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3',
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ElevatedButton(
                    //       onPressed: () => processIncomingValue('1'),
                    //       child: Text('1'),
                    //     ),
                    //     SizedBox(width: 16),
                    //     ElevatedButton(
                    //       onPressed: () => processIncomingValue('2'),
                    //       child: Text('2'),
                    //     ),
                    //     SizedBox(width: 16),
                    //     ElevatedButton(
                    //       onPressed: () => processIncomingValue('3'),
                    //       child: Text('3'),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromRGBO(3, 30, 74, 1),
          color: Color.fromRGBO(4, 49, 121, 1),
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
