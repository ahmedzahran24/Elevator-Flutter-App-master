import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test2/entry_point.dart';
import 'package:test2/homePage.dart';
import 'package:test2/home_screen.dart';

//zahran

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
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
        _message = 'Invalid Username or Ppassword.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack (Admin)',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 1,
                            bottom: 1,
                            right: 1,
                          ),
                          child: Image.asset(
                            'image/11.png',
                            height: 150,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 35, right: 35),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    _message,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextField(
                                style: TextStyle(color: Colors.black),
                                controller: emailCont,
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    labelText: 'User Name',
                                    prefixIcon: Icon(Icons.person),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    )),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                style: TextStyle(),
                                controller: passCont,
                                obscureText: true,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    )),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(
                                          fontSize: 27,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor:
                                        Color.fromARGB(255, 9, 95, 224),
                                    child: IconButton(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        onPressed: () {
                                          _completeLogin();
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward,
                                        )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Back',
                                      style: TextStyle(
                                          fontSize: 27,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Color(0xff4c505b),
                                    child: IconButton(
                                        color: Colors.white,
                                        onPressed: () {
                                          _completeLogin();
                                        },
                                        icon: Icon(
                                          Icons.arrow_back,
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
