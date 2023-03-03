import 'package:flutter/material.dart';
import 'package:test2/login.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 900,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 52, 145, 238),
                Color.fromARGB(255, 23, 180, 227)
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset(
                      'image/2.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SingleChildScrollView(
                              child: Container(
                                child: Text(
                                  'Welcome to the Elevator App',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, top: 40, left: 20),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('image/3.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 50),
                                          child: Container(
                                            child: Text(
                                              'Admin Control Panel',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                          ),
                                          child: Container(
                                            child: Text(
                                              'Special for the responsible for',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                          ),
                                          child: Container(
                                            child: Text(
                                              'problems and malfunctions',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.orange,
                                    Colors.orangeAccent,
                                    Colors.red,
                                    Colors.redAccent
                                    //add more colors for gradient
                                  ],
                                  begin: Alignment
                                      .topLeft, //begin of the gradient color
                                  end: Alignment
                                      .bottomRight, //end of the gradient color
                                  stops: [
                                    0,
                                    0.2,
                                    0.5,
                                    0.8
                                  ] //stops for individual color
                                  //set the stops number equal to numbers of color
                                  ),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 25),
                                    blurRadius: 25,
                                    color: Colors.black54),
                              ],
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, top: 40, left: 20),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('image/4.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 50),
                                          child: Container(
                                            child: Text(
                                              'Members Dashboard',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                          ),
                                          child: Container(
                                            child: Text(
                                              'Users can follow the elevator',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                          ),
                                          child: Container(
                                            child: Text(
                                              'and control it remotely',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.orange,
                                    Colors.orangeAccent,
                                    Colors.red,
                                    Colors.redAccent
                                    //add more colors for gradient
                                  ],
                                  begin: Alignment
                                      .topLeft, //begin of the gradient color
                                  end: Alignment
                                      .bottomRight, //end of the gradient color
                                  stops: [
                                    0,
                                    0.2,
                                    0.5,
                                    0.8
                                  ] //stops for individual color
                                  //set the stops number equal to numbers of color
                                  ),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 25),
                                    blurRadius: 25,
                                    color: Colors.black54),
                              ],
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
j