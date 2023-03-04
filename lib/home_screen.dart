import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                children: [
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Image.asset(
                                'image/2.png',
                                height: 150,
                                width: 200,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Text(
                                  'Welcome to the Elevator Application',
                                  style: new TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..shader = LinearGradient(
                                        colors: <Color>[
                                          Colors.pinkAccent,
                                          Colors.deepPurpleAccent,
                                          Colors.red
                                          //add more color here.
                                        ],
                                      ).createShader(
                                        Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
                                      ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'An Application to Control the Elevator Designed by the MAS Team ',
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..shader = LinearGradient(
                                        colors: <Color>[
                                          Color.fromARGB(255, 0, 0, 0),
                                          Color.fromARGB(255, 0, 0, 0),
                                          Color.fromARGB(255, 0, 0, 0)
                                          //add more color here.
                                        ],
                                      ).createShader(
                                        Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 8.0, 8.0, 8.0),
                        child: Container(
                          width: 160,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(255, 255, 0, 0),
                                Color.fromARGB(255, 119, 12, 186)
                              ],
                            ),
                          ),
                          child: MaterialButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: StadiumBorder(),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Exit',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Icon(
                                    Icons.exit_to_app,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
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
