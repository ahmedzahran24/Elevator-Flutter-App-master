import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var dataR;

  final CollectionReference usersCollectionR = FirebaseFirestore.instance.collection('dataR');


  Future<DocumentSnapshot<Map<String, dynamic>>> getRdata() async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshotR =
    await usersCollectionR.doc('v8IImhYTLHvd8rVbYjTJ').get() as DocumentSnapshot<Map<String, dynamic>>;

    return documentSnapshotR;
  }
  @override
  void initState() {
    super.initState();
    getRdata().then((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
      setState(() {
        dataR = documentSnapshot.data();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        leading: Icon(Icons.menu),
        title: Text('elvator'),
      ),

      body: Column(
        children: [
          Container(
            height: 100.0,
            width: double.infinity,
            color: Colors.green,
            child: const Text(
              'test1',
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ),
          Container(
            height: 100.0,
            width: double.infinity,
            color: Colors.redAccent,
            child: dataR != null ? Text(
              dataR['state'],
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ) : CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}