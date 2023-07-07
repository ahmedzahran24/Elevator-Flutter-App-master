import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';






class problems extends StatefulWidget {

  
  const problems({super.key});

  @override
  State<problems> createState() => _problemsState();
}


class _problemsState extends State<problems> {
    @override
  void initState() {
    super.initState();
    subscribeToUpdates();
  }
    @override
    StreamSubscription<DocumentSnapshot>? subscription;
      String currentError ="0";
      String powerError = "0";

      void updateFloor(String upError) {
    if (currentError !=upError) {
      setState(() {
        currentError = upError;
      });
    }
  }
    void updatepowerError(String power1) {
    if (powerError  !=power1) {
      setState(() {
        powerError  = power1;
      });
    }
  }
    void subscribeToUpdates() {
    final collection = FirebaseFirestore.instance.collection('dataR');
    final document = collection.doc('recallStatee');

    subscription = document.snapshots().listen((snapshot) {
      if (snapshot.exists) {
        String fieldValue = snapshot.get('error1');
        String powerError55 =   snapshot.get('errorPower');
        updateFloor(fieldValue);
        updatepowerError(powerError55 );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    bool cust = true;

    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(80),
                  bottomLeft: Radius.circular(80)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.teal,
                  Color.fromARGB(255, 1, 78, 88),
                ],
              ),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 5),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                  title: Center(
                    child: Text('Elevator State ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.white)),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/loading.png'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          if ("0" == powerError) cm1(cust, 'NO Power Problem') else cm2(cust, 'Power Problem','The solution is Check the power'),
          if ("0" == currentError) cm1(cust, 'Safty OFF') else cm2(cust, 'Safty ON','The solution is Check the fork'),
          if ("0" == "0") cm1(cust, 'NO problem 3') else cm2(cust, 'Problem 3','The solution is '),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromRGBO(248, 248, 248, 1),
          color: Color.fromRGBO(17, 87, 119, 1),
          buttonBackgroundColor: Colors.white,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            Navigator.of(context).pop();
          },
          items: const [
            Icon(Icons.exit_to_app_sharp),
          ]),
    );
  }

  Padding cm2(bool cust, String t1,String t2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 4, 0),
                    Color.fromARGB(255, 255, 55, 0),
                    Colors.red,
                    Colors.redAccent
                    //add more colors for gradient
                  ],
                  begin: Alignment.topLeft, //begin of the gradient color
                  end: Alignment.bottomRight, //end of the gradient color
                  stops: [0, 0.2, 0.5, 0.8] //stops for individual color
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
            child: ExpansionTile(
              title: Text(t1),
              trailing: Icon(
                  cust ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 5, 223, 42),
                            Color.fromARGB(255, 3, 213, 14),
                            Color.fromARGB(255, 4, 168, 42),
                            Color.fromARGB(255, 5, 185, 56)
                            //add more colors for gradient
                          ],
                          begin:
                              Alignment.topLeft, //begin of the gradient color
                          end:
                              Alignment.bottomRight, //end of the gradient color
                          stops: [0, 0.2, 0.5, 0.8] //stops for individual color
                          //set the stops number equal to numbers of color
                          ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ListTile(
                      title: Text( t2 ),
                    ),
                  ),
                )
              ],
              onExpansionChanged: (bool expandad) {
                setState(() => cust = expandad);
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding cm1(bool cust, String t1) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 5, 223, 42),
                    Color.fromARGB(255, 3, 213, 14),
                    Color.fromARGB(255, 4, 168, 42),
                    Color.fromARGB(255, 5, 185, 56)
                    //add more colors for gradient
                  ],
                  begin: Alignment.topLeft, //begin of the gradient color
                  end: Alignment.bottomRight, //end of the gradient color
                  stops: [0, 0.2, 0.5, 0.8] //stops for individual color
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
            child: ExpansionTile(
              title: Text(t1),
              trailing: Icon(
                  cust ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 255, 255, 255),
                            Color.fromARGB(255, 255, 255, 255),
                            Color.fromARGB(255, 250, 255, 251),
                            Color.fromARGB(255, 255, 255, 255)
                            //add more colors for gradient
                          ],
                          begin:
                              Alignment.topLeft, //begin of the gradient color
                          end:
                              Alignment.bottomRight, //end of the gradient color
                          stops: [0, 0.2, 0.5, 0.8] //stops for individual color
                          //set the stops number equal to numbers of color
                          ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ListTile(
                      title: Text('not proplem '),
                    ),
                  ),
                )
              ],
              onExpansionChanged: (bool expandad) {
                setState(() => cust = expandad);
              },
            ),
          ),
        ],
      ),
    );
  }
}
