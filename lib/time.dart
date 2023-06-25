import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlarmPage(),
    );
  }
}

class Alarm {
  String id;
  DateTime dateTime;
  bool triggered;

  Alarm({required this.id, required this.dateTime, this.triggered = false});
}

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  List<Alarm> alarms = [];
  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  set d1(int d1) {}

  @override
  void initState() {
    super.initState();
    final initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final initializationSettingsIOS = DarwinInitializationSettings();
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
  }

  Future<void> onNotificationSelected(String? payload) async {
    debugPrint("Notification clicked: $payload");
  }

  Future<void> showNotification(String id, String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'Alarms',
      'Channel for alarm notifications',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await notificationsPlugin.show(0, title, body, platformChannelSpecifics,
        payload: id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarms'),
      ),
      body: ListView.builder(
        itemCount: alarms.length,
        itemBuilder: (context, index) {
          final alarm = alarms[index];
          final alarmTime =
              DateFormat('yy/MM/dd hh:mm a').format(alarm.dateTime);
          final alarmStatus = alarm.triggered ? 'Triggered' : 'Not triggered';
          final con = alarm.triggered ? 'Triggered' : 'Not triggered';
          return ListTile(
            title: Text(alarmTime),
            subtitle: Text(alarmStatus),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  alarms.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showDateTimePicker();
        },
      ),
    );
  }

  Future<void> _showDateTimePicker() async {
    final DateTime now = DateTime.now();
    final DateTime? selectedDateTime = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
    );

    if (selectedDateTime != null) {
      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(now),
      );

      if (selectedTime != null) {
        setState(() {
          final alarm = Alarm(
            id: UniqueKey().toString(),
            dateTime: DateTime(
              selectedDateTime.year,
              selectedDateTime.month,
              selectedDateTime.day,
              selectedTime.hour,
              selectedTime.minute,
            ),
          );
          alarms.add(alarm);

          _scheduleAlarm(alarm);
        });
      }
    }
  }

  Future<void> _scheduleAlarm(Alarm alarm) async {
    final now = DateTime.now();

    if (alarm.dateTime.isBefore(now)) {
      // If the alarm time is before the current time, set it for the next day
      alarm.dateTime = alarm.dateTime.add(Duration(days: 1));
    }

    final timeUntilAlarm = alarm.dateTime.difference(now);

    await Future.delayed(timeUntilAlarm, () {
      setState(() {
        alarm.triggered = true;
        d1 = 1;
      });

      showNotification(alarm.id, 'Alarm', 'Your alarm is ringing!');
    });
  }
}
