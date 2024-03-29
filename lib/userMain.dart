import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test2/Emergency/Emergency.dart';
import 'package:test2/callElevator.dart';
import 'package:test2/entry_point.dart';
import 'package:test2/home_screen.dart';
import 'package:test2/satat%20user.dart';
import 'package:test2/team/screens/team_screen.dart';
import 'package:test2/time/selected.dart';
import 'package:test2/unlock.dart';
import 'package:test2/unlouck/screens/getstarted.dart';
import 'package:test2/unlouck/screens/lock.dart';
import 'normal_userLogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePageuser extends StatefulWidget {
  const MyHomePageuser({super.key});

  @override
  State<MyHomePageuser> createState() => _MyHomePageuserState();
}

class _MyHomePageuserState extends State<MyHomePageuser> {
  String? userName;

  @override
  void initState() {
    super.initState();
    showDisplayName();
  }

  void showDisplayName() async {
    var collection = FirebaseFirestore.instance.collection('dataR');
    var docSnapshot = await collection.doc('unlock').get();

    Map<String, dynamic> data = docSnapshot.data()!;
    String name = data['state'];

    // Update the state of the widget with the retrieved user name
    setState(() {
      userName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ism1 = MediaQuery.of(context).size.width >= 350;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello !',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text('Good Morning',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white54)),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/user2.png'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(200))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      'User Control Panel',
                      style: new TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: <Color>[
                              Color.fromARGB(255, 177, 212, 21),
                              Color.fromARGB(255, 26, 218, 239),
                              Color.fromARGB(255, 23, 147, 200)
                              //add more color here.
                            ],
                          ).createShader(
                            Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
                          ),
                      ),
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 50,
                    children: [
                      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                      Container(
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
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: StadiumBorder(),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => stateuser()));
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: ism1
                                        ? Image.asset(
                                            'assets/images/loading.png',
                                            height: 80,
                                          )
                                        : Image.asset(
                                            'assets/images/loading.png',
                                            height: 60,
                                          )),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Center(
                                    child: ism1
                                        ? Text(
                                            'Elevator Status ',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text(
                                            'Elevator Status ',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                      Container(
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
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: StadiumBorder(),
                          onPressed: () {
                            if (userName == "true") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => lock()));
                            }
                            if (userName == "false") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GetStarted()));
                            }
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: ism1
                                        ? Image.asset(
                                            'assets/images/unlock2.png',
                                            height: 80,
                                          )
                                        : Image.asset(
                                            'assets/images/unlock2.png',
                                            height: 60,
                                          )),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Center(
                                    child: ism1
                                        ? Text(
                                            'Unlock Elevator',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text(
                                            'Unlock Elevator',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                      Container(
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
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: StadiumBorder(),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Recall()));
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: ism1
                                        ? Image.asset(
                                            'assets/images/sort.png',
                                            height: 80,
                                          )
                                        : Image.asset(
                                            'assets/images/sort.png',
                                            height: 60,
                                          )),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Center(
                                    child: ism1
                                        ? Text(
                                            'Elevator Request',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text(
                                            'Elevator Request',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                      Container(
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
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: StadiumBorder(),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Emergency()));
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: ism1
                                        ? Image.asset(
                                            'assets/images/emergency.png',
                                            height: 80,
                                          )
                                        : Image.asset(
                                            'assets/images/emergency.png',
                                            height: 60,
                                          )),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Center(
                                    child: ism1
                                        ? Text(
                                            'Emergency',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text(
                                            'Emergency',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                      Container(
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
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: StadiumBorder(),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => selected()));
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: ism1
                                        ? Image.asset(
                                            'assets/images/stopwatch.png',
                                            height: 80,
                                          )
                                        : Image.asset(
                                            'assets/images/stopwatch.png',
                                            height: 60,
                                          )),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Center(
                                    child: ism1
                                        ? Text(
                                            'Timer',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text(
                                            'Timer',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                      Container(
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
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: StadiumBorder(),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: ism1
                                        ? Image.asset(
                                            'assets/images/left.png',
                                            height: 80,
                                          )
                                        : Image.asset(
                                            'assets/images/left.png',
                                            height: 60,
                                          )),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Center(
                                    child: ism1
                                        ? Text(
                                            'Exit',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text(
                                            'Eixt',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  itemDashboard(String title, IconData iconData, Color background) => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: Colors.white)),
            const SizedBox(height: 8),
            Text(title.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      );
}
