import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

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
    _getCounter();
  }

  void showData() async {
    var collection = FirebaseFirestore.instance.collection('dataR');
    var docSnapshot = await collection.doc('recallStatee').get();
    Map<String, dynamic> data = docSnapshot.data()!;
    String icom = data['incomingValue'];
    String callp = data['callPosition'];

    setState(() {
      incom = icom;
      callpo = callp;
    });
  }

  void handleFloorChange(String newFloor) {
    ////////////////////  store data
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    print(formattedDate);
    DateTime now2 = DateTime.now();
    String formattedTime = DateFormat('HH:mm').format(now2);
    print(formattedTime);
    _getCounter();
    print('Current floor changed: $newFloor');
    
    FirebaseFirestore firestore = FirebaseFirestore.instance;
        CollectionReference users = FirebaseFirestore.instance.collection('analysis');
       final dataRef = users.doc('appointments$_counterVal');

     dataRef.set({
      'date': formattedDate,
      'time': formattedTime,
      'floor': newFloor,
    });

    _setCounter();
    print("function done");
  }

  void updateFloor(String floorNumber) {
    if (currentFloor != floorNumber) {
      setState(() {
        currentFloor = floorNumber;
      });
      handleFloorChange(floorNumber);
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
    showData();
    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('dataR');
    final DocumentReference documentReference =
        collectionReference.doc('recallStatee');
    documentReference.update({
      'callPosition': val,
    });
  }

  void _getCounter() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('analysis')
        .doc('counter')
        .get();
    setState(() {
      _counterVal =
          (documentSnapshot.data() as Map<String, dynamic>)['counterVal'] ?? 0;
    });
    print(_counterVal);
  }

  Future<void> _setCounter() async {
    final DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection('analysis').doc('counter');
    await documentReference.set({'counterVal': _counterVal + 1});
    print("counter have been set ");
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
