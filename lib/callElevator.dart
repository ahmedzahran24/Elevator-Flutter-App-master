import 'package:flutter/material.dart';

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

  ButtonPad(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => onPressed(1),
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
