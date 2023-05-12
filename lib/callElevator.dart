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

    // Update the state of the widget with the retrieved values
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

  void processIncomingValue(String val) {
    showData();
    if (incom != '1') {
      final CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('dataR');
      final DocumentReference documentReference =
          collectionReference.doc('recallStatee');
      documentReference.update({
        'callPosition': val,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recall $callpo $incom'),
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
                  onPressed: () => processIncomingValue('1'),
                  child: Text('1'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => processIncomingValue('2'),
                  child: Text('2'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => processIncomingValue('3'),
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
