import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Loop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimeLoopPage(),
    );
  }
}

class TimeLoopPage extends StatefulWidget {
  @override
  _TimeLoopPageState createState() => _TimeLoopPageState();
}

class _TimeLoopPageState extends State<TimeLoopPage> {
  List<DateTime> selectedDateTimes = [];
  bool variableChanged = false;
  bool isLooping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Loop'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select time(s):',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Select Time'),
              onPressed: _showTimePicker,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text(isLooping ? 'Stop Loop' : 'Start Loop'),
              onPressed: _toggleLoop,
            ),
            SizedBox(height: 16),
            Text(
              'Variable Status:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              variableChanged
                  ? 'Variable is changed'
                  : 'Variable is not changed',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void _showTimePicker() async {
    final TimeOfDay currentTime = TimeOfDay.now();
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: currentTime.hour, minute: currentTime.minute),
    );

    if (selectedTime != null) {
      setState(() {
        final selectedDateTime = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          selectedTime.hour,
          selectedTime.minute,
        );

        selectedDateTimes.add(selectedDateTime);
        variableChanged = false;
      });
    }
  }

  void _toggleLoop() {
    setState(() {
      isLooping = !isLooping;
    });

    if (isLooping) {
      _startLoop();
    }
  }

  void _startLoop() {
    final currentDateTime = DateTime.now();

    for (final selectedDateTime in selectedDateTimes) {
      if (currentDateTime.year == selectedDateTime.year &&
          currentDateTime.month == selectedDateTime.month &&
          currentDateTime.day == selectedDateTime.day &&
          currentDateTime.hour == selectedDateTime.hour &&
          currentDateTime.minute == selectedDateTime.minute) {
        setState(() {
          variableChanged = true;
        });
        break;
      }
    }

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        variableChanged = false;
      });

      _startLoop(); // Continue the loop
    });
  }
}
