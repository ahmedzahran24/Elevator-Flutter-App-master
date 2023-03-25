import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/home_screen.dart';
import 'package:test2/userMain.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  String errorMessage = '';

  void getUsers() async {
    final CollectionReference usersRef =
        FirebaseFirestore.instance.collection('users');
    final QuerySnapshot querySnapshot = await usersRef.get();

    for (final QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      final data = documentSnapshot.data() as Map<String, dynamic>?;
      if (data != null &&
          data.containsKey('email') &&
          data.containsKey('password') &&
          data['email'] == emailCont.text &&
          data['password'] == passCont.text) {
        setState(() {
          errorMessage = '';
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => userMain()));
        return;
      }
    }

    setState(() {
      errorMessage = 'Invalid email or password';
    });
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
                              'SIGN IN (User)',
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
                          height: 20,
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
                                getUsers();
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
                      Text(errorMessage,
                          style: TextStyle(color: Colors.red, fontSize: 20)),
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
