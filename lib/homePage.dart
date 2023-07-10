import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test2/addUser.dart';
import 'package:test2/cam.dart';
import 'package:test2/problems.dart';
import 'package:test2/unlock.dart';
import 'package:test2/unlouck/screens/lock.dart';
import 'package:test2/unlouckadmin/screens/getstartedadmin.dart';
import 'package:test2/unlouckadmin/screens/lock.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    @override
  void initState() {
    super.initState();
    showDisplayName();
    subscribeToUpdates();
    getRdata().then((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
      setState(() {
        dataR = documentSnapshot.data();
      });
    });
  }
   @override
   StreamSubscription<DocumentSnapshot>? subscription;
      String power ="0";
      String error1 ="0";

      void updateFloor(String upError) {
    if (power !=upError) {
      setState(() {
        power = upError;
      });
    }
  }
  
      void updateerror1(String error11){
    if (error1 !=error11) {
      setState(() {
        error1 = error11;
      });
    }
  }
    void subscribeToUpdates() {
    final collection = FirebaseFirestore.instance.collection('dataR');
    final document = collection.doc('recallStatee');

    subscription = document.snapshots().listen((snapshot) {
      if (snapshot.exists) {
        String fieldValue = snapshot.get('errorPower');
        String  error15 = snapshot.get('error1');
        updateFloor(fieldValue);
        updateerror1(error15);
      }
    });
  }

  var dataR;
  String? userName;

  @override
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

  final CollectionReference usersCollectionR =
      FirebaseFirestore.instance.collection('dataR');

  Future<DocumentSnapshot<Map<String, dynamic>>> getRdata() async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshotR =
        await usersCollectionR.doc('unlock').get()
            as DocumentSnapshot<Map<String, dynamic>>;

    return documentSnapshotR;
  }


  @override
  Widget build(BuildContext context) {
    // camra ############################################33
    Future<void> _launchInWebViewWithoutJavaScript(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
        webViewConfiguration:
            const WebViewConfiguration(enableJavaScript: true),
      )) {
        throw Exception('Could not launch $url');
      }
    }

    // #######################33
    final v = 1;
    final x2 = 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 125, 119, 255),
        leading: Icon(Icons.menu),
        title: Text('Admin Management'),
      ),
      body: Stack(
        children: [
          Positioned(
            // width: MediaQuery.of(context).size.width * 1.1,
            height: 490,
            // left: 90,
            // bottom: 90,
            child: Image.asset(
              "assets/images/2.png",
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Elevator Management",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      if (power == "0")
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            width: 250,
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: 130,
                                    width: 230,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 168, 206, 231),
                                            Color.fromARGB(255, 129, 135, 227),
                                            Color.fromARGB(255, 74, 95, 229),
                                            Color.fromARGB(255, 92, 85, 222)
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 30,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    child: Image.asset(
                                        'assets/images/checked.png'),
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  left: 20,
                                  child: Text(
                                    "The Elevator is \n Working Now",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            width: 250,
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: 130,
                                    width: 230,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 168, 206, 231),
                                            Color.fromARGB(255, 129, 135, 227),
                                            Color.fromARGB(255, 74, 95, 229),
                                            Color.fromARGB(255, 92, 85, 222)
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 30,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    child:
                                        Image.asset('assets/images/cross.png'),
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  left: 20,
                                  child: Text(
                                    "The Elevator is \n not working",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      // #########################################
                      if (power == "0" && error1 == "0")
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            width: 250,
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: 130,
                                    width: 230,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 168, 206, 231),
                                            Color.fromARGB(255, 129, 135, 227),
                                            Color.fromARGB(255, 74, 95, 229),
                                            Color.fromARGB(255, 92, 85, 222)
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 30,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    child:
                                        Image.asset('assets/images/shield.png'),
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  left: 20,
                                  child: Text(
                                    "No Problems \nWith The Elevator",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            width: 250,
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: 130,
                                    width: 230,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 168, 206, 231),
                                            Color.fromARGB(255, 129, 135, 227),
                                            Color.fromARGB(255, 74, 95, 229),
                                            Color.fromARGB(255, 92, 85, 222)
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 30,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    child:
                                        Image.asset('assets/images/cross.png'),
                                  ),
                                ),
                                Positioned(
                                  top: 80,
                                  left: 20,
                                  child: Text(
                                    "There are Problems \nWith The Elevator",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Tools",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // con1####################################################3#3
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => problems()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 20),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 74, 95, 229),
                                      Color.fromARGB(255, 92, 85, 222),
                                      Color.fromARGB(255, 129, 135, 227),
                                      Color.fromARGB(255, 129, 145, 209),
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Problems',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text(
                                        "Admin can create accounts",
                                        style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                  child: VerticalDivider(
                                    // thickness: 5,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SvgPicture.asset(
                                    'assets/icons/maths8-svgrepo-com.svg',
                                    height: 28)
                              ],
                            ),
                          ),
                        ),
                      ),
                      // con1################################################################
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => addUser()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 20),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 74, 95, 229),
                                      Color.fromARGB(255, 92, 85, 222),
                                      Color.fromARGB(255, 129, 135, 227),
                                      Color.fromARGB(255, 129, 145, 209),
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Create Account',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text(
                                        "Admin can create accounts",
                                        style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                  child: VerticalDivider(
                                    // thickness: 5,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SvgPicture.asset('assets/icons/User.svg')
                              ],
                            ),
                          ),
                        ),
                      ),
                      // con1################################################################

                      // con2####################################################3#3
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EspCameraScreen()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 20),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 74, 95, 229),
                                      Color.fromARGB(255, 92, 85, 222),
                                      Color.fromARGB(255, 129, 135, 227),
                                      Color.fromARGB(255, 129, 145, 209),
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Elevator camera',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text(
                                        "You can see the Elevator",
                                        style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                  child: VerticalDivider(
                                    // thickness: 5,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SvgPicture.asset('assets/icons/s.svg',
                                    height: 28)
                              ],
                            ),
                          ),
                        ),
                      ),
                      // con2################################################################
                      // con2####################################################3#3
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            if (userName == "true") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => lockadmin()));
                            }
                            if (userName == "false") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GetStartedadmin()));
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 20),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 74, 95, 229),
                                      Color.fromARGB(255, 92, 85, 222),
                                      Color.fromARGB(255, 129, 135, 227),
                                      Color.fromARGB(255, 129, 145, 209),
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Elevator Unlock',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text(
                                        "You can unlock the Elevator",
                                        style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                  child: VerticalDivider(
                                    // thickness: 5,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SvgPicture.asset(
                                    'assets/icons/open-padlock.svg',
                                    height: 28)
                              ],
                            ),
                          ),
                        ),
                      ),
                      // con2################################################################
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container bbb(int x2, BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),

                  // color: course.color,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                if (x2 == 1)
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                      height: 280,
                      width: 260,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 168, 206, 231),
                              Color.fromARGB(255, 129, 135, 227),
                              Color.fromARGB(255, 74, 95, 229),
                              Color.fromARGB(255, 92, 85, 222)
                              //add more colors for gradient
                            ],
                            begin:
                                Alignment.topLeft, //begin of the gradient color
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
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6, right: 8),
                              child: GestureDetector(
                                child: Column(
                                  children: [
                                    Text(
                                      'Elevator Status',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, bottom: 8),
                                      child: Text(
                                        "******************",
                                        style: TextStyle(
                                          color: Colors.white38,
                                        ),
                                      ),
                                    ),
                                    // database ############################33#3#3####33##############
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(
                                    //           left: 60),
                                    //   child: Container(
                                    //     height: 100.0,
                                    //     width: double.infinity,
                                    //     decoration:
                                    //         BoxDecoration(
                                    //       color: Colors.green,
                                    //       borderRadius:
                                    //           const BorderRadius
                                    //                   .all(
                                    //               Radius
                                    //                   .circular(
                                    //                       110)),
                                    //     ),
                                    //     child: dataR != null
                                    //         ? Center(
                                    //             child: Text(
                                    //               dataR[
                                    //                   'state'],
                                    //               style: TextStyle(
                                    //                   color: Colors
                                    //                       .blue,
                                    //                   fontSize:
                                    //                       30),
                                    //             ),
                                    //           )
                                    //         : CircularProgressIndicator(),
                                    //   ),
                                    // ),
                                    Positioned(
                                      top: 0,
                                      left: 80,
                                      child: Container(
                                        height: 150,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                            'assets/images/shield.png'),
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: List.generate(
                                        3,
                                        (index) => Transform.translate(
                                          offset: Offset(
                                              (-10 * index).toDouble(), 0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // color: course.color,
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                      height: 280,
                      width: 260,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 168, 206, 231),
                              Color.fromARGB(255, 129, 135, 227),
                              Color.fromARGB(255, 74, 95, 229),
                              Color.fromARGB(255, 92, 85, 222)
                              //add more colors for gradient
                            ],
                            begin:
                                Alignment.topLeft, //begin of the gradient color
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
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6, right: 8),
                              child: GestureDetector(
                                child: Column(
                                  children: [
                                    Text(
                                      'Elevator Problems',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, bottom: 8),
                                      child: Text(
                                        "******************",
                                        style: TextStyle(
                                          color: Colors.white38,
                                        ),
                                      ),
                                    ),
                                    // database ############################33#3#3####33##############
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(
                                    //           left: 60),
                                    //   child: Container(
                                    //     height: 100.0,
                                    //     width: double.infinity,
                                    //     decoration:
                                    //         BoxDecoration(
                                    //       color: Colors.green,
                                    //       borderRadius:
                                    //           const BorderRadius
                                    //                   .all(
                                    //               Radius
                                    //                   .circular(
                                    //                       110)),
                                    //     ),
                                    //     child: dataR != null
                                    //         ? Center(
                                    //             child: Text(
                                    //               dataR[
                                    //                   'state'],
                                    //               style: TextStyle(
                                    //                   color: Colors
                                    //                       .blue,
                                    //                   fontSize:
                                    //                       30),
                                    //             ),
                                    //           )
                                    //         : CircularProgressIndicator(),
                                    //   ),
                                    // ),
                                    Positioned(
                                      top: 0,
                                      left: 80,
                                      child: Container(
                                        height: 150,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 0, 193, 35),
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                            'assets/images/cross.png'),
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: List.generate(
                                        3,
                                        (index) => Transform.translate(
                                          offset: Offset(
                                              (-10 * index).toDouble(), 0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // color: course.color,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container bb(int x, BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),

                  // color: course.color,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                if (x == 1)
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                      height: 280,
                      width: 260,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 168, 206, 231),
                              Color.fromARGB(255, 129, 135, 227),
                              Color.fromARGB(255, 74, 95, 229),
                              Color.fromARGB(255, 92, 85, 222)
                              //add more colors for gradient
                            ],
                            begin:
                                Alignment.topLeft, //begin of the gradient color
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
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6, right: 8),
                              child: GestureDetector(
                                child: Column(
                                  children: [
                                    Text(
                                      'Elevator Status',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, bottom: 8),
                                      child: Text(
                                        "******************",
                                        style: TextStyle(
                                          color: Colors.white38,
                                        ),
                                      ),
                                    ),
                                    // database ############################33#3#3####33##############
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(
                                    //           left: 60),
                                    //   child: Container(
                                    //     height: 100.0,
                                    //     width: double.infinity,
                                    //     decoration:
                                    //         BoxDecoration(
                                    //       color: Colors.green,
                                    //       borderRadius:
                                    //           const BorderRadius
                                    //                   .all(
                                    //               Radius
                                    //                   .circular(
                                    //                       110)),
                                    //     ),
                                    //     child: dataR != null
                                    //         ? Center(
                                    //             child: Text(
                                    //               dataR[
                                    //                   'state'],
                                    //               style: TextStyle(
                                    //                   color: Colors
                                    //                       .blue,
                                    //                   fontSize:
                                    //                       30),
                                    //             ),
                                    //           )
                                    //         : CircularProgressIndicator(),
                                    //   ),
                                    // ),
                                    Positioned(
                                      top: 0,
                                      left: 80,
                                      child: Container(
                                        height: 150,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 0, 193, 35),
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                            'assets/images/checked.png'),
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: List.generate(
                                        3,
                                        (index) => Transform.translate(
                                          offset: Offset(
                                              (-10 * index).toDouble(), 0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // color: course.color,
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                      height: 280,
                      width: 260,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 168, 206, 231),
                              Color.fromARGB(255, 129, 135, 227),
                              Color.fromARGB(255, 74, 95, 229),
                              Color.fromARGB(255, 92, 85, 222)
                              //add more colors for gradient
                            ],
                            begin:
                                Alignment.topLeft, //begin of the gradient color
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
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6, right: 8),
                              child: GestureDetector(
                                child: Column(
                                  children: [
                                    Text(
                                      'Elevator Status',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, bottom: 8),
                                      child: Text(
                                        "******************",
                                        style: TextStyle(
                                          color: Colors.white38,
                                        ),
                                      ),
                                    ),
                                    // database ############################33#3#3####33##############
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(
                                    //           left: 60),
                                    //   child: Container(
                                    //     height: 100.0,
                                    //     width: double.infinity,
                                    //     decoration:
                                    //         BoxDecoration(
                                    //       color: Colors.green,
                                    //       borderRadius:
                                    //           const BorderRadius
                                    //                   .all(
                                    //               Radius
                                    //                   .circular(
                                    //                       110)),
                                    //     ),
                                    //     child: dataR != null
                                    //         ? Center(
                                    //             child: Text(
                                    //               dataR[
                                    //                   'state'],
                                    //               style: TextStyle(
                                    //                   color: Colors
                                    //                       .blue,
                                    //                   fontSize:
                                    //                       30),
                                    //             ),
                                    //           )
                                    //         : CircularProgressIndicator(),
                                    //   ),
                                    // ),
                                    Positioned(
                                      top: 0,
                                      left: 80,
                                      child: Container(
                                        height: 150,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 0, 193, 35),
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                            'assets/images/cross.png'),
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: List.generate(
                                        3,
                                        (index) => Transform.translate(
                                          offset: Offset(
                                              (-10 * index).toDouble(), 0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // color: course.color,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
