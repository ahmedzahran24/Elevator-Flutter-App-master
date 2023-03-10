import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test2/homePage.dart';
import 'package:test2/home_screen.dart';

//zahran

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
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
                        'image/1.png',
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
                              'SIGN IN',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Welcome to the Elevator User Login Interface',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50,
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
                          height: 40,
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
                          height: 30,
                        ),
                        SingleChildScrollView(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 8.0, 8.0, 8.0),
                                  child: Container(
                                    width: 150,
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
                                                builder: (context) =>
                                                    HomeScreen()));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 1, left: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Icon(
                                                Icons.arrow_back,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                'Go Back',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ism1
                                    ? Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 8.0, 8.0, 8.0),
                                        child: Container(
                                          width: 160,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(80),
                                            gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromARGB(211, 255, 1, 1),
                                                Color.fromARGB(
                                                    255, 110, 116, 232)
                                              ],
                                            ),
                                          ),
                                          child: MaterialButton(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: StadiumBorder(),
                                            onPressed: () {
                                              _completeLogin();
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    'Get Started',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                      )
                                    : Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 45, right: 20),
                                          child: Container(
                                            width: 160,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(80),
                                              gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color.fromARGB(
                                                      211, 255, 1, 1),
                                                  Color.fromARGB(
                                                      255, 110, 116, 232)
                                                ],
                                              ),
                                            ),
                                            child: MaterialButton(
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: StadiumBorder(),
                                              onPressed: () {
                                                _completeLogin();
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        'Get Started',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
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
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    children: [Text(_message)],
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
