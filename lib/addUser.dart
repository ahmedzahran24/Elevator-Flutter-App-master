import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/homePage.dart';

//hello 2

class addUser extends StatefulWidget {
  @override
  _addUser createState() => _addUser();
}

class _addUser extends State<addUser> {
  var emailCont, passCont;
  late FirebaseFirestore firestore;
  var setdata;
  int _counterVal = 0;

  @override
  void initState() {
    super.initState();
    _getCounter();
    firestore = FirebaseFirestore.instance;
    emailCont = TextEditingController();
    passCont = TextEditingController();
    firestore = FirebaseFirestore.instance;
  }



  void _getCounter() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('counter')
        .get();
    setState(() {
      _counterVal = (documentSnapshot.data() as Map<String, dynamic>)['counterVal'] ?? 0;
    });
  }
  Future<void> _setCounter() async {
    final DocumentReference<Map<String, dynamic>> documentReference =
    FirebaseFirestore.instance.collection('users').doc('counter');
    await documentReference.set({'counterVal': _counterVal+1});
  }


  @override
  Widget build(BuildContext context) {
    CollectionReference users = firestore.collection('users');

    void writeData() {
      final userRef = users.doc('user$_counterVal');
      userRef.set({
        'email': emailCont.text,
        'password': passCont.text,
      });
    }

    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          // width: MediaQuery.of(context).size.width * 1.8,
          // left: 90,
          // bottom: 90,
          child: Image.asset(
            "assets/images/background.png",
          ),
        ),
        SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(
                'image/sign-up.png',
                height: 140,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.0,
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
                                  Color.fromARGB(255, 115, 100, 182),
                                  Color.fromARGB(255, 139, 128, 219),
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
                                  Color.fromARGB(255, 115, 100, 182),
                                  Color.fromARGB(255, 139, 128, 219),
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
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 8.0, 8.0, 8.0),
                              child: Container(
                                width: 200,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 115, 100, 182),
                                      Color.fromARGB(255, 139, 128, 219),
                                    ],
                                  ),
                                ),
                                child: MaterialButton(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: StadiumBorder(),
                                  onPressed: () {
                                    writeData();
                                    _getCounter();
                                    _setCounter();
                                    debugPrint(emailCont.text);
                                    debugPrint(passCont.text);
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Create Account  ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Icon(
                                              Icons.add_circle_outline_sharp,
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
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 8.0, 8.0, 8.0),
                              child: Container(
                                width: 130,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 115, 100, 182),
                                      Color.fromARGB(255, 139, 128, 219),
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
                                            builder: (context) => HomePage()));
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                            'Back ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
        ),
      ],
    ));

//Widgets and other code here
  }
}
