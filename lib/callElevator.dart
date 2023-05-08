import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Recall extends StatefulWidget {
  @override
  _RecallState createState() => _RecallState();
}

class _RecallState extends State<Recall> {
  int elevatorPosition = 1;

  void moveToFloor(int floor) {
    setState(() {
      elevatorPosition = floor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elevator Position'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Current Position: $elevatorPosition',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ButtonPad(moveToFloor),
        ],
      ),
    );
  }
}

class ButtonPad extends StatelessWidget {
  final Function(int) onPressed;
  int? incomingValue;

  Future<int> getIncomingValue() async {
    int value = -1;

    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('dataR')
          .doc('recallState')
          .get();

      print('Snapshot data: ${snapshot.data()}');

      if (snapshot.exists) {
        Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

        if (data != null && data.containsKey('incomingValue')) {
          value = data['incomingValue'];
        }
      } else {
        debugPrint('Snapshot does not exist');
      }
    } catch (e) {
      debugPrint('Error retrieving value: $e');
    }

    return value;
  }

  Future<void> setCallPosition(int newPosition) async {
    //set the vale to data base :)
    try {
      await FirebaseFirestore.instance
          .collection('dataR')
          .doc('recallState')
          .update({'callPosition': newPosition});
      print('Call position set successfully');
    } catch (e) {
      print('Error setting call position: $e');
    }
  }

void Function() button_1() {
  return () async {
    int incomingValue = await getIncomingValue(); 
    if (incomingValue == 1) {
      debugPrint('Hooray');
    } else {
      debugPrint(incomingValue.toString());
    }
  };
}


  ButtonPad(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: button_1(),
          child: Text('1'),
        ),
        ElevatedButton(
          onPressed: () => onPressed(2),
          child: Text('2'),
        ),
        ElevatedButton(
          onPressed: () => onPressed(3),
          child: Text('3'),
        ),
      ],
    );
  }
}
