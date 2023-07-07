import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Alarm {
  String id;
  DateTime dateTime;
  bool triggered;

  Alarm({required this.id, required this.dateTime, this.triggered = false});
}

class Floor2 extends StatefulWidget {
  @override
  _Floor2State createState() => _Floor2State();
}

class _Floor2State extends State<Floor2> {
  String? callpo;
  String? incom;
  List<Alarm> alarms = [];
  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  set d1(int d1) {}

  void showData() async {
    var collection = FirebaseFirestore.instance.collection('dataR');
    var docSnapshot = await collection.doc('recallStatee').get();
    Map<String, dynamic> data = docSnapshot.data()!;
    String icom = data['incomingValue'];
    String callp = data['callPosition'];

    setState(() {
      incom = icom;
      callpo = callp; // Fix: Assign value to `callpo` variable
    });
  }

  void processIncomingValue(String val) {
    callpo = val;
    showData();
    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('dataR');
    final DocumentReference documentReference =
        collectionReference.doc('recallStatee');
    documentReference.update({
      'callPosition': val,
    });
  }

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
    notificationsPlugin.initialize(
      initializationSettings,
    ); // Fix: Initialize notificationsPlugin
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
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text("Floor 2"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60)),
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.pink],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
      ),
      body: ListView.builder(
        itemCount: alarms.length,
        itemBuilder: (context, index) {
          final alarm = alarms[index];
          final alarmTime =
              DateFormat('yy/MM/dd hh:mm a').format(alarm.dateTime);
          final String alarmStatus;
          if (alarm.triggered) {
            alarmStatus = 'Done';
            processIncomingValue('2');
          } else {
            alarmStatus = 'Processing';
          }

          return Container(
            height: 100,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(
                  30), //border radius exactly to ClipRRect
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
                ),
                //you can set more BoxShadow() here
              ],
            ),
            child: ClipRRect(
              //to clip overflown positioned containers.
              borderRadius: BorderRadius.circular(30),
              //if we set border radius on container, the overflown content get displayed at corner.
              child: Container(
                  child: Stack(
                children: <Widget>[
                  //Stack helps to overlap widgets
                  Positioned(
                      //positioned helps to position widget wherever we want.
                      top: -20,
                      left: -50, //position of the widget
                      child: Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange.withOpacity(
                                  0.5) //background color with opacity
                              ))),

                  Positioned(
                      left: -80,
                      top: -50,
                      child: Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.redAccent.withOpacity(0.5)))),

                  Positioned(
                    //main content container postition.
                    child: Center(
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            alarmTime,
                            style: new TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..shader = LinearGradient(
                                  colors: <Color>[
                                    Color.fromARGB(255, 3, 7, 243),
                                    Colors.deepPurpleAccent,
                                    Color.fromARGB(255, 43, 96, 209)
                                    //add more color here.
                                  ],
                                ).createShader(
                                  Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
                                ),
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Center(
                            child: Text(
                              alarmStatus,
                              style: new TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()
                                  ..shader = LinearGradient(
                                    colors: <Color>[
                                      Color.fromARGB(255, 255, 255, 255),
                                      Color.fromARGB(255, 255, 255, 255),
                                      Color.fromARGB(255, 255, 255, 255)
                                      //add more color here.
                                    ],
                                  ).createShader(
                                    Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
                                  ),
                              ),
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              alarms.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              )),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink,
        // this creates a notch in the center of the bottom bar
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.people,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                // Handle notification button press
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),

      // implement the floating button
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 3.0),
              color: Colors.greenAccent,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(500.0),
              onTap: () {
                _showDateTimePicker();
              },
              child: Icon(
                Icons.add,
                //size: 50,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(

      //   child: Icon(Icons.add),
      //   onPressed: () {

      //   },
      // ),
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
      });

      showNotification(
          alarm.id, 'Alert', 'The Elevator has been Started to Floor 1');
    });
  }
}
