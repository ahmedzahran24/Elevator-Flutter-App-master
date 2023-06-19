import 'dart:async';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:test2/userMain.dart';

class Recall extends StatefulWidget {
  @override
  _RecallState createState() => _RecallState();
}

class _RecallState extends State<Recall> {
  String currentFloor = '0';
  var databaseval;
  String? incom;
  String? callpo;
  int _counterVal = 0;
  StreamSubscription<DocumentSnapshot>? subscription;

  @override
  void initState() {
    super.initState();
    showData();
    subscribeToUpdates();
  }

  void showData() async {
    var collection = FirebaseFirestore.instance.collection('dataR');
    var docSnapshot = await collection.doc('recallStatee').get();
    Map<String, dynamic> data = docSnapshot.data()!;
    String icom = data['incomingValue'];
    String callp = data['callPosition'];

    setState(() {
      incom = icom;
      callpo;
    });
  }

  void updateFloor(String floorNumber) {
    if (currentFloor != floorNumber) {
      setState(() {
        currentFloor = floorNumber;
      });
    }
  }

  void subscribeToUpdates() {
    final collection = FirebaseFirestore.instance.collection('dataR');
    final document = collection.doc('recallStatee');

    subscription = document.snapshots().listen((snapshot) {
      if (snapshot.exists) {
        String fieldValue = snapshot.get('incomingValue');
        updateFloor(fieldValue);
      }
    });
  }

  void processIncomingValue(String val) {
    callpo = val;
    showData();
    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('dataR');
    final DocumentReference documentReference =
        collectionReference.doc('recallStatee');
    documentReference.update({
      'callPosition': val,
    });
  }

  Widget keyField(numb) {
    return InkWell(
      onTap: () => processIncomingValue(numb),
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
              numb,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget keyField2(numb) {
    return InkWell(
      child: Container(
        height: 60,
        width: 40,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 224, 132, 27),
                Color.fromARGB(255, 232, 3, 3),
              ],
            ),
            borderRadius: BorderRadius.circular(60)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              numb,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 30, 74, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(4, 49, 121, 1),
        title: Center(child: Text('Elevator Request')),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 180,
                    width: 330,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 0, 0, 0),
                            Color.fromARGB(255, 0, 0, 0),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 246, 35, 35),
                              blurRadius: 10),
                        ],
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Current Floor : $currentFloor',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Required Floor : $callpo ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(255, 4, 231, 91)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 80),
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        shrinkWrap: true,
                        children: [
                          keyField("1"),
                          keyField("2"),
                          keyField("3"),
                          keyField2("4"),
                          keyField2("5"),
                          keyField2("6"),
                          keyField2("7"),
                          keyField2("8"),
                          keyField2("9"),
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
