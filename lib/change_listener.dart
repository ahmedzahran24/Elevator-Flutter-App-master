import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseChangeListener {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void startListening() {
    _firestore.collection('your_collection').doc('your_document').snapshots().listen((snapshot) {
      // Perform your desired actions based on the database change
      if (snapshot.exists) {
        // Document exists, do something
      } else {
        // Document doesn't exist, do something else
      }
    });
  }
}
