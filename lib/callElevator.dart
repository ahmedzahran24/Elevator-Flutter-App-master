import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Recall extends StatefulWidget {
  @override
  _RecallState createState() => _RecallState();
}

class _RecallState extends State<Recall> {
  int currentFloor = 0;
  var databaseval;
    String? incom;
    String? callpo;

  @override
  void initState() {
    super.initState();
    showData();
  }

  void showData() async {
    var collection = FirebaseFirestore.instance.collection('dataR');
    var docSnapshot = await collection.doc('recallStatee').get();
    Map<String, dynamic> data = docSnapshot.data()!;
    String icom = data['incomingValue'];
    String callp = data['callPosition'];

    // Update the state of the widget with the retrieved user name
    setState(() {
      incom = icom;
      callpo = callp;
    });   
  }



  void updateFloor(int floorNumber) {
    setState(() {
      currentFloor = floorNumber;
    });
  }

  Future<bool> checkIncomingValue() async {
    bool isValueOne = false;


    return isValueOne;
  }

  void processIncomingValue() async {
    bool isValueOne = await checkIncomingValue();

    if (isValueOne) {
      print('The incoming value is 1.');
    } else {
      print('The incoming value is not 1.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$callpo Recall$incom'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Floor: $currentFloor',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => processIncomingValue(),
                  child: Text('1'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => updateFloor(2),
                  child: Text('2'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => updateFloor(3),
                  child: Text('3'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
