import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test2/entry_point.dart';
import 'package:test2/homePage.dart';
import 'package:test2/home_screen.dart';

//zahran

class LoginScreenAdmin extends StatefulWidget {
  @override
  _LoginScreenAdminState createState() => _LoginScreenAdminState();
}

class _LoginScreenAdminState extends State<LoginScreenAdmin> {
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  String _message = '';
  var userData;

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await usersCollection.doc('admin').get()
            as DocumentSnapshot<Map<String, dynamic>>;

    return documentSnapshot;
  }

  @override
  void initState() {
    super.initState();
    getUserData()
        .then((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
      setState(() {
        userData = documentSnapshot.data();
      });
    });
  }

  void _completeLogin() {
    if (userData != null &&
        passCont.text == userData['password'] &&
        emailCont.text == userData['username']) {
      debugPrint("if is True ");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => EntryPoint()));
    } else {
      setState(() {
        _message = 'Invalid username or password.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ism1 = MediaQuery.of(context).size.width >= 400;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.8,
            left: 90,
            bottom: 90,
            child: Image.asset(
              "assets/Backgrounds/Spline.png",
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    width: 50,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 40,
                        bottom: 40,
                        right: 40,
                      ),
                      child: Image.asset(
                        'image/11.png',
                        height: 250,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SIGN IN (Admin)',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Welcome to the Elevator User Login Interface',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(211, 255, 1, 1),
                                  Color.fromARGB(255, 110, 116, 232)
                                ],
                              ),
                            ),
                            child: TextFormField(
                              controller: emailCont,
                              decoration: InputDecoration(
                                  labelText: 'User Name',
                                  prefixIcon: Icon(Icons.person),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(211, 255, 1, 1),
                                  Color.fromARGB(255, 110, 116, 232)
                                ],
                              ),
                            ),
                            child: TextFormField(
                              controller: passCont,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8.0, 8.0, 8.0),
                          child: Container(
                            width: 160,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(211, 255, 1, 1),
                                  Color.fromARGB(255, 110, 116, 232)
                                ],
                              ),
                            ),
                            child: MaterialButton(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: StadiumBorder(),
                              onPressed: () {
                                _completeLogin();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Started',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8.0, 8.0, 8.0),
                          child: Container(
                            width: 100,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(211, 255, 1, 1),
                                  Color.fromARGB(255, 110, 116, 232)
                                ],
                              ),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Back',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        _message,
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      )
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     Text('Username: ${userData?['username'] ?? ""}'),
                  //     Text('password: ${userData?['password'] ?? ""}'),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
