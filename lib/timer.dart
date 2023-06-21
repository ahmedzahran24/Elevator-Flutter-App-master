// ignore_for_file: depend_on_referenced_packages, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  runApp(AlarmApp());
}

class AlarmApp extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanmays Alarm App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AlarmScreen(flutterLocalNotificationsPlugin),
    );
  }
}

class AlarmScreen extends StatefulWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  AlarmScreen(this.flutterLocalNotificationsPlugin);

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectTDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      initialDate: _selectedDate,
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _scheduleAlarm() async {
    final now = tz.TZDateTime.now(tz.local);
    final selectedDateTime = tz.TZDateTime(
      tz.local,
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'Alarm App Notification Channel',
      '',
      importance: Importance.max,
      priority: Priority.high,
    );
    final platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await widget.flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Alarm',
      'Wake up Bhai !',
      selectedDateTime,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Alarm set for ${selectedDateTime.toString()} Bro'),
      ),
    );
  }

  var con;
  cm1() {
    con = 5;
  }

  cm2() {
    con = 7;
  }

  var time = DateTime.now();
  Future<void> loop() async {}

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    final initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: null,
    );

    widget.flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Sanmay Alarm App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'conunt: ${con} ',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Selected Date: ${time.day} ',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Selected Date: ${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day} ',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Selected Time: ${_selectedTime.format(context)}',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () => {
                _selectTime(context),
                _selectTDate(context),
              },
              child: const Text('Select Time'),
            ),
            InkWell(
              child: Container(
                width: 130,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 27, 224, 198),
                      Color.fromARGB(255, 57, 159, 227),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 5),
                  ],
                ),
                child: MaterialButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: StadiumBorder(),
                  onPressed: () {
                    for (var i = 0; i < 99999999; i++) {
                      if (_selectedDate.day == time.day)
                        cm1();
                      else
                        cm2();

                      i++;
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
