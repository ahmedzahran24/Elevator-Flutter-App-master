import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DatabaseChangeListener {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _counterVal=0;

  void _getCounter() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('analysis')
        .doc('counter')
        .get();

    _counterVal =
        (documentSnapshot.data() as Map<String, dynamic>)['counterVal'] ?? 0;
  }

  Future<void> _setCounter() async {
    final DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection('analysis').doc('counter');
    await documentReference.set({'counterVal': _counterVal + 1});
  }

  Future<void> handleFloorChange(String newFloor) async {
    ////////////////////  store data
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    DateTime now2 = DateTime.now();
    String formattedTime = DateFormat('HH:mm').format(now2);

    _getCounter(); // Wait for counter value retrieval

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users =
        FirebaseFirestore.instance.collection('analysis');
    print(_counterVal);
    final dataRef = users.doc('appointments$_counterVal');

    await dataRef.set({
      'date': formattedDate,
      'time': formattedTime,
      'floor': newFloor,
    });
    print('Data stored successfully');
    await _setCounter(); // Increment counter value
  }

  void startListening() {
    _firestore
        .collection('dataR')
        .doc('recallStatee')
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data();
        final incomingValue = data?['incomingValue'];
        print('Value has been changed: $incomingValue');
        handleFloorChange(incomingValue);
      }
    });
  }
}
