import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:test2/course.dart';

import 'secondary_course_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dataR;

  final CollectionReference usersCollectionR =
      FirebaseFirestore.instance.collection('dataR');

  Future<DocumentSnapshot<Map<String, dynamic>>> getRdata() async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshotR =
        await usersCollectionR.doc('v8IImhYTLHvd8rVbYjTJ').get()
            as DocumentSnapshot<Map<String, dynamic>>;

    return documentSnapshotR;
  }

  @override
  void initState() {
    super.initState();
    getRdata().then((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
      setState(() {
        dataR = documentSnapshot.data();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        leading: Icon(Icons.menu),
        title: Text('Admin Management'),
      ),
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.8,
            // left: 90,
            // bottom: 90,
            child: Image.asset(
              "assets/Backgrounds/10.png",
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Elevator Management",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 20),

                                    // color: course.color,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 20),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 24),
                                      height: 280,
                                      width: 260,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF7553F6),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 6, right: 8),
                                              child: GestureDetector(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'Elevator Status',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge!
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 12,
                                                              bottom: 8),
                                                      child: Text(
                                                        "adel",
                                                        style: TextStyle(
                                                          color: Colors.white38,
                                                        ),
                                                      ),
                                                    ),
                                                    // database ############################33#3#3####33##############
                                                    Container(
                                                      height: 100.0,
                                                      width: double.infinity,
                                                      color: Colors.redAccent,
                                                      child: dataR != null
                                                          ? Text(
                                                              dataR['state'],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontSize: 30),
                                                            )
                                                          : CircularProgressIndicator(),
                                                    ),
                                                    Spacer(),
                                                    Row(
                                                      children: List.generate(
                                                        3,
                                                        (index) =>
                                                            Transform.translate(
                                                          offset: Offset(
                                                              (-10 * index)
                                                                  .toDouble(),
                                                              0),
                                                          child: CircleAvatar(
                                                            radius: 20,
                                                            backgroundImage:
                                                                AssetImage(
                                                              "assets/avaters/Avatar ${index + 1}.jpg",
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SvgPicture.asset(
                                              'assets/icons/ios.svg'),
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
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 20),

                                    // color: course.color,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 20),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 24),
                                      height: 280,
                                      width: 260,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF7553F6),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 6, right: 8),
                                              child: GestureDetector(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'Elevator Problems',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge!
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 12,
                                                              bottom: 8),
                                                      child: Text(
                                                        "adel",
                                                        style: TextStyle(
                                                          color: Colors.white38,
                                                        ),
                                                      ),
                                                    ),
                                                    // database ############################33#3#3####33##############
                                                    Container(
                                                      height: 100.0,
                                                      width: double.infinity,
                                                      color: Colors.green,
                                                      child: const Text(
                                                        'test1',
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 30),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Row(
                                                      children: List.generate(
                                                        3,
                                                        (index) =>
                                                            Transform.translate(
                                                          offset: Offset(
                                                              (-10 * index)
                                                                  .toDouble(),
                                                              0),
                                                          child: CircleAvatar(
                                                            radius: 20,
                                                            backgroundImage:
                                                                AssetImage(
                                                              "assets/avaters/Avatar ${index + 1}.jpg",
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SvgPicture.asset(
                                              'assets/icons/ios.svg'),
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
                      ...recentCourses
                          .map((course) => Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: SecondaryCourseCard(
                                  title: course.title,
                                  iconsSrc: course.iconSrc,
                                  colorl: course.color,
                                ),
                              ))
                          .toList(),
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
}
